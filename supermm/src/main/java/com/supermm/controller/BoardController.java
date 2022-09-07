package com.supermm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.supermm.model.BoardVO;
import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;
import com.supermm.model.NoticeVO;
import com.supermm.model.PageMakeDTO;
import com.supermm.service.BoardService;
import com.supermm.service.MemberService;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardservice;
	private Object pageMake;
	
	@RequestMapping(value = "/board-list", method = RequestMethod.GET)
	public String BoardListForm(Model model, Criteria cri) {

		System.out.println("봉사게시판 관리페이지");

		model.addAttribute("list", boardservice.getBoardPaging(cri));

		int total = boardservice.getBoardTotal(cri);

		PageMakeDTO pageMake = new PageMakeDTO(cri, total);

		model.addAttribute("pageMake", pageMake);
		

		return "admin/board/board-list";

	}
	


	@RequestMapping(value = "/client-board-list", method = RequestMethod.GET)
	public String CboardListForm(Model model, Criteria cri, HttpSession session, MemberVO member ) throws Exception {
		


		System.out.println("봉사게시판 페이지 페이징..");

		model.addAttribute("list", boardservice.getBoardPaging(cri));

		int total = boardservice.getBoardTotal(cri);

		PageMakeDTO pageMake = new PageMakeDTO(cri, total);

		model.addAttribute("pageMake", pageMake);

		return "client/board/client-board-list";

	}
	
	// 등록 페이지 접속


	// 공지사항 등록 하기
		@GetMapping("/client-board-register")
		public String Boardregisterrget() {

			System.out.println("등록 접속");

			return "client/board/client-board-register";
		}

		//등록하기 메소드
		@RequestMapping(value = "/client-board-register", method = RequestMethod.POST)
		public String BoardregisterPost(BoardVO vo, RedirectAttributes rttr) {

			System.out.println("boardVO:" + vo);
			
		
			boardservice.Boardregister(vo);
			
			rttr.addAttribute("results", "게시글 등록이 완료됬습니다");

			return "redirect:/client-board-list";
		
		
	
		}
		
		
		  //상세페이지
		  
		  @GetMapping("/client-board-detail")
		  
		  public String Boarddetailget(int bno, Model model) throws Exception {
			  
			  
			  
				model.addAttribute("list", boardservice.Boarddetail(bno));
		  

		  
		  return "client/board/client-board-detail";
		  
		  }
		  
		// 수정 페이지 이동

			@RequestMapping(value = "/client-board-update", method = RequestMethod.GET)
			public String BoardUpdateGet(@RequestParam(value = "bno", required = false, defaultValue = "1") int bno,
					Model model) {

			
				model.addAttribute("list", boardservice.Boarddetail(bno));

				System.out.println("model" + model);
				System.out.println("수정 이동");

				return "client/board/client-board-update";

			}

			// 수정 메소드

			@RequestMapping(value = "/client-board-update", method = RequestMethod.POST)
			public String BoardUpdatePost(BoardVO list, Model model, RedirectAttributes rttr) {

				boardservice.Boardupdate(list);

				rttr.addFlashAttribute("result", "수정완료되었습니다.");

				System.out.println("수정메소드");
				System.out.println("list" + list);

				return "redirect:/client-board-list";
			}

			// 페이지삭제

			@RequestMapping(value ="/client-board-delete", method = RequestMethod.GET)
			public String Postboarddelete(int bno, RedirectAttributes rttr) {

				boardservice.Boarddelete(bno);
				System.out.println("삭제 완료");

				rttr.addFlashAttribute("result", "삭제되었습니다.");

				return "redirect:/client-board-list";
			}

		}
		 
	
	
	
