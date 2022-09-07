package com.supermm.service;


import com.supermm.model.ProductVO;

public interface DashService {

	// 카테고리별 등록된 상품 개수
	public int categoryTotal(ProductVO pvo);
}
