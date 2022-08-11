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
	public int getMemTotal(Criteria cri) {

		System.out.println("getMemTotal service..");

		return mapper.getMemTotal(cri);
	}


	//회원 조회
	@Override
	public MemberVO getMemInfo(int mnum) {

		System.out.println("getMemInfo service..mnum");

		return mapper.getMemInfo(mnum);	
	}

	//정보수정(포인트적립)
	@Override
	public void updateMemPoint(MemberVO member) {

		System.out.println("updateMemPoint service..");

		mapper.updateMemPoint(member);
	}


	/********************* 클라이언트 ************************/
	//로그인
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		System.out.println("memberLogin service..");

		return mapper.memberLogin(member);
	}

	//회원가입
	@Override
	public void memberjoin(MemberVO member) throws Exception {

		System.out.println("memberjoin service..");
		
		mapper.memberjoin(member);

	}

	//아이디 중복체크
	@Override
	public int idCheck(String id) throws Exception {
		
		System.out.println("idCheck service..");
		
		return mapper.idCheck(id);
	}

	//마이페이지 내정보
	@Override
	public MemberVO getMyInfo(String id) throws Exception {

		System.out.println("getMyInfo service..");

		return mapper.getMyInfo(id);
	}

	//마이페이지 정보수정
	@Override
	public void updateMyInfo(MemberVO member) {
		
		System.out.println("updateMyInfo service..");
		
		mapper.updateMyInfo(member);
	}
	
	//마이페이지 금액충전
	@Override
	public void plusMoney(MemberVO member) {
		
		System.out.println("moneyPlus service..");
		
		mapper.plusMoney(member);
	}
	
	//회원탈퇴
	@Override
	public int memDelete(String id) {
		
		System.out.println("memDelete service..");
		
		return mapper.memDelete(id);
	}

	//주문자정보
//	@Override
//	public MemberVO getClientInfo(String id) {
//		
//		System.out.println("getMemInfo service..id");
//		
//		return mapper.getClientInfo(id);
//		
//	}
}
