package com.supermm.service;

import java.util.List;

import com.supermm.model.Criteria;
import com.supermm.model.ProductVO;

public interface ProductService {
	
	//상품목록
	public List<ProductVO> getProdList();
	
	//상품목록(페이징 적용) 
	public List<ProductVO> getProdListPaging(Criteria cri);
	
	//상품 총 개수
	public int getProdTotal(Criteria cri);

	//상품등록
	public void prodInput(ProductVO prod);
	
	//상품 삭제
	public int prodDelete(String pnum);
}
