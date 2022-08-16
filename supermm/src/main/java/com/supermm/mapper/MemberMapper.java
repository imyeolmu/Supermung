package com.supermm.mapper;

import java.util.List;

import com.supermm.model.Criteria;
import com.supermm.model.MemberVO;

public interface MemberMapper {

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
	//로그인
	public MemberVO memberLogin(MemberVO member);

	//회원가입 
	public void memberjoin(MemberVO member);

	//아이디 중복 검사
	public int idCheck(String id);

	//이메일 중복 검사
	public int eCheck(String email);

	//비밀번호 수정
	public void findpw(MemberVO member);

	//마이페이지 내정보
	public MemberVO getMyInfo(String id);

	//마이페이지 정보수정
	public void updateMyInfo(MemberVO member);

	//마이페이지 금액충전
	public void plusMoney(MemberVO member);

	//회원탈퇴
	public int memDelete(String id);

	//주문자 주소정보
	public MemberVO getClientInfo(String id);



}
