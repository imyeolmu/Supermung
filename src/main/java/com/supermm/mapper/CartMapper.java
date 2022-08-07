package com.supermm.mapper;

import java.util.List;

import com.supermm.model.CartVO;


public interface CartMapper {
	
	List<CartVO> cartPrice();
	
	void cartAdd(CartVO cvo); // 장바구니 추가
	
	List<CartVO> cartList(String id); // 장바구니 목록
	
	void delete(int cartnum); // 장바구니 선택 삭제
	
	void deleteAll(String id); // 고객 장바구니 비우기
	
	
	int priceAll(String id); // 장바구니 금액 합계
	int pointAll(String id); // 장바구니 포인 합계
	
	
	// 장바구니 수정
	void update(int cartnum); // 번호넘김
	int modifyCart(CartVO cvo); // ??
	
}