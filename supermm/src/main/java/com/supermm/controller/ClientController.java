package com.supermm.controller;





import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supermm.model.CartVO;
import com.supermm.model.ClientCriteria;
import com.supermm.model.ClientPageMakeDTO;
import com.supermm.model.ProductVO;
import com.supermm.service.CartService;
import com.supermm.service.NoticeService;
import com.supermm.service.ProductService;

@Controller("clientController")
public class ClientController {

	@Autowired
	private ProductService service;
	
	@Autowired
	private NoticeService nservice;
	
	
	
	//client-product ** 상품상세보기 ** < pnum 값에 해당하는 곳으로 이동 >
	@RequestMapping("/client-product-detail")
	public String productDetail(int pnum ,ClientCriteria cri, Model model, CartVO cvo,HttpSession session) throws Exception {
		
		ClientCriteria cmc = new ClientCriteria(1, 2325);
    	ProductVO data = service.prodDetail(pnum); // pnum값을 넘김
        model.addAttribute("data", data); // model에 데이터 값을 담는다
		model.addAttribute("list", service.getProdListPaging(cmc));
		return "client/product/client-product-detail";
	}

//	@RequestMapping("/client-product-list")
//	public String productList() {
//		return "client/product/client-product-list";
//	}
	
	//client-page
	@RequestMapping("/about-us")
	public String aboutUs() {
		return "client/about-us";
	}
	
	/*
	 * @RequestMapping("/cart") public String Cart(HttpServletRequest
	 * request,ProductVO pvo, String pnum, String pqty, String pspec) {
	 * 
	 * ProductVO vo = new ProductVO();
	 * 
	 * 
	 * 
	 * return "client/cart"; }
	 */
	
	
	@RequestMapping("/checkout")
	public String checkOut() {
		return "client/checkout";
	}

	@RequestMapping("/contact")
	public String contact() {
		return "client/contact";
	}
	
	@RequestMapping("/client-faq")
	public String clientFAQ() {
		return "client/faq";
	}
	
	
	@RequestMapping("/client-main")
	public String clientMain(ClientCriteria cri, Model model,String pcategory_fk1,HttpSession session) {
		System.out.println("상품 목록 페이징");
		//카테고리
		model.addAttribute("prodCateList", service.prodSide(pcategory_fk1));
		System.out.println("상품 목록 페이징");
		int totalCnt = service.getProdTotal(cri);
		model.addAttribute("list", service.getProdListPaging(cri));

		//공지사항
		model.addAttribute("nlist", nservice.getNoticePaging(cri));
		
		System.out.println("상품 목록");

		ClientCriteria cmc = new ClientCriteria(1, 3000);
		// 페이징처리
		
		model.addAttribute("list", service.getProdListPaging(cmc));
		
		return "client/main";

	}

}
	
	
//	@RequestMapping("/client-mypage")
//	public String myPage() {
//		return "client/mypage";
//	}
	/*
	 * @RequestMapping("/client-login") public String clientLogin() { return
	 * "client/client-login"; }
	 * 
	 * @RequestMapping("/client-join") public String register() { return
	 * "client/register"; }
	 */
	
	
	
	
	