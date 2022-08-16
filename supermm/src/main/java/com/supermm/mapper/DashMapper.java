package com.supermm.mapper;

import com.supermm.model.ProductVO;

public interface DashMapper {
	
	// 카테고리별 등록된 상품 개수
	public int categoryTotal(ProductVO pvo);
}
