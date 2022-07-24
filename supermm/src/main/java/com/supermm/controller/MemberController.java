package com.supermm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminMemberController")
public class MemberController {

	@RequestMapping("/member-list")
	public String memlist() {
		
		return "admin/member/member-list";
	}
	@RequestMapping("/member-point")
	public String mempoint() {
		
		return "admin/member/member-point";
	}
	@RequestMapping("/member-update")
	public String memupdate() {
		
		return "admin/member/member-update";
	}
	
	
}
