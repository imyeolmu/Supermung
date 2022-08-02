package com.supermm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supermm.mapper.ProductMapper;
import com.supermm.model.Criteria;
import com.supermm.model.ProductVO;

@Service //해당클래스가 Service역할을 한다는 것을 인식할 수 있도록 추가
public class ProductServicelmpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;

	//상품목록
	@Override
	public List<ProductVO> getProdList() {
	
		System.out.println("productList service..");
		
		return mapper.getProdList();
	}

	//상품목록(페이징 적용)
	@Override
	public List<ProductVO> getProdListPaging(Criteria cri) {
		
		System.out.println("productListPaging service..");		
		return mapper.getProdListPaging(cri);
	}
	
	//상품 총 개수
	@Override
	public int getProdTotal(Criteria cri) {

		System.out.println("getProdTotal service..");		
		
		return mapper.getProdTotal(cri);
	}
	
	//상품등록
	@Override
	public void prodInput(ProductVO prod) {
		
		System.out.println("productInput service..");
		
		mapper.prodInput(prod);
	}

	//상품 삭제
	@Override
	public int prodDelete(String pnum) {
		
		System.out.println("productDelete service..");
		
		return mapper.prodDelete(pnum);
	}
	
}
