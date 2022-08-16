package com.supermm.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supermm.mapper.CartMapper;
import com.supermm.mapper.MemberMapper;
import com.supermm.mapper.OrderMapper;
import com.supermm.mapper.ProductMapper;
import com.supermm.model.CartVO;
import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;
import com.supermm.model.OrderCancelDTO;
import com.supermm.model.OrderDTO;
import com.supermm.model.OrderItemDTO;
import com.supermm.model.OrderPageDTO;
import com.supermm.model.OrderPageItemDTO;
import com.supermm.model.ProductVO;

@Service
public class OrderServicelmpl implements OrderService{
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private ProductMapper prodMapper;
		
	//주문목록
	@Override
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders) {
		
		System.out.println("getGoodsInfo service..");
		
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();
		
		for(OrderPageItemDTO ord: orders) {
			
			OrderPageItemDTO goodsInfo = orderMapper.getGoodsInfo(ord.getPnum());
			
			goodsInfo.setPcount(ord.getPcount());
			
			goodsInfo.initSaleTotal();
			
			result.add(goodsInfo);	
			
		}
		
		return result;
	}
	
	//주문
	@Override
	@Transactional //여러쿼리가 하나의 단위로 처리되도록 추가
	public void order(OrderDTO ord) {
		
		System.out.println("order service..");
		//사용할 데이터 가져오기
		//회원정보
		MemberVO member = memberMapper.getClientInfo(ord.getId());
		
		//주문정보
		List<OrderItemDTO> ords = new ArrayList<>();
		for(OrderItemDTO oit : ord.getOrders()) {
			OrderItemDTO orderItem = orderMapper.getOrderInfo(oit.getPnum());
			//수량셋팅
			orderItem.setPcount(oit.getPcount());
			//기본정보셋팅
			orderItem.initSaleTotal();
			//List객체 추가
			ords.add(orderItem);
		}
		
		//OrderDTO 셋팅
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		
		//db주문, 주문상품, 배송정보 넣기
		//orderId만들기 & OrderDTO객체 orderId에 저장
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getId() + format.format(date);
		ord.setOrderId(orderId);
		
		//db넣기
		orderMapper.enrollOrder(ord); //supermm_order등록
		for(OrderItemDTO oit : ord.getOrders()) { //supermm_orderItem 등록
			oit.setOrderId(orderId);
			orderMapper.enrollOrderItem(oit);
		}
		
		//비용 포인트 변동 적용
		//비용차감 & 변동 돈(money) Member 객체 적용
		int calMoney = member.getMoney();
		calMoney -=ord.getOrderFinalSalePrice();
		member.setMoney(calMoney);
		
		//포인트차감, 포인트증가 & 변동포인트(point) Member객체 적용
		int calPoint = member.getMpoint();
		calPoint = calPoint - ord.getUsePoint() + ord.getOrderSavePoint(); //기존포인트 - 사용포인트 + 획득포인트
		member.setMpoint(calPoint);
		
		//변동 돈, 포인트 db적용
		orderMapper.deductMoney(member);
		
		//재고 변동 적용
		for(OrderItemDTO oit : ord.getOrders()) {
			//변동 재고값 구하기
			ProductVO prod = prodMapper.prodDetail(oit.getPnum());
			prod.setPqty(prod.getPqty() - oit.getPcount());
			//변동값 db 적용
			orderMapper.deductStock(prod);
		}
		
		//장바구니 제거
		for(OrderItemDTO oit : ord.getOrders()) {
			CartVO vo = new CartVO();
			vo.setId(ord.getId());
			vo.setPnum(oit.getPnum());
			
			cartMapper.deleteOrderCart(vo);
		}
		
	}
	
	//주문상품 리스트
	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		
		System.out.println("getOrderList service..");
		
		return orderMapper.getOrderList(cri);
	}
	
	//주문 총 갯수
	@Override
	public int getOrderTotal(Criteria cri) {
		
		System.out.println("getOrderTotal service..");
		
		return orderMapper.getOrderTotal(cri);
	}
	
	//주문취소
	@Override
	@Transactional //여러쿼리가 하나의 단위로 처리되도록 추가
	public void orderCancel(OrderCancelDTO dto) {
		
		System.out.println("orderCancel service..");
		
		//주문, 주문상품 객체
		//회원
		MemberVO member = memberMapper.getClientInfo(dto.getId());
		//주문상품
		List<OrderItemDTO> ords = orderMapper.getOrderItemInfo(dto.getOrderId());
		for(OrderItemDTO ord : ords) {
			ord.initSaleTotal();
		}
		//주문
		OrderDTO orw = orderMapper.getOrder(dto.getOrderId());
		orw.setOrders(ords);
		orw.getOrderPriceInfo();
		
		
		//주문상품 취소 db
		orderMapper.orderCancel(dto.getOrderId());
		
		//돈,포인트, 재고변환
		//돈
		int calMoney = member.getMoney();
		System.out.println("calMoney : "+ calMoney);
		calMoney += orw.getOrderFinalSalePrice();
		member.setMoney(calMoney);
		System.out.println("calMoney : "+ calMoney);
		//포인트
		int calPoint = member.getMpoint();
		System.out.println("calPoint : "+ calPoint);
		calPoint = calPoint + orw.getUsePoint() - orw.getOrderSavePoint();
		member.setMpoint(calPoint);
		System.out.println("calPoint : "+ calPoint);
		//db적용
		orderMapper.deductMoney(member);
		
		//재고
		for(OrderItemDTO ord : orw.getOrders()) {
			ProductVO prod = prodMapper.prodDetail(ord.getPnum());
			prod.setPqty(prod.getPqty() + ord.getPcount());
			orderMapper.deductStock(prod);
		}
	}
	
}
