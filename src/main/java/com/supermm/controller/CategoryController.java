package com.supermm.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.supermm.model.CategoryVO;
import com.supermm.model.Criteria;
import com.supermm.model.PageMakeDTO;
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
			@ModelAttribute("clist") CategoryVO cvo, Model model, Criteria cri){
		
		// 전체 게시물의 개수
		int totalCnt = service.totalCnt();
		System.out.println("전체게시글 수 : " + totalCnt);
		
		// 페이징처리
		PageMakeDTO pageMake = new PageMakeDTO(cri, totalCnt);
		
		System.out.println("pageMake........" +pageMake);
		
		model.addAttribute("pageMake", pageMake);
		
		model.addAttribute("cri",cri);
		
		// 검색기능
		model.addAttribute("keyWord", cri.getKeyWord());
		model.addAttribute("searchType", cri.getSearchType());

		model.addAttribute("cateList", service.cateListPaging(cri));
		System.out.println("cateList....."+ service.cateListPaging(cri));
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
	
	// 카테고리 삭제
	@RequestMapping(value="/category-delete", method=RequestMethod.GET)
	public String cateDelete(String cateNum) {
		System.out.println("카테고리 삭제입니다.");
		
		service.cateDelete(cateNum);
		return "admin/category/category-list";
	}
	
	// 카테고리 선택삭제
	@RequestMapping(value="/category-delete")
	public String cateDeleteAjax(HttpServletRequest request) {
		System.out.println("카테고리 삭제입니다.");
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		
		int size = ajaxMsg.length;
		
		for(int i=0; i<size; i++) {
			System.out.println("i........."+i);
			service.cateDelete(ajaxMsg[i]);
		}
		System.out.println("ajaxMsg.........."+ajaxMsg);
		return "admin/category/category-list";
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