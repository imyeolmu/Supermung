package com.supermm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminCategoryController")
public class CategoryController {

	//category
	@RequestMapping("/category-input")
	public String catinput() {

		return "admin/category/category-input";
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
