package com.supermm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supermm.mapper.DashMapper;
import com.supermm.model.ProductVO;
@Repository
public class DashServiceImpl implements DashService{
	@Autowired
	private DashMapper mapper;
	
	// 카테고리별 등록된 상품 개수
	@Override
	public int categoryTotal(ProductVO pvo) {
		
		return mapper.categoryTotal(pvo);
	}

}
