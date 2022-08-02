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

}
