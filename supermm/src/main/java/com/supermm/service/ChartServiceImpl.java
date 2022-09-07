package com.supermm.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supermm.mapper.ChartMapper;
import com.supermm.model.Criteria;
import com.supermm.model.OrderPageItemDTO;
import com.supermm.model.ProductVO;

@Repository
public class ChartServiceImpl implements ChartService{

	@Autowired
	private ChartMapper mapper;

	// 카테고리에 해당하는 상품 리스트
	public List<ProductVO> bestProduct(ProductVO pvo){
		System.out.println("bestCategory...........");

		return mapper.bestProduct(pvo);
	}

	//배송준비
	@Override
	public int getReadyTotal(Criteria cri) {
		System.out.println("getReadyTotal service..");

		return mapper.getReadyTotal(cri);
	}

	//주문취소
	@Override
	public int getCancelTotal(Criteria cri) {
		System.out.println("getCancelTotal service..");

		return mapper.getCancelTotal(cri);
	}

	//매출액
	@Override
	public List<OrderPageItemDTO> getSales() {
		System.out.println("getSales service..");

		return mapper.getSales();
	}

	//총회원수 
	public int getmembercnt() {

		return mapper.getmembercnt();

	}
	
	//오늘 회원수
	public int getmemberto() {

		return mapper.getmemberto();
	}
	// 이번주
	public int getmembercntw() {

		return mapper.getmembercntw();
	}

	//1일전
	public int getmemberone() {

		return mapper.getmemberone();

	}

	// 2일전
	public int getmembertwo() {

		return mapper.getmembertwo();
	}

	// 3일전
	public int getmemberthr() {

		return mapper.getmemberthr();
	}

	// 4일전
	public int getmemberfour() {
		return mapper.getmemberfour();
	}

	// 5일전
	public int  getmemberfive() {
		return mapper.getmemberfive();

	}

}