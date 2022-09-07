package com.supermm.mapper;

import java.util.List;

import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;
import com.supermm.model.OrderDTO;
import com.supermm.model.OrderItemDTO;
import com.supermm.model.OrderPageItemDTO;
import com.supermm.model.ProductVO;

public interface OrderMapper {

	//주문상품 정보(주문페이지)
	public OrderPageItemDTO getGoodsInfo(int pnum);

	//주문상품 정보(주문처리)
	public OrderItemDTO getOrderInfo(int pnum);
	
	//주문 테이블 등록
	public int enrollOrder(OrderDTO ord);
	
	//주문아이템 테이블 등록
	public int enrollOrderItem(OrderItemDTO orid);
	
	//주문금액 차감
	public int deductMoney(MemberVO member);
	
	//주문재고 차감
	public int deductStock(ProductVO prod);
	
	//주문상품 리스트
	public List<OrderDTO> getOrderList(Criteria cri);
	
	//주문 총 갯수
	public int getOrderTotal(Criteria cri);
	
	//주문 취소
	public int orderCancel(String orderId);
	
	//주문상품정보(주문취소)
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	//주문정보(주문취소)
	public OrderDTO getOrder(String orderId);
	
}
