package com.supermm.model;

import lombok.Data;

@Data //lombak
public class ProductVO {
	private int pnum; //상품번호
	private String pcategory_fk1; //카테고리1
	private String pcategory_fk2; //카테고리2
	private String pname; //상품명
	private String pimage; //상품사진
	private String pcompany; //브랜드
	private String pspec; //상품상태
	private int pqty; //상품수량
	private int price; //상품가격
	private int ppoint; //상품포인트

	
}
