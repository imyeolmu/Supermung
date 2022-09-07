package com.supermm.service;

import java.util.List;

import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;

public interface MemberService {

	//회원목록
	public List<MemberVO> getMemList();

	//회원목록(페이징 적용)
	public List<MemberVO> getMemListPaging(Criteria cri);

	//회원 총 인원
	public int getMemTotal(Criteria cri);

	//회원 조회
	public MemberVO getMemInfo(int mnum);

	//정보수정(포인트적립)
	public void updateMemPoint(MemberVO member);


	/********************* 클라이언트 ************************/
	// 회원가입
	public void memberjoin(MemberVO member) throws Exception;

	//로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;

	//아이디중복검사
	public int idCheck(String id) throws Exception;

	//이메일 중복검사   
	public int eCheck(String email) throws Exception;

	//비밀번호 비번으로 업뎃
	public void findpw(MemberVO member)throws Exception;

	//마이페이지 내정보
	public MemberVO getMyInfo(String id) throws Exception;

	//마이페이지 정보수정
	public void updateMyInfo(MemberVO member);

	//마이페이지 금액충전
	public void plusMoney(MemberVO member);

	//회원탈퇴
	public int memDelete(String id);

	//주문자정보
	public MemberVO getClientInfo(String id);

}
