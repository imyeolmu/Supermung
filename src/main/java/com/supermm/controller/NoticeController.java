package com.supermm.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//등록 페이지 접속
	 @GetMapping("/notice-register")
	public String Noticeregisetrget() {
		
		 System.out.println("등록 접속");
		
		
		return "admin/notice/notice-register";
		


	}
	
	/*
	 * //리스트 페이지 접속
	 * 
	 * @GetMapping("/notice-list") public String NoitceListgetNotice(Model model) {
	 * 
	 * System.out.prIntegerln("리스트 접속 ");
	 * 
	 * 
	 * model.addAttribute("list", noticeservice.Noticelist());
	 * 
	 * return "admin/notice/notice-list";
	 * 
	 * 
	 * 
	 * }
	 */
	
	//공지사항 등록 하기
	 @RequestMapping(value ="/notice-register", method = RequestMethod.POST)
	public String NoticeregisterPost(NoticeVO  vo, RedirectAttributes rttr) {
		
		System.out.println("NoticeVo:"+ vo);
		
		noticeservice.Noticeregister(vo);
		
		
		rttr.addFlashAttribute("result", "register success");
		
		return"redirect:/notice-list";
	}
	
	
	//상세페이지
	
	 @GetMapping({"/notice-detail","/notice-update"})
	
	public String Noticedetailget(Integer nno, Model model) throws Exception{
		
		 model.addAttribute("pageMake", pageMake);
		model.addAttribute("pageInfo",noticeservice.Noticedetail(nno));
		
		

		return "admin/notice/notice-detail";
		
	}
		
		
	//수정페이지
	
	//수정페이지 이동
	
	 @GetMapping("/notice-update")
	public String getNoticeupdate(Integer nno, Model model){
		
		//requestParam: 기본값 선언 가능 
		
		NoticeVO vo = noticeservice.Noticedetail(nno); 
		
	
		model.addAttribute("pageInfo", nno); 
	

	
		
		log.info("게시판 수정폼- nno:" +nno);
		System.out.println("수정페이지 이동");

		return "/notice-update";
	
	
	
	}
	
	//페이지 수정메소드
	
	@PostMapping("/notice-update")
	public String PostNoticeupdate(NoticeVO vo, RedirectAttributes rttr) {
		noticeservice.Noticeupdate(vo);
		
		Integer result = noticeservice.Noticeupdate(vo);
		rttr.addFlashAttribute("result","update success");
		System.out.println("수정완료");

	
		return "redirect:/notice-list";
	}
	
	//페이지삭제
	@RequestMapping(value = "/notice-delete", method = RequestMethod.GET)
	public String PostNOtiicedelete(Integer nno, RedirectAttributes rttr) {
		
		noticeservice.Noticedelete(nno);
		System.out.println("삭제 완료");
		
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/notice-list";
	}
	
	

	@RequestMapping(value = "/notice-list", method = RequestMethod.GET)
	  public String noticeListForm(Model model, Criteria cri) {
	  
	  System.out.println("공지사항목록 페이지 페이징..");
	  
	  model.addAttribute("list", noticeservice.getNoticePaging(cri));
	  
	 Integer total = noticeservice.getNoticeTotal(cri);
	  
	  PageMakeDTO pageMake = new PageMakeDTO(cri, total);
	  
	  model.addAttribute("pageMake", pageMake);
	  
	
	 
	  return "admin/notice/notice-list";
	  
	  }
	

	 
		
		
}