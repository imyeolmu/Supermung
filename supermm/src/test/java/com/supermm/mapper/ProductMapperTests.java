package com.supermm.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.supermm.model.Criteria;
import com.supermm.model.ProductVO;
import com.supermm.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {

	@Autowired
	private ProductMapper mapper;

	@Autowired
	private ProductService service;

	//	상품 목록
	//	@Test
	//	public void prodList() throws Exception {
	//		
	//		System.out.println("prodList().." + mapper.getProdList());
	//		
	//		List list = mapper.getProdList();
	//		for(Object a : list) {
	//			System.out.println("" + a);
	//		}
	//		
	//		service.getProdList().forEach(product -> log.info("" + product));  
	//	}

	//	상품목록(페이징 적용)
	//	@Test
	//	public void testGetProdListPaging() {
	//		
	//		Criteria cri = new Criteria();
	//		//cri.setPageNum(5);
	//		
	//		List list = mapper.getProdListPaging(cri);
	//		list.forEach(product -> log.info("" + product));  
	//		
	//	}

	//	상품 등록
	//	@Test
	//	public void prodInputTest() throws Exception {
	//		
	//		ProductVO vo = new ProductVO();
	//		
	//		vo.setPcategory_fk1("카테1");
	//		vo.setPcategory_fk2("카테2");
	//		vo.setPname("mapper테스트 상품명");
	//		vo.setPimage("이미지");
	//		vo.setPcompany("브랜드");
	//		vo.setPspec("상태");
	//		vo.setPqty(100);
	//		vo.setPrice(10000);
	//		vo.setPpoint(100);
	//		
	//		service.prodInput(vo);
	//	}

	//	카테고리 리스트
	//	@Test
	//	public void cateListTest() throws Exception {
	//		
	//		System.out.println("cateList().." + mapper.cateList());
	//		
	//	}

	//	상품 삭제
	//	@Test
	//	public void ProdDeleteTest() {
	//		
	//		int result = service.prodDelete("5200"); //성공하면1, 실패0
	//		
	//		System.out.println("result : " + result);
	//
	//	}
	
	//	상품 수정
//		@Test
//		public void testUpdateProduct() {
//			
//			ProductVO prod= new ProductVO();
//			prod.setPnum(1); //번호
//			prod.setPcategory_fk1("Home"); //번호
//			prod.setPname("테스트"); //번호
//			prod.setPimage("1"); //번호
//			prod.setPcompany("x"); //번호
//			prod.setPspec("일반"); //번호
//			prod.setPqty(1234445); //수정
//			prod.setPrice(1234445); //수정
//			prod.setPpoint(0); //수정
//			prod.setPcontent("12edd");
//			
//			mapper.ProdUpdate(prod); //수정된 회원........
//			
//		}

	//	카테고리별 상품
	//	@Test
	//	public void cateProdList() throws Exception {
	//		
	//		List list = service.cateProdList("Food");
	//		for(Object a : list) {
	//			System.out.println("" + a);
	//		}	
	//	}
}
