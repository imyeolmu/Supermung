package com.supermm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminController")
public class AdminController {

	//admin
	@RequestMapping("/admin-info")
	public String adinfo() {

		return "admin/admin-info";
	}
	@RequestMapping("/admin-login")
	public String alogin() {

		return "admin/admin-login";
	}
}
