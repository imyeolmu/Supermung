package com.supermm.service;

import java.util.List;

import com.supermm.model.CategoryVO;
import com.supermm.model.ClientCriteria;
import com.supermm.model.ClientMainCriteria;
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

	//카테고리 리스트
	public List<CategoryVO> cateList();

	//상품 삭제
	public int prodDelete(String pnum);


	/********************* 클라이언트 ************************/
	//상품목록(페이징 적용)
	public List<ProductVO> getProdListPaging(ClientCriteria cri);

	//상품 총 개수
	public int getProdTotal(ClientCriteria cri);

	// Main Spec 상품목록
	public List<ProductVO> getProdListPaging(ClientMainCriteria cri);

	// Main Spec 상품 총 개수
	public int getProdTotal(ClientMainCriteria cri);

}
