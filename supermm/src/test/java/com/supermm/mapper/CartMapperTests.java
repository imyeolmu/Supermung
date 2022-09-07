package com.supermm.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.supermm.model.CartVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {

	@Autowired 
	private CartMapper mapper;
	
	/* 장바구니 제거(주문 처리) */
	@Test
	public void deleteOrderCart() {
		String id = "user";
		int pnum = 11;
		
		CartVO vo = new CartVO();
		vo.setId(id);
		vo.setPnum(pnum);
		
		mapper.deleteOrderCart(vo);
		
	}
}
