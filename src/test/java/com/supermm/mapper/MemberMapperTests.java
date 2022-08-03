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
	
	/*회원 포인트 수정*/
	@Test
	public void testUpdateMemPoint() {
		
		MemberVO member = new MemberVO();
		member.setMnum(2); //번호
		member.setMpoint(12323445); //수정될 포인트
		
	}
	
	
	
	
}
