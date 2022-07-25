package com.supermm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.supermm.model.CategoryVO;
import com.supermm.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService service;
	
	//카테고리 등록 페이지 접속
	@RequestMapping(value="/category-input", method=RequestMethod.GET)
	public String CategoryInputForm(CategoryVO cat) {
		
		System.out.println("category_input cat:"+cat);
		
		return "admin/category/category-input";
	}
	
	// 카테고리 등록후 리스트로이동
	@RequestMapping(value="/category-input", method=RequestMethod.POST)
	public String CategoryInput(CategoryVO cat) {
		
		System.out.println("category_input cat:"+cat);
		
		service.CategoryInput(cat);
		return "ridirect:/admin/cateigory/category-list";
	}
	
	
	
	
	
	@RequestMapping("/category-list")
	public String catlist() {

		return "admin/category/category-list";
	}
	@RequestMapping("/category-update")
	public String catupdate() {

		return "admin/category/category-update";
	}


}
