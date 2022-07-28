package com.supermm.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.supermm.model.CategoryVO;
import com.supermm.model.Paging;
import com.supermm.service.CategoryService;


// @Cotroller에너테이션을 이용해 CategoryController 클래스를 빈으로 자동변환 id는 categoryController
// :> 컨트롤러 빈 자동 생성
@Controller("categoryController")
public class CategoryController {

	@Autowired
	private CategoryService service;


	// 카테고리 리스트 페이지 접속
		// Controller의 메서드는 Model이라는 타입의 객체를 파라미터로 받을 수 있다.
		// 즉 JSP Servlet의 request.setAttribute() 와 비슷한 역할을 한다.
	@RequestMapping("/category-list")
	public String list(
			@RequestParam(defaultValue = "1") int viewPage,
			@RequestParam(defaultValue = "5") int cntPerPage,
			@ModelAttribute("clist") CategoryVO cvo, Model model){
		
		// 전체 게시물의 개수
		int totalCnt = service.totalCnt(cvo);
		System.out.println("전체게시글 수 : " + totalCnt);
		
		// Paging에서 인자생성한거
		Paging page = new Paging(totalCnt, viewPage, cntPerPage);
		System.out.println("page........" + page);
		
		page.setViewPage(viewPage);
		page.setValue(totalCnt, cntPerPage);
		
		cvo.setStartIndex(page.getStartIndex());
		cvo.setCntPerPage(cntPerPage);
		
		 
		System.out.println("viewPage........"+ viewPage);
		System.out.println("cntPerPage........"+ cntPerPage);
		
		model.addAttribute("page", page);
		model.addAttribute("cvo",cvo);
		
		model.addAttribute("keyWord", cvo.getKeyWord());
		model.addAttribute("searchType", cvo.getSearchType());

		
		List<CategoryVO> cateList = service.cateList(cvo);
		
		model.addAttribute("cateList", cateList);
		System.out.println("cateList....."+cateList);
		return "admin/category/category-list";
		
		}
		 
		
	//카테고리 등록 페이지 접속(이동)
	@RequestMapping(value="/category-input", method=RequestMethod.GET)
		public String CategoryInputForm() {
		System.out.println("카테고리등록 페이지 접속");
		
		return "admin/category/category-input";
	}
	
	
	//카테고리 등록 페이지 :> 등록 후 카테고리목록으로 이동(전송)
	@RequestMapping(value="/category-input", method=RequestMethod.POST)
	public String cateinput(CategoryVO cinput) {
		
		service.cateInput(cinput);
		System.out.println("category_input cat:"+cinput);
		System.out.println("카테고리 등록 페이지접속");
		
		return "redirect:/category-list";
	}
	
	// 카테고리 삭제피이지 접속
	@RequestMapping("/category-delete")
	public String cateDelete(String cateNum) {
		
		service.cateDelete(cateNum);
		
		return "redirect:/list.do";
	}

	// 카테고리 수정 페이지 :> 수정 후 카테고리목록으로 이동(전송)
	@RequestMapping(value="/category-update", method=RequestMethod.POST)
	public String catupdate(@ModelAttribute("viewPage")CategoryVO cinput,
			int viewPage, Model model) {
		System.out.println("Update.cinput.........."+cinput);
		
		
		model.addAttribute("keyWord", cinput.getKeyWord());
		model.addAttribute("searchType",cinput.getSearchType());
		

		return "admin/category/category-list";
	}
	
	


}
