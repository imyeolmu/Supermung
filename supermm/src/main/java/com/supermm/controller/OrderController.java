package com.supermm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;
import com.supermm.model.OrderCancelDTO;
import com.supermm.model.OrderDTO;
import com.supermm.model.OrderPageDTO;
import com.supermm.model.PageMakeDTO;
import com.supermm.service.CartService;
import com.supermm.service.MemberService;
import com.supermm.service.OrderService;

@Controller("orderController")
public class OrderController {
	
	@Autowired
	private OrderService oservice;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private CartService cservice;
	
	//주문페이지
	@RequestMapping(value="/order", method = RequestMethod.GET)
	public String orderPageGET(HttpSession session, OrderPageDTO opd, Model model) throws Exception{
		
		String id = String.valueOf(session.getAttribute("memberid"));
		System.out.println("id : " + id);
		System.out.println("orders :" +opd.getOrders());
	
		model.addAttribute("clientInfo", mservice.getClientInfo(id));
		model.addAttribute("orderList", oservice.getGoodsInfo(opd.getOrders()));
		model.addAttribute("priceAll", cservice.priceAll(id));
		model.addAttribute("pointAll", cservice.pointAll(id));
		return "/client/order";
	}
	
	//주문하기
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderPagePOST(OrderDTO od, HttpServletRequest request) {
		
		System.out.println(od);
		
		oservice.order(od);
		
		MemberVO member = new MemberVO();
		member.setId(od.getId());
		
		//세션 초기화
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("memberid");
        cservice.deleteAll(id);
		try {
			MemberVO memberLogin = mservice.memberLogin(member);
			memberLogin.setPw("");
			session.setAttribute("member", memberLogin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/client-history";
	}
	
	//주문현황 페이지
	@RequestMapping("/admin-order")
	public String orderList(Criteria cri, Model model) {
		
		System.out.println("주문현황 페이지..");
		
//		Criteria cri = new Criteria(1, 10);
		
		List<OrderDTO> list = oservice.getOrderList(cri);
		
		// 전체 주문 개수
		int totalCnt = oservice.getOrderTotal(cri);
		
		if(!list.isEmpty()) { //주문 있을때
			model.addAttribute("list",list);
			model.addAttribute("pageMake", new PageMakeDTO(cri, totalCnt));
			
		} else { //주문 없을때
			model.addAttribute("listCheck", "empty");
		}
		
		return "/admin/admin-order";
	}
	
	//주문취소
	@PostMapping("/orderCancel")
	public String orderCancelPOST(HttpSession session, OrderCancelDTO dto) {
		
		System.out.println("주문취소..");
		
		try {
			oservice.orderCancel(dto);
			
			System.out.println("orderId : "+dto.getOrderId());
			System.out.println("id : "+dto.getId());
			System.out.println("keyword : "+dto.getKeyWord());
			System.out.println("pqty : "+dto.getPqty());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect: /admin-order?keyword=" + dto.getKeyWord() + "&pqty=" + dto.getPqty() + "&pageNum=" + dto.getPageNum();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
