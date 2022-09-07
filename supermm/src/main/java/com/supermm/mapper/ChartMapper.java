package com.supermm.mapper;

import java.util.List;

import com.supermm.model.Criteria;
import com.supermm.model.OrderPageItemDTO;
import com.supermm.model.ProductVO;


public interface ChartMapper {

	// 카테고리에 해당하는 상품 리스트
	public List<ProductVO> bestProduct(ProductVO pvo);

	//배송준비
	public int getReadyTotal(Criteria cri);

	//주문취소
	public int getCancelTotal(Criteria cri);

	//매출액
	public List<OrderPageItemDTO> getSales();

	// 카테고리별 등록된 상품 개수
	public int categoryTotal(ProductVO pvo);
	
	//총회원수
	public int getmembercnt();
	
	//오늘 가입수
	public int getmemberto();
	
	//이번주 가입 회원수
	public int getmembercntw();
	
	//1일전
	public int getmemberone();
	
	//2일전
	public int getmembertwo();
	
	//3일전
	public int getmemberthr();
	
	//4일전
	public int getmemberfour();
	
	//5일전
	public int getmemberfive();


}
