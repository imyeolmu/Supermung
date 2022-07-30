package com.supermm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supermm.mapper.MemberMapper;
import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;

@Service
public class MemberServicelmpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	
	//회원목록
	@Override
	public List<MemberVO> getMemList() {
		
		System.out.println("memberList service..");
		
		return mapper.getMemList();
	}
	
	//회원목록(페이징 적용)
	@Override
	public List<MemberVO> getMemListPaging(Criteria cri) {

		System.out.println("memberListPaging service..");
		
		return mapper.getMemListPaging(cri);
	}
	
	//회원 총 인원
	@Override
	public int getMemTotal() {
		
		System.out.println("getMemTotal service..");
		
		return mapper.getMemTotal();
	}
	
	
	//회원 조회
	@Override
	public MemberVO getMemInfo(int mnum) {
		
		System.out.println("getMemInfo service..");
		
		return mapper.getMemInfo(mnum);		
	}
	
	//회원 포인트 조회
	@Override
	public MemberVO getMemPoint(int mnum) {
		
		System.out.println("getMemPoint service..");
		
		return mapper.getMemPoint(mnum);
	}
	
	//정보수정(포인트적립)
	@Override
	public int updateMemPoint(MemberVO member) {

		System.out.println("updateMemPoint service..");
		
		return mapper.updateMemPoint(member);
	}
	
	
}
