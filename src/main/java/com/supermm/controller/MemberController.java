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
	@RequestMapping("/member-list")
	public String memlist(
			@ModelAttribute("list") MemberVO member, Model model, Criteria cri) {

		System.out.println("회원 목록 페이징..");

		//전체 회원 수
		int total = service.getMemTotal(cri);
		//		System.out.println("전체 회원 수 : " + total);

		//페이징처리
		PageMakeDTO pageMake = new PageMakeDTO(cri, total);		
		model.addAttribute("pageMake", pageMake);

		//		model.addAttribute("member", member);

		//검색
		//		model.addAttribute("keyWord", cri.getKeyWord());
		//		model.addAttribute("searchType", cri.getSearchType());
		//		
		model.addAttribute("list", service.getMemListPaging(cri));

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
	public String memPointUpdateGET(int mnum, Model model) {
		
		MemberVO minfo = service.getMemInfo(mnum);
		
		model.addAttribute("minfo", minfo);
		
		System.out.println("회원 포인트 조회..");

		return "admin/member/member-point";
	}

	//정보수정(포인트적립) 수정
	@RequestMapping(value="/member-point", method = RequestMethod.POST)
	public String memPointUpdatePOST(MemberVO member, Model model, RedirectAttributes rttr) {

		System.out.println("회원 포인트 수정..");

		service.updateMemPoint(member);
		model.addAttribute("member" , member);

		rttr.addFlashAttribute("result", "update success");

		return "redirect: /member-list";
	}
	
	
	/********************* 클라이언트 ************************/
	@RequestMapping(value="/client-mypage", method = RequestMethod.GET)
	public void getMyInfoGET(int mnum, Model model) throws Exception {
		
		System.out.println("마이페이지 내정보..");
		
		model.addAttribute("myinfo", service.getMyInfo(mnum));
		
	}
	
}
