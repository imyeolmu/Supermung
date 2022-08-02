package com.supermm.model;

import com.supermm.model.CategoryVO.CategoryVOBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //lombok
@NoArgsConstructor // 기본생성자 생성
@Builder // 모든 요소가 포함된 생성자 생성
@AllArgsConstructor // NoArgs...와 Builder같이 쓰면 인자생성자->기본생성자로 바뀌면서 에러
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

	// PAGE
	private int pageNum;
	private int amount; 


	//////// search ///////////
	private String searchType; 
	private String keyWord;
	public ProductVO(int pageNum, int amount) {
		pageNum = 1;
		amount =5;
		
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
