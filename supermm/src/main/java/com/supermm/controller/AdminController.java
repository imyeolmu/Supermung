package com.supermm.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;
import com.supermm.model.OrderPageItemDTO;
import com.supermm.model.ProductVO;
import com.supermm.service.ChartService;
import com.supermm.service.MemberService;
import com.supermm.service.OrderService;
import com.supermm.service.ProductService;

@Controller("adminController")
public class AdminController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private ChartService cservice;
	@Autowired
	private ProductService pservice;
	@Autowired
	private OrderService oservice;
	

	//관리자 조회
	@RequestMapping(value="/admin-info", method = RequestMethod.GET)
	public String getMyInfo(HttpSession session, Model model, MemberVO member) throws Exception {

		System.out.println("관리자정보..");

		//로그인 id 불러오기
		String id=(String)session.getAttribute("memberid");
		System.out.println("id : " + id);

		model.addAttribute("member", service.getMyInfo(id));
		model.addAttribute("id", id);
		
		System.out.println("member : "+member);

		return "admin/admin-info";
	}

	//관리자 정보수정
	@RequestMapping(value="/admin-info", method = RequestMethod.POST)
	public String updateMyInfo(MemberVO member) throws Exception {
		
		System.out.println("관리자 정보수정");
		
		service.updateMyInfo(member);
		System.out.println("member : "+member);
		
		return "redirect: /admin-info";
	}
	
	//매출
	@RequestMapping(value="/getSales", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getSales(Model model, Locale locale) {
	
		System.out.println("매출액");
		Gson gson = new Gson();
		List<OrderPageItemDTO> orderList = cservice.getSales();	
		System.out.println(orderList);
		
		return gson.toJson(orderList); 
	}
	
	//대시보드
	@RequestMapping(value="/admin-main")
	public String adminMain(ProductVO pvo, Model model, Criteria cri, Locale locale) {
		
		System.out.println("상품순위");
		cservice.bestProduct(pvo);
		model.addAttribute("list",cservice.bestProduct(pvo));
		
		System.out.println("전체 주문량");
		oservice.getOrderTotal(cri);
		model.addAttribute("order", oservice.getOrderTotal(cri));
		
		System.out.println("배송준비");
		cservice.getReadyTotal(cri);
		model.addAttribute("ready", cservice.getReadyTotal(cri));

		System.out.println("주문취소");
		cservice.getCancelTotal(cri);
		model.addAttribute("cancel", cservice.getCancelTotal(cri));
		
	    int total = cservice.getmembercnt();
	     int totalto = cservice.getmemberto();
	      int totalw = cservice.getmembercntw();
	      int one = cservice.getmemberone();
	      int two = cservice.getmembertwo();
	      int three = cservice.getmemberthr();
	      int four = cservice.getmemberfour();
	      int five = cservice.getmemberfive();
	      model.addAttribute("total", total);
	      model.addAttribute("totalto", totalto);
	      model.addAttribute("totalw", totalw);
	      model.addAttribute("one",one);
	      model.addAttribute("two",two);
	      model.addAttribute("three",three);
	      model.addAttribute("four",four);
	      model.addAttribute("five",five);
	      

		

		return "admin/admin-main";
	}
	
}
