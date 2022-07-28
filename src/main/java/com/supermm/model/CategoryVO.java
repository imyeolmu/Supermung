package com.supermm.model;

import lombok.Data;

@Data // toString, getter, setter 메서드를 자동 생성해줌 :> lombok
public class CategoryVO {

	private String cateNum;
	private String cateCode;
	private String cateName;
	
	
	
	private String uid;
	/////// paging //////
	private int startIndex;
	private int cntPerPage;
	
	

	//////// search ///////////
	private String searchType; 
	private String keyWord;
	
	CategoryVO(){}
}

