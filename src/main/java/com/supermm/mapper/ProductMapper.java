package com.supermm.mapper;

import java.util.List;


import com.supermm.model.CategoryVO;
import com.supermm.model.ClientCriteria;
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
	
	//상품수정(상세)
	public ProductVO prodDetail(int pnum);
	
	//상품수정
	public void prodUpdate(ProductVO prod);	
	
	//카테고리 리스트
	public List<CategoryVO> cateList();

	//상품삭제
	public int prodDelete(String pnum);

	
	/********************* 클라이언트 ************************/
	//상품목록(페이징 적용)
	public List<ProductVO> getProdListPaging(ClientCriteria cri);

	//상품 총 개수
	public int getProdTotal(ClientCriteria cri);

	public int prodQty(int pnum);
	
	// 상품 카테고리 리스트
	public List<ProductVO> prodSide(String pcategory_fk1);
	
	// 카테고리에 해당하는 상품 리스트
	public List<ProductVO> prodCateList(ClientCriteria cri);
	
	// 카테고리에 해당하는 총 상품 개수
	public int prodCateTotal(ClientCriteria cri);
}