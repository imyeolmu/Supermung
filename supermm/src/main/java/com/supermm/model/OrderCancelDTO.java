package com.supermm.model;

import lombok.Data;

@Data
public class OrderCancelDTO {

	private String id; //회원아이디
	private String orderId; //주문번호
	
	private String keyWord; 
	private int pqty; //수량
	private int pageNum;
	
}
