package com.supermm.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.supermm.model.Criteria;
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
	
/* 	회원목록
	@Test
	public void MemList() throws Exception {
		
		System.out.println("MemList().." + mapper.getMemList());
		
		List list = mapper.getMemList();
		for(Object a : list) {
			System.out.println("" + a);
		}
		
		service.getMemList().forEach(member -> log.info("" + member));  
	}
*/
/* 	회원목록(페이징 적용)
	@Test
	public void testGetMemListPaging() {
		Criteria cri = new Criteria();
		
		List list = mapper.getMemListPaging(cri);
		list.forEach(member -> log.info("" + member));
	}	
*/

	
/*	회원정보 조회(포인트 포함)
	@Test
	public void testGetMemInfo() {
		
		//실제 존재하는 회원
		int mnum = 8;
		
		//회원정보
		System.out.println("" + service.getMemInfo(mnum));
		
		//포인트
		System.out.println("" + mapper.getMemPoint(mnum));
	}
*/ 	
	
	/*회원 포인트 수정*/
	@Test
	public void testUpdateMemPoint() {
		
		MemberVO member = new MemberVO();
		member.setMnum(1); //번호
		member.setMpoint(9999); //수정될 포인트
		
		
	}

	
	
	
	
}
