package com.supermm.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data // toString, getter, setter 메서드를 자동 생성해줌 :> lombok
@NoArgsConstructor // 기본생성자 생성
@Builder // 모든 요소가 포함된 생성자 생성
@AllArgsConstructor // NoArgs...와 Builder같이 쓰면 인자생성자->기본생성자로 바뀌면서 에러

public class CartVO {
	
	// 카트
	private int cartnum; // **카트 번호
	private int cartAmount;
	// 멤버
	private String id; // **고객 고유번호(시퀀스)
	private String name; // 고객이름
	/// 상품
	private String pname; // 상품이름
	private int pnum; // **상품 번호
	private int price;
	private int ppoint;
	private String pimage;
	private String pspec;
	
	private int totprice; // 총금액
	private int totpoint; // 총포인트액
	private int pqty; // ** 총 갯수
	
	
	
}