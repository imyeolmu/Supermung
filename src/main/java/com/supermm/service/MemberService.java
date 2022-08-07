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

	/*
	 * //비밀번호 찾기 public void findpw(String email, String id) throws Exception;
	 * 
	 * //비밀번호 중복 검사 public int findpwchk(MemberVO member) throws Exception;
	 * 
	 */

	//마이페이지 내정보
	public MemberVO getMyInfo(int mnum) throws Exception;

}
