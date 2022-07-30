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
	public int getMemTotal();
	
	//상세보기
	public MemberVO getMemInfo(int mnum);
	
	//회원 포인트 조회
	public MemberVO getMemPoint(int mnum);
	
	//정보수정(포인트적립)
	public int updateMemPoint(MemberVO member);
	
	//회원삭제
	//정보수정(포인트적립)
}
