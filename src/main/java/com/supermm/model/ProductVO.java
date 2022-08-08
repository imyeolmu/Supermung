package com.supermm.model;


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
	private String pcategory_fk1; //카테고리
	private String pname; //상품명
	private String pimage; //상품사진
	private String pcompany; //브랜드
	private String pspec; //상품상태
	private int pqty; //상품수량
	private int price; //상품가격
	private int ppoint; //상품포인트
	private String pcontent; // 상품상세설명
	
	/////// total ////////
	private int totPrice; // 총 금액
	private int totPoint; // 총 포인트
	private int salePrice; // 총금액에서 포인트 사용하고 남은 금액

	////////search ///////////
	private String searchType; 
	private String[] searchTypeArr;
	
	private String keyWord;
	
	/////// paging ////////
	private int pageNum; //현재페이지
	private int amount; //한페이지당 보여질 게시물 개수	
	
	
	
	
}
