package com.supermm.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.supermm.model.CategoryVO;
import com.supermm.model.Criteria;
import com.supermm.model.NoticeVO;
import com.supermm.model.PageMakeDTO;
import com.supermm.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeservice;
	private Object pageMake;

	/* 클라이언트 페이지 */

	@RequestMapping(value = "/client-notice-list")
	public String CnoticeListForm(Model model, Criteria cri) {

		System.out.println("공지사항목록 페이지 페이징..");

		model.addAttribute("list", noticeservice.getNoticePaging(cri));

		int total = noticeservice.getNoticeTotal(cri);

		PageMakeDTO pageMake = new PageMakeDTO(cri, total);

		model.addAttribute("pageMake", pageMake);

		return "client/notice/client-notice-list";

	}

	@GetMapping("/client-notice-detail")

	public String CNoticedetailget(int nno, Model model) throws Exception {

		model.addAttribute("pageMake", pageMake);
		model.addAttribute("pageInfo", noticeservice.Noticedetail(nno));

		return "client/notice/client-notice-detail";

	}

	/* 어드민 페이지 */

	// 등록 페이지 접속

	@RequestMapping(value = "/notice-list")
	public String noticeListForm(Model model, Criteria cri) {

		System.out.println("공지사항목록 페이지 페이징..");

		model.addAttribute("list", noticeservice.getNoticePaging(cri));

		int total = noticeservice.getNoticeTotal(cri);

		PageMakeDTO pageMake = new PageMakeDTO(cri, total);

		model.addAttribute("pageMake", pageMake);

		return "admin/notice/notice-list";

	}

	// 공지사항 등록 하기
	@GetMapping("/notice-register")
	public String Noticeregisetrget() {

		System.out.println("등록 접속");

		return "admin/notice/notice-register";

	}

	@RequestMapping(value = "/notice-register", method = RequestMethod.POST)
	public String NoticeregisterPost(NoticeVO vo) {

		System.out.println("NoticeVo:" + vo);
		
		
		noticeservice.Noticeregister(vo);

		return "redirect:/notice-list";
	}

	// 상세페이지

	@GetMapping("/notice-detail")

	public String Noticedetailget(int nno, Model model) throws Exception {

		model.addAttribute("list", noticeservice.Noticedetail(nno));

		return "admin/notice/notice-detail";

	}
	// 수정 페이지 이동

	@RequestMapping(value = "/notice-update", method = RequestMethod.GET)
	public String NoticeUpdateGet(@RequestParam(value = "nno", required = false, defaultValue = "1") int nno,
			Model model) {

		/* NoticeVO list = noticeservice.Noticedetail(nno); */
		model.addAttribute("list", noticeservice.Noticedetail(nno));

		System.out.println("model" + model);
		System.out.println("수정 이동");

		return "admin/notice/notice-update";

	}

	// 수정 메소드

	@RequestMapping(value = "/notice-update", method = RequestMethod.POST)
	public String NoticeUpdatePost(NoticeVO list, Model model, RedirectAttributes rttr) {

		noticeservice.Noticeupdate(list);

		rttr.addFlashAttribute("result", "update success");

		System.out.println("수정메소드");
		System.out.println("list" + list);

		return "redirect:/notice-list";
	}

	// 페이지삭제

	@RequestMapping(value = "/notice-delete", method = RequestMethod.GET)
	public String PostNOtiicedelete(int nno, RedirectAttributes rttr) {

		noticeservice.Noticedelete(nno);
		System.out.println("삭제 완료");

		rttr.addFlashAttribute("result", "delete success");

		return "redirect:/notice-list";
	}

}
 
/*
 * //리스트 페이지 접속
 * 
 * @GetMapping("/notice-list")
 * 
 * public String NoitceListgetNotice(Model model) {
 * 
 * System.out.println("리스트 접속 ");
 * 
 * 
 * model.addAttribute("list", noticeservice.Noticelist());
 * 
 * return "admin/notice/notice-list";
 * 
 * 
 * }
 * 
 * 
 * }
 * 
 * 
 */