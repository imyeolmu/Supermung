package com.supermm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminProductController")
public class ProductController {

	//product
	@RequestMapping("/product-input")
	public String prodinput() {

		return "admin/product/product-input";
	}
	@RequestMapping("/product-list")
	public String prodlist() {

		return "admin/product/product-list";
	}	
	@RequestMapping("/product-update")
	public String produpdate() {

		return "admin/product/product-update";
	}

}
