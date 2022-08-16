//package com.supermm.controller;
//
//
//import java.util.List;
//import java.util.Locale;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.google.gson.Gson;
//import com.supermm.model.Criteria;
//import com.supermm.model.OrderPageItemDTO;
//import com.supermm.model.ProductVO;
//import com.supermm.service.ChartService;
//import com.supermm.service.OrderService;
//@Controller("chartController")
//public class ChartController {
//	
//	@Autowired
//	private ChartService cservice;
//	
//	@Autowired
//	private OrderService oservice;
//	
//	
//	@RequestMapping(value="/getSales", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
//	public @ResponseBody String getSales(Model model, Locale locale) {
//	
//		System.out.println("매출액");
//		Gson gson = new Gson();
//		List<OrderPageItemDTO> orderList = cservice.getSales();	
//		System.out.println(orderList);
//		
//		return gson.toJson(orderList); 
//	}
//	
//	@RequestMapping(value="/admin-main")
//	public String adminMain(ProductVO pvo, Model model, Criteria cri, Locale locale) {
//		
//		System.out.println("상품순위");
//		cservice.bestProduct(pvo);
//		model.addAttribute("list",cservice.bestProduct(pvo));
//		
//		System.out.println("전체 주문량");
//		oservice.getOrderTotal(cri);
//		model.addAttribute("order", oservice.getOrderTotal(cri));
//		
//		System.out.println("배송준비");
//		cservice.getReadyTotal(cri);
//		model.addAttribute("ready", cservice.getReadyTotal(cri));
//
//		System.out.println("주문취소");
//		cservice.getCancelTotal(cri);
//		model.addAttribute("cancel", cservice.getCancelTotal(cri));
//		
//
//		return "admin/admin-main";
//	}
//
//}


 
