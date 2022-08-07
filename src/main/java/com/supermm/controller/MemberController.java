package com.supermm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	//로그인 페이지 이동
	@RequestMapping(value = "/client-login" , method = RequestMethod.GET)
	public String loginGET(MemberVO member) {

		System.out.println("로그인 페이지 진입");

		return "client/login/client-login";
	}

	//로그인 
	@RequestMapping(value="/client-login",  method = RequestMethod.POST)
	public String loginPost(HttpServletRequest request, MemberVO member) throws Exception{

		//정상적으로 메서드가 요청 되었는지 데이터 확인 System.out.println("login 메소드 진입");
		// System.out.println("전달된 데이터:" + member);

		//세션 초기화하기
		HttpSession session = request.getSession();
		//두번쨰 변수 선언 - 값을 담을 변수
		MemberVO vo = service.memberLogin(member);
		if(vo == null) {
			//일치하지 않는 아이디,비밀번호경우	
			int result = 0;
			session.setAttribute("result", result);
			session.invalidate();
			return "redirect:/client-login";
		}

		// 일치하는 아이디, 비밀번호 경우 - 로그인 성공
		session.setAttribute("member", vo);
		// 장바구니 :> 아이디 저장
		session.setAttribute("memberid", vo.getId());
		
		//session.setAttribute("id", id);
		System.out.println("로그인성공");
		return "redirect:/client-main";
	}

	//메인페이지 로그아웃
	@RequestMapping(value="/client-logout", method = RequestMethod.GET)
	public String loginmainGET(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		//invalidate(): 세션 전체를 무효화하는 메서드 이다
		session.invalidate();

		System.out.println("logout 메서드 진입입니다");

		return "redirect:/client-main";
	}

	//관리자 페이지 로그아웃
	@RequestMapping(value="/admin-logout", method = RequestMethod.GET) public
	String loginadminGET(HttpServletRequest request) throws Exception {

		System.out.println("어드민logout 메서드 진입입니다"); HttpSession session =
				request.getSession();

		//invalidate(): 세션 전체를 무효화하는 메서드 session.invalidate();
		session.invalidate();

		return "redirect:/client-main";

	}

	//회원가입 페이지 이동
	@RequestMapping(value="/client-register", method = RequestMethod.GET)
	public String joinGET() {

		System.out.println("회원가입 페이지 진입");
		
		return "client/login/client-register";
	}


	//회원가입 메소드
	@RequestMapping(value="/client-register", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		service.memberjoin(member);

		System.out.println("회원가입 서비스 성공");

		return "redirect:/client-main";
	}



	//아이디 중복 체크 보류
	@RequestMapping(value="/memberIdChk" ,method = RequestMethod.POST)		  
	@ResponseBody 
	public String memberIdChkPOST(String id) throws Exception {

		System.out.println("memberIdChk() 진입");

		int result = service.idCheck(id);

		if(result !=0) {

			return "fail";
		}else {
			return"success";
		}
	}

	//비번찾기 페이지 이동
	@RequestMapping(value="/client-pwsearch", method = RequestMethod.GET)
	public String pwsearchget() {

		System.out.println("비번찾기 페이지 이동");

		return "client/login/client-pwsearch";
	}
	
	//마이페이지
	@RequestMapping(value="/client-mypage", method = RequestMethod.GET)
	public void getMyInfoGET(int mnum, Model model) throws Exception {

		System.out.println("마이페이지 내정보..");

		model.addAttribute("myinfo", service.getMyInfo(mnum));

	}

}
