package com.supermm.mapper;


import java.util.List;

import com.supermm.model.CategoryVO;
import com.supermm.model.Criteria;


public interface CategoryMapper {

	// 카테고리 목록(페이징)
	public List<CategoryVO> cateListPaging(Criteria cri);
	// 카테고리 목록
	public List<CategoryVO> cateList();

	/* 카테고리 등록 */
	// 상품 등록 쿼리를 실행할 mapper메서드 생성
	// 사용자가 입력한 데이터를 전달받아야 하기 때문에 VO를 파라미터로 부여
	public void cateInput(CategoryVO cvo);
	
	// 카테고리 삭제
	public void cateDelete(String cateNum);

	// 카테고리 수정
	public void cateUpdate(CategoryVO cvo);
	// 카테고리 수정(상세보기)
	public CategoryVO cateDetail(String cateNum);

	// 전체 리스트 개수
	public int totalCnt(Criteria cri);
}