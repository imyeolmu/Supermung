package com.supermm.mapper;

import java.util.List;

import com.supermm.model.Criteria;
import com.supermm.model.ProductVO;

public interface ProductMapper {
	
	//상품목록
	public List<ProductVO> getProdList();

	//상품목록(페이징 적용)
	public List<ProductVO> getProdListPaging(Criteria cri);
	
	//상품 총 개수
	public int getProdTotal(Criteria cri);
	
	//상품등록
	public void prodInput(ProductVO prod);
	
	//상품삭제
	public int prodDelete(String pnum);
}