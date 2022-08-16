package com.supermm.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.supermm.model.CategoryVO;
import com.supermm.model.ProductVO;
import com.supermm.service.ChartService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ChartMapperTest {

		@Autowired
		private ChartMapper mapper;
		
		@Autowired
		private ChartService service;
		
		/*// 카테고리등록
		@Test
		public void cateogryInputTest() throws Exception{
			
			ProductVO category = new ProductVO();
			
			category.setPcategory_fk1("Food");
			
			System.out.println(service.categoryTotal(category));
			*/
		@Test
		public void cateogryInputTest() throws Exception{
			
			ProductVO category = new ProductVO();
			
			System.out.println(service.bestProduct(category));
		}
			
}
