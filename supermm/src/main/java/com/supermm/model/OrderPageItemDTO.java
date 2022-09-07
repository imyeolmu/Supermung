package com.supermm.model;

import lombok.Data;
import  com.supermm.model.OrderPageDTO;

@Data
public class OrderPageItemDTO {
	
	//뷰로부터 전달받을 값
	private int pnum;
	private int pcount;
	
	//db로부터 꺼내올 값
	private String id;
	private String pname;
	private int price;
	private double pdiscount;
	private String pimage;
	
	//만들어 낼 값
	private int salePrice; //판매가
	private int totalPrice; //전체가격 - 상품1판매가 * 수량
	private int point;
	private int totalPoint;
	
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.price * (1-this.pdiscount));
		this.totalPrice = this.salePrice*this.pcount;
		this.point = (int)(Math.floor(this.salePrice*0.01));
		this.totalPoint = this.point * this.pcount;
		
	}
	
}
