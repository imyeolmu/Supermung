package com.supermm.model;

import lombok.Data;

@Data
public class OrderItemDTO {
	
	private String orderId; //주문번호
	private int pnum; //상품번호
	private int pcount; //주문수량
	private int orderItemId; //supermm_orderItem 기본키
	private int price; //상품 한개 가격
	private double pdiscount; //상품할인율 
	private int savePoint; //상품 한개 구매시 획득 포인트
	
	//db테이블 존재하지 않는 데이터
	private int salePrice; //할인 적용된 가격
	private int totalPirce; //총 가격(할인 적용된 가격 * 주문 수량)
	private int totalSavePoint; //총 획득 포인트(상품 한개 구매시 획득포인트 * 수량)
	
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.price * (1-this.pdiscount));
		this.totalPirce = this.salePrice * this.pcount;
		this.savePoint = (int)(Math.floor(this.salePrice*0.01));
		this.totalSavePoint = this.savePoint * this.pcount;
	}

}
