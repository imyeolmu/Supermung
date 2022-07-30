package com.supermm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.supermm.model.Criteria;
import com.supermm.model.PageMakeDTO;
import com.supermm.model.ProductVO;
import com.supermm.service.ProductService;

@Controller("productController")
public class ProductController {
	
	@Autowired
	private ProductService service;
		
	//상품 등록 페이지 접속
	@RequestMapping(value = "/product-input", method = RequestMethod.GET)
	public String ProductInputForm(ProductVO prod) {
		
		System.out.println("상품 등록 페이지 접속 : ");
		
		return "admin/product/product-input";
	}	
	
	//상품 등록
	@RequestMapping(value="/product-input", method = RequestMethod.POST)
	public String ProdInput(ProductVO prod) {

		System.out.println("product_input prod : "+ prod);
		
		service.prodInput(prod);
		return "redirect:/admin/product/product-list";
	}
	
	//상품 목록 페이지 접속
//	@RequestMapping(value = "/product-list", method = RequestMethod.GET)
//	public String prodListForm(Model model) {
//		
//		System.out.println("상품 목록 페이지 접속");
//		
//		model.addAttribute("list", service.getProdList());
//		
//		return "admin/product/product-list";
//	}	
	
	//상품 목록 페이지 접속(페이징 적용)
	@RequestMapping(value = "/product-list", method = RequestMethod.GET)
	public String prodListForm(Model model, Criteria cri) {

		System.out.println("상품 목록 페이징..");
		
		model.addAttribute("list", service.getProdListPaging(cri));
		
		int total = service.getProdTotal();
		
		PageMakeDTO pageMake = new PageMakeDTO(cri, total);
		
		model.addAttribute("pageMake", pageMake);
		
		return "admin/product/product-list";
	}	
	
	//상품수정
	@RequestMapping("/product-update")
	public String produpdate() {

		return "admin/product/product-update";
	}
	

}
