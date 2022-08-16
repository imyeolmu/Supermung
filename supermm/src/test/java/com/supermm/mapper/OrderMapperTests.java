package com.supermm.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.supermm.model.MemberVO;
import com.supermm.model.OrderDTO;
import com.supermm.model.OrderItemDTO;
import com.supermm.model.ProductVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTests {

	@Autowired
	private OrderMapper mapper;
	
	/* 상품 정보(주문 처리) */
	@Test
	public void getOrderInfoTest() {
		
		 OrderItemDTO orderInfo = mapper.getOrderInfo(61);
		 
		 System.out.println("result : " + orderInfo);
	}
	
	/* supermm_order 테이블 등록 */
	@Test
	public void enrollOrderTest() {
		
		OrderDTO ord = new OrderDTO();
		List<OrderItemDTO> orders = new ArrayList();
		
		OrderItemDTO order1 = new OrderItemDTO();
		
		order1.setPnum(61);
		order1.setPcount(5);
		order1.setPrice(70000);
		order1.setPdiscount(0.1);
		order1.initSaleTotal();
		
		
		
		ord.setOrders(orders);
		
		ord.setOrderId("test4");
		ord.setRecipient("test");
		ord.setId("admin");
		ord.setMemberAddr1("test");
		ord.setMemberAddr2("test");
		ord.setMemberAddr3("test");
		ord.setOrderState("배송준비");
		ord.getOrderPriceInfo();
		ord.setUsePoint(1000);
		
		mapper.enrollOrder(ord);		
		
	}
	
	/* supermm_itemorder 테이블 등록 */
	@Test
	public void enrollOrderItemTest() {
		
		OrderItemDTO oid = new OrderItemDTO();
		
//		oid.setOrderItemId(2);
		oid.setOrderId("test3");
		oid.setPnum(61);
		oid.setPcount(1);
		oid.setPrice(70000);
		oid.setPdiscount(0.1);
		
		oid.initSaleTotal();
		
		mapper.enrollOrderItem(oid);
		
	}	
	
	/* 회원 돈, 포인트 정보 변경 */
	@Test
	public void deductMoneyTest() {
		
		MemberVO member = new MemberVO();
		
		member.setId("user");
		member.setMoney(500000);
		member.setMpoint(10000);
		
		mapper.deductMoney(member);
	}
	
	/* 상품 재고 변경 */
	@Test
	public void deductStockTest() {
		ProductVO book = new ProductVO();
		
		book.setPnum(61);
		book.setPqty(77);
		
		mapper.deductStock(book);
	}
}
