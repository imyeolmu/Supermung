package com.supermm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.supermm.model.MemberVO;
import com.supermm.service.MemberService;

@Controller("adminController")
public class AdminController {
	
	@Autowired
	private MemberService service;

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
	
	@RequestMapping("/admin-main")
	public String alogin() {

		return "admin/admin-main";
	}
	
}
