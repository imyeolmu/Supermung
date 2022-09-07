package com.supermm.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;
import com.supermm.model.OrderCancelDTO;
import com.supermm.model.OrderDTO;
import com.supermm.model.PageMakeDTO;
import com.supermm.service.MemberService;
import com.supermm.service.OrderService;

@Controller("adminMemberController")
public class MemberController {

	// 메일 보내기: javamailSender 객체 타입인 mailSender 생성
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MemberService service;

	@Autowired
	private OrderService oservice;

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
	public String memPointUpdatePOST(MemberVO member, Model model) {

		System.out.println("회원 포인트 수정..");

		service.updateMemPoint(member);
		model.addAttribute("member" , member);

		return "redirect: /member-list";
	}



	/********************* 클라이언트 ************************/
	// 로그인 페이지 이동
	@RequestMapping(value = "/client-login", method = RequestMethod.GET)
	public String loginGET(MemberVO member) {

		System.out.println("로그인 페이지 진입");

		return "client/login/client-login";
	}

	// 로그인
	@RequestMapping(value = "/client-login", method = RequestMethod.POST)
	public String loginPost(HttpServletRequest request, MemberVO member) throws Exception {

		// 정상적으로 메서드가 요청 되었는지 데이터 확인 System.out.println("login 메소드 진입");
		// System.out.println("전달된 데이터:" + member);

		// 세션 초기화하기
		HttpSession session = request.getSession();
		// 두번쨰 변수 선언 - 값을 담을 변수
		MemberVO vo = service.memberLogin(member);

		if (vo == null) {
			// 일치하지 않는 아이디,비밀번호경우
			int result = 0;
			session.setAttribute("result", result); 

			return "redirect:/client-login";

		}

		// 일치하는 아이디, 비밀번호 경우 - 로그인 성공
		session.setAttribute("member", vo);
		System.out.println("로그인성공");

		// 로그인 id 확인
		System.out.println("id :" + member.getId());

		// 아이디 저장
		session.setAttribute("memberid", vo.getId());
		return "redirect:/client-main";
	}
	
	
//	시큐리티 적용	
//	HttpSession session = request.getSession();
//	  String rawPw =""; //인코딩 전 비밀번호 
//	  String encodePw =""; //인코딩 후 비밀번호
//	  
//	// 두번쨰 변수 선언 - 값을 담을 변수
//	MemberVO vo = service.memberLogin(member);
//
//	if (vo != null) {// 일치하는 아이디가 존재시
//		
//		rawPw = member.getPw(); //비밀번호 데이터를 얻음 
//		encodePw = vo.getPw();//데이터 베이스에 저장한 인코딩된 비밀번호
//		
//		if(true ==  pwEncoder.matches(rawPw, encodePw)) {
//			vo.setPw("");
//			session.setAttribute("member", vo);
//			return "redirect:/client-main";
//			
//		
//		}else {
//		
//			session.setAttribute("result", 0);
//			return "redirect:/client-login";
//		
//	
//
//		}
//	 } else {
//
//	/*// 일치하는 아이디, 비밀번호 경우 - 로그인 성공
//	session.setAttribute("member", vo);?--
//	System.out.println("로그인성공");
//
//	// 로그인 id 확인
//	System.out.println("id :" + member.getId());
//*/
//	// 아이디 저장
//	session.setAttribute("result", 0);
//	return "redirect:/client-login";
//}
//
//}
	

	// 메인페이지 로그아웃
	@RequestMapping(value = "/client-logout", method = RequestMethod.GET)
	public String loginmainGET(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		// invalidate(): 세션 전체를 무효화하는 메서드 이다
		session.invalidate();

		System.out.println("logout 메서드 진입입니다");

		return "redirect:/client-main";
	}

	// 관리자 페이지 로그아웃
	@RequestMapping(value = "/admin-logout", method = RequestMethod.GET)
	public String loginadminGET(HttpServletRequest request) throws Exception {

		System.out.println("어드민logout 메서드 진입입니다");
		HttpSession session = request.getSession();

		// invalidate(): 세션 전체를 무효화하는 메서드 session.invalidate();
		session.invalidate();

		return "redirect:/client-main";

	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "/client-register", method = RequestMethod.GET)
	public String joinGET() {

		System.out.println("회원가입 페이지 진입");

		return "client/login/client-register";
	}

	// 회원가입 메소드
	@RequestMapping(value = "/client-register", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		/*
		 * String rawPw =""; //인코딩 전 비밀번호 String encodePw =""; //인코딩 후 비밀번호
		 * 
		 * 
		 * rawPw = member.getPw(); //비밀번호 데이터를 얻음 encodePw = pwEncoder.encode(rawPw);
		 * //비밀번호를 인코딩 member.setPw(encodePw); // 인코딩한 member객체를 다시 저장한다
		 */
		service.memberjoin(member);

		return "redirect:/client-login";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String id) throws Exception {

		System.out.println("memberIdChk() 진입");

		int result = service.idCheck(id);

		if (result != 0) {

			return "fail";
		} else {
			return "success";
		}
	}

	//이메일 중복 체크

	@RequestMapping(value = "/membereChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberePOST(String email) throws Exception{

		int result = service.eCheck(email);

		if (result != 0) {

			return "fail";
		} else {
			return "success";
		}
	}

	// 비번찾기 페이지 이동
	@RequestMapping(value = "/client-pwsearch", method = RequestMethod.GET)
	public String pwsearchget() {

		System.out.println("비번찾기 페이지 이동");

		return "client/login/client-pwsearch";
	}

	//새비밀번호수정
	@RequestMapping(value = "/client-pwsearch", method = RequestMethod.POST)
	public String updatePW(MemberVO member, HttpSession session) throws Exception {

		System.out.println("pw정보수정");

		//세션 삭제
		session.invalidate();

		service.findpw(member);
		System.out.println("member : "+member);

		return "redirect: /client-login";
	}

	// 이메일 인증번호

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)

	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호" + email);

		// 인증번호(난수)생성

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		// 난수 확인 System.out.println("인증번호" + checkNum);

		// 이메일 보내기

		String setFrom = "dladmswl3130@naver.com"; // 자신의 이메일 계정의 주소
		String toMail = email; // 수신 받을 이메일
		String title = "슈펴멍뭉 인증번호 이메일 입니다"; // 제목작성
		String content = // 자신이 보낼 이메일 내용
				"슈퍼멍뭉을 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는" + checkNum + "입니다" + "<br>" + "해당 인증번호를 인증번호 확인란에 기입해주세요";

		// 이메일 전송을 위한 코드

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {

			e.printStackTrace();

		}

		String num = Integer.toString(checkNum);
		System.out.println(num);
		return num;

	}


	//마이페이지 조회
	@RequestMapping(value="/client-mypage", method = RequestMethod.GET)
	public String getMyInfo(HttpSession session, Model model, MemberVO member) throws Exception {

		System.out.println("마이페이지 내정보..");

		//로그인 id 불러오기
		String id=(String)session.getAttribute("memberid");
		System.out.println("id : " + id);

		model.addAttribute("member", service.getMyInfo(id));
		model.addAttribute("id", id);

		return "client/mypage/mypage-info";
	}

	//마이페이지 정보수정
	@RequestMapping(value="/client-mypage", method = RequestMethod.POST)
	public String updateMyInfo(MemberVO member) throws Exception {

		System.out.println("마이페이지 정보수정");

		service.updateMyInfo(member);
		System.out.println("member : "+member);

		return "redirect: /client-mypage";
	}

	//마이페이지 금액충전(페이지로 이동)
	@RequestMapping(value="/client-money", method = RequestMethod.GET)
	public String moneyPlus(HttpSession session, Model model, MemberVO member) throws Exception {

		System.out.println("마이페이지 금액충전 페이지..");

		//로그인 id 불러오기
		String id=(String)session.getAttribute("memberid");
		System.out.println("id : " + id);

		model.addAttribute("member", service.getMyInfo(id));
		model.addAttribute("id", id);

		return "client/mypage/mypage-money";
	}

	//마이페이지 금액충전
	@RequestMapping(value="/client-money", method = RequestMethod.POST)
	public String moneyPlusPOST(MemberVO member) throws Exception {

		System.out.println("마이페이지 금액충전");

		service.plusMoney(member);
		System.out.println("member : "+ member);

		return "redirect: /client-money";
	}

	//마이페이지 포인트
	@RequestMapping(value="/client-point", method = RequestMethod.GET)
	public String myPoint(HttpSession session, MemberVO member, Model model) throws Exception {

		System.out.println("마이페이지 내정보..");

		//로그인 id 불러오기
		String id=(String)session.getAttribute("memberid");
		System.out.println("id : " + id);

		model.addAttribute("member", service.getMyInfo(id));
		model.addAttribute("id", id);

		return "client/mypage/mypage-point";
	}

	//회원탈퇴
	@RequestMapping(value = "/client-delete", method = RequestMethod.GET)
	public String memDeleteGET(HttpSession session, Model model, MemberVO member) throws Exception {

		System.out.println("회원탈퇴페이지..");

		//로그인 id 불러오기
		String id=(String)session.getAttribute("memberid");
		System.out.println("id : " + id);

		model.addAttribute("member", service.getMyInfo(id));
		model.addAttribute("id", id);

		return "client/mypage/client-delete";
	}

	//회원탈퇴
	@RequestMapping(value = "/client-delete", method = RequestMethod.POST)
	public String memDeletePOST(HttpSession session, MemberVO member) throws Exception {

		System.out.println("회원탈퇴성공..");

		//로그인 id 불러오기	
		String id=(String)session.getAttribute("memberid");

		service.memDelete(id);

		//세션 삭제
		session.invalidate();

		return "redirect: /client-main";
	}

	//내구매내역
	@RequestMapping(value = "/client-history", method = RequestMethod.GET)
	public String orderHistory(HttpSession session, MemberVO member, Model model) throws Exception {

		System.out.println("내구매내역..");

		//로그인 id 불러오기
		String id=(String)session.getAttribute("memberid");
		System.out.println("id : " + id);

		model.addAttribute("member", service.getMyInfo(id));
		model.addAttribute("id", id);

		Criteria cri = new Criteria(1,100);

		List<OrderDTO> list = oservice.getOrderList(cri);

		if(!list.isEmpty()) { //주문 있을때
			model.addAttribute("list",list);
			model.addAttribute("pageMake", new PageMakeDTO(cri, oservice.getOrderTotal(cri)));

		} else { //주문 없을때
			model.addAttribute("listCheck", "empty");
		}

		return "client/mypage/mypage-history";
	}

	//내주문취소
	@PostMapping("/myOrderCancel")
	public String orderCancelPOST(HttpSession session, OrderCancelDTO dto, Model model) throws Exception {

		System.out.println("주문취소..");

		//로그인 id 불러오기	
		String id=(String)session.getAttribute("memberid");

		try {
			oservice.orderCancel(dto);	

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect: /client-history";
	}

}
