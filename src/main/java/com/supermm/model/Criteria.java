package com.supermm.model;

import lombok.Data;

@Data //lombok
//pageNum과 amount를 같이 파라미터로 전달하기 위한 용도, criteria(기준)
public class Criteria { 
	private int pageNum; //현재페이지
	private int amount; //한페이지당 보여질 게시물 개수
	

	////////search ///////////
	private String searchType; 
	private String keyWord;
	
	//기본생성자 : 기본세팅(pageNum=1, amount=5)
	public Criteria() {
		this(1, 5);
	}
	
	//생성자 : 원하는 pageNum, amount
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}
