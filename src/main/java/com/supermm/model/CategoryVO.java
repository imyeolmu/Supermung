package com.supermm.model;

import lombok.Data;

@Data // toString, getter, setter 메서드를 자동 생성해줌 :> lombok
public class CategoryVO {

	private String cNum;
	private String cCode;
	private String cName;
	
	
}
