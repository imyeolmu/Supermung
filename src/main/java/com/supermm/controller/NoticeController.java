package com.supermm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminNoticeController")
public class NoticeController {

	//notice
	@RequestMapping("/notice-detail")
	public String notdetail() {

		return "admin/notice/notice-detail";
	}
	@RequestMapping("/notice-list")
	public String notlist() {

		return "admin/notice/notice-list";
	}
	@RequestMapping("/notice-register")
	public String notregister() {

		return "admin/notice/notice-register";
	}
	@RequestMapping("/notice-update")
	public String notupdate() {

		return "admin/notice/notice-update";
	}

	//q&a
	@RequestMapping("/qna-detail")
	public String qdetail() {

		return "admin/notice/qna-detail";
	}
	@RequestMapping("/qna-list")
	public String qlist() {

		return "admin/notice/qna-list";
	}
	@RequestMapping("/qna-register")
	public String qregister() {

		return "admin/notice/qna-register";
	}
	@RequestMapping("/qna-update")
	public String qupdate() {

		return "admin/notice/qna-update";
	}
}
