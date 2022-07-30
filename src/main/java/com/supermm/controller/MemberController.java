package com.supermm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;
import com.supermm.model.PageMakeDTO;
import com.supermm.service.MemberService;

@Controller("adminMemberController")
public class MemberController {

	@Autowired
	private MemberService service;
	
	//회원 목록 페이지 접속
//	@RequestMapping("/member-list")
//	public String memlist(Model model) {
//		
//		System.out.println("회원 목록 페이지 접속");
//		
//		model.addAttribute("list", service.getMemList());
//		
//		return "admin/member/member-list";
//	}

	//회원 목록 페이지 접속(페이징 적용)
	@RequestMapping(value="/member-list", method = RequestMethod.GET)
	public String memlist(Model model, Criteria cri) {
		
		System.out.println("회원 목록 페이징..");
		
		model.addAttribute("list", service.getMemListPaging(cri));
		
		int total = service.getMemTotal();
		
		PageMakeDTO pageMake = new PageMakeDTO(cri, total);
		
		model.addAttribute("pageMake", pageMake);
		
		return "admin/member/member-list";
	}
	
	//회원 조회
	@RequestMapping(value="/member-info", method = RequestMethod.GET)
	public String meminfo(int mnum, Model model) {
		
		System.out.println("회원 조회하기..");

		model.addAttribute("minfo", service.getMemInfo(mnum));

		return "admin/member/member-info";
	}
	
	//회원 포인트 조회(수정) 페이지로 이동
	@RequestMapping(value="/member-point", method = RequestMethod.GET)
	public String mempoint(int mnum, Model model) {
		
		System.out.println("회원 포인트 조회..");
		
		model.addAttribute("minfo", service.getMemInfo(mnum));
		
		return "admin/member/member-point";
	}
	
	//정보수정(포인트적립) 수정
	@RequestMapping(value="/member-point-update", method = RequestMethod.POST)
	public String memPointUpdatePOST(int mnum, MemberVO member, RedirectAttributes rttr, Model model) {
		
		System.out.println("회원 포인트 수정..");
		
		service.updateMemPoint(member);
		
		model.addAttribute("mpoint", service.updateMemPoint(member));
		
		if(rttr.addFlashAttribute("result", "update success")!=null) {
			System.out.println("포인트 수정 성공..");
		};			

		return "redirect: /member-list";
	
	}
}
