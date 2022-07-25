package com.supermm.service;

import com.supermm.model.CategoryVO;

public interface CategoryService {

	// 카테고리 등록 :> 카테고리등록 mapper 메서드를 호출할 메서드 작성
	public void CategoryInput(CategoryVO cat);
}
