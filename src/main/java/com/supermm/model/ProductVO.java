package com.supermm.model;

import lombok.Data;

@Data //lombok
public class ProductVO {
	
	private int pnum; //상품번호
	private String pcategory_fk1; //카테고리
	private String pname; //상품명
	private String pimage; //상품사진
	private String pcompany; //브랜드
	private String pspec; //상품상태
	private int pqty; //상품수량
	private int price; //상품가격
	private int ppoint; //상품포인트
	private String pcontent; // 상품상세설명

	////////search ///////////
	private String searchType; 
	private String keyWord;
	
	private int pageNum; //현재페이지
	private int amount; //한페이지당 보여질 게시물 개수	
	
	private String cateName;
	
	
}
