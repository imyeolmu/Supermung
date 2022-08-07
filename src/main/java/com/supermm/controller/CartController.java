package com.supermm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.supermm.model.CartVO;
import com.supermm.model.MemberVO;
import com.supermm.service.CartService;
@Controller("cartController")
public class CartController {
	
	@Autowired
	private CartService service;
	
	
	@RequestMapping("/cart")
	// modelandview :> model과 비슷한 역할 뷰의경로를 지정해준다.
	public ModelAndView Cart(HttpSession session, ModelAndView mv, MemberVO member) {
        Map<String, Object> map=new HashMap<>();
		System.out.println("카트...");
        String id = String.valueOf(session.getAttribute("memberid"));
       
        System.out.println("id..................."+id);
		if(id!=null) {
			// 로그인
			List<CartVO> list = service.cartList(id);
			int priceAll = service.priceAll(id);
			int pointAll = service.pointAll(id);
			int fee = priceAll - pointAll;
			
			map.put("priceAll", priceAll);
			map.put("pointAll", pointAll);
			map.put("fee", fee);
			map.put("list", list);
			map.put("count", list.size());

			session.setAttribute("count" ,list.size());
			session.setAttribute("cartlist" ,service.cartList(id));
			session.setAttribute("priceAll" ,priceAll);
			mv.setViewName("/client/cart"); // 이동할 페이지 이름
			mv.addObject("map",map); // 데이터 저장(위에 있는 데이터)
			
			return mv; // 화면이동
			
		}else {
			// 로그인 안되어있을 때..
			
			return new ModelAndView("client/login/client-login","",null);
			
		}
	}
	
	// insert :> 장바구니추가를 눌렀을 때
	@RequestMapping("/insert")
	public String insert(@ModelAttribute CartVO cvo, 
			HttpServletRequest request) {
		//세션 초기화하기
		HttpSession session = request.getSession();
			
		String id=(String)session.getAttribute("memberid");
		if(id == null) {
			// 로그인하지 않았으면 로그인 창으로 이동
			// 세션 기록 지우기
			session.invalidate();	
			return "redirect:/client-login";
		}
			
		cvo.setId(id);
		service.cartAdd(cvo);
		return "redirect:/cart";
	}
	
	// 장바구니 삭제 
	@RequestMapping("/cart-delete")
	public String cartDelete(int cartnum) throws Exception {
		System.out.println("장바구니 삭제입니다.");
			service.delete(cartnum);
		return "redirect:/cart";
	}
	
	
	// 장바구니 비우기
	@RequestMapping("/deleteAll")
	public String deleteAll(HttpSession session) throws Exception {
		System.out.println("장바구니 비우기입니다.");
		
		String id=(String)session.getAttribute("memberid");
		
		if(id != null) {
			service.deleteAll(id);
		}
		return "redirect:/cart";
	}
	
	
	// 장바구니 수량 수정
	@PostMapping("/cart/update")
	public String updateCart(CartVO cvo) {
		service.modifyCart(cvo);
		
		return "redirect:/cart";
		
	}
	
}
