package com.supermm.mapper;


import java.util.List;

import com.supermm.model.CategoryVO;


public interface CategoryMapper {

	// 카테고리 목록
	public List<CategoryVO> cateList(CategoryVO clist);
		 
	/* 카테고리 등록 */
	// 사용자가 입력한 데이터를 전달받아야 하기 때문에 VO를 파라미터로 부여
	public void cateInput(CategoryVO cinput);
	
	
	// 카테고리 삭제
	public String cateDelete(String cateNum);
	
	// 카테고리 수정
	public String cateUpdate(CategoryVO cinput);
	
	// 전체 리스트 개수
	public int totalCnt(CategoryVO clist);
}
