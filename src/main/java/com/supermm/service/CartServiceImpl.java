package com.supermm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supermm.mapper.CartMapper;
import com.supermm.model.CartVO;

@Repository
public class CartServiceImpl implements CartService{

	
	@Autowired
	private CartMapper cartmapper;

	
	
	@Override
	public List<CartVO> cartPrice(){
		return null;
	}
	
	//장바구니 추가
	@Override
	public void cartAdd(CartVO cvo) {
		
		cartmapper.cartAdd(cvo);
	}
	
	// 장바구니 목록
	@Override
	public List<CartVO> cartList(String id) {
		
		return cartmapper.cartList(id);
	}
	
	// 장바구니 선택 삭제
	@Override
	public void delete(int cartnum) {
		cartmapper.delete(cartnum);
	}
	
	 // 고객 장바구니 비우기
	@Override
	public void deleteAll(String id) {
		cartmapper.deleteAll(id);
	}
	
	// 장바구니 금액 합계	
	@Override
	public int priceAll(String id) {
		return cartmapper.priceAll(id);
	}
	// 장바구니 금액 합계	
	@Override
	public int pointAll(String id) {
		return cartmapper.pointAll(id);
	}
	
	
	////////////// 장바구니 수정
	// 번호넘김
	@Override
	public void update(int cartnum) {
		
	}
	
	// 장바구니 수량 수정
	@Override
	public int modifyCart(CartVO cvo) {
		return cartmapper.modifyCart(cvo);
	}
	
}
