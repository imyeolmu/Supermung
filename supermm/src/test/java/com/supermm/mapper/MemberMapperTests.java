package com.supermm.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.supermm.model.MemberVO;
import com.supermm.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private MemberService service;

	//	회원정보(포인트) 수정
	//	@Test
	//	public void testUpdateMemPoint() {
	//		
	//		MemberVO member = new MemberVO();
	//		member.setMnum(2); //번호
	//		member.setMpoint(12323445); //수정될 포인트
	//		
	//		service.updateMemPoint(member); //수정된 회원........
	//		
	//	}

	/********************* 클라이언트 ************************/
	// 회원 가입 쿼리 테스트 
	/*
	 * @Test public void memberjoin() throws Exception{
	 * 
	 * MemberVO member = new MemberVO();
	 * 
	 * 
	 * 
	 * member.setId("test"); member.setPw("test"); member.setName("test");
	 * member.setBirth("test"); member.setEmail("test"); member.setGender("test");
	 * member.setPhone("test"); member.setAddr1("test"); member.setAddr2("test");
	 * member.setAddr3("test");
	 * 
	 * 
	 * 
	 * 
	 * mapper.memberjoin(member);
	 * 
	 * }
	 */

	//	아이디 중복 검사 
	//	@Test
	//	public void idCheck() throws Exception{
	//
	//		String id ="test";
	//		String id2= "ddd";
	//		mapper.idCheck(id);
	//		mapper.idCheck(id2);
	//		
	//	}

	//	로그인 메서드 테스트 
	//	@Test
	//	public void memberLogin() throws Exception{
	//		MemberVO member = new MemberVO();
	//
	//		// 올바른 아이디 입력시
	//		member.setId("test");
	//		member.setPw("test");
	//
	//		//틀린 아이디 비번 입력시
	//		member.setId("test1");
	//		member.setPw("test1");
	//
	//		mapper.memberLogin(member);
	//
	//		System.out.println("결과값:" + mapper.memberLogin(member));
	//
	//	}

	//	마이페이지 내정보
	//	@Test
	//	public void getMyInfoTest() throws Exception {
	//
	//		String id = "test";
	//		//		MemberVO member = mapper.getMyInfo(mnum);
	//
	//		System.out.println("member.." + service.getMyInfo(id));
	//	}

	//	마이페이지 정보수정
		@Test
		public void testUpdateMyInfo() {
			
			MemberVO member = new MemberVO();
			member.setId("admin");
			member.setPw("123");
			member.setEmail("12345");
			member.setPhone("12345");
			member.setAddr1("12345");
			member.setAddr2("12345");
			member.setAddr3("12345");
			
			service.updateMyInfo(member);
		}
	
	
	
	
	//	마이페이지 금액충전
	//		@Test
	//		public void testMoneyPlus() {
	//			
	//			MemberVO member = new MemberVO();
	//			member.setId("test"); //아이디
	//			member.setMoney(300000); //금액충전
	//			
	//			service.plusMoney(member); //수정된 회원........
	//			
	//		}

	//	회원탈퇴
	//	@Test
	//	public void memDeleteTest() {
	//		
	//		int result = service.memDelete("asdf"); 
	//		
	//		System.out.println("result : " + result);
	//	}


}
