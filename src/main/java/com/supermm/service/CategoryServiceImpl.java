package com.supermm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supermm.mapper.CategoryMapper;
import com.supermm.model.CategoryVO;


@Service // 스프링이 해당 클래스가 service 역할을 하는 클래스로 인식하게함
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper categoryMapper;
	
	// 카테고리 등록
	@Override
	public void CategoryInput(CategoryVO cat) {
		
		System.out.println("srvice..categoryInput..");
		
		categoryMapper.input(cat);
	}
}
