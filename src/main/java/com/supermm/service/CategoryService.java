package com.supermm.service;


import java.util.List;

import com.supermm.model.CategoryVO;
import com.supermm.model.Criteria;


public interface CategoryService {

	// 카테고리 목록 가져오기 (페이징)
	public List<CategoryVO> cateListPaging(Criteria cri);
	
	// 카테고리 목록 가져오기
	public List<CategoryVO> cateList();
	
	// 카테고리 등록 :> 카테고리등록 mapper 메서드를 호출할 메서드 작성
	public void cateInput(CategoryVO cvo);
	
	// 카테고리 삭제 
	public void cateDelete(String cateNum);
	
	// 카테고리 수정
	public String cateUpdate(CategoryVO cinput);
	
	// 전체 리스트 개수
	public int totalCnt();
	
	
}