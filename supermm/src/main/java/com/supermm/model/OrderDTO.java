package com.supermm.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {

	private String orderId; //주문번호
	private String recipient; //배송받는사람
	private String id; //주문회원아이디
	private String memberAddr1; //우편번호
	private String memberAddr2; //회원주소
	private String memberAddr3; //회원상세주소
	private String orderState; //주문상태
	private List<OrderItemDTO> orders; //주문상품
	private int usePoint; //사용포인트
	private Date orderDate; //주문날짜
	
	//db테이블 존재하지 않는 데이터
	private int orderSalePrice; //판매가(모든 상품 비용)
	private int orderSavePoint; //적립포인트
	private int orderFinalSalePrice; //최종판매비용
	
	public void getOrderPriceInfo() {
		//상품비용 & 적립포인트
		for(OrderItemDTO order:orders) {
			orderSalePrice += order.getTotalPirce();
			orderSavePoint += order.getTotalSavePoint();
		}
		
		//최종비용
		orderFinalSalePrice = orderSalePrice - usePoint;
	}
}
