package com.supermm.mapper;

import java.util.List;

import com.supermm.model.ClientCriteria;
import com.supermm.model.Criteria;
import com.supermm.model.NoticeVO;

public interface NoticeMapper {

	//글쓰기하기 (등록)
	public void Noticeregister(NoticeVO vo);

	/*
	 * //게시판 목록 public List<NoticeVO> Noticelist();
	 */

	//상세페이지

	public NoticeVO Noticedetail(int nno);

	//수정

	public int Noticeupdate(NoticeVO vo);

	//삭제
	public int Noticedelete(int nno);

	//페이징
	//상품목록
	public List<NoticeVO> getNoticePaging(Criteria cri);


	//공지사항 총 갯수
	public int getNoticeTotal(Criteria cri);

	public int movepage(int nno);


	//  조회수
	public  void increase(int nno);


	//공지사항목록(페이징 적용)
	public List<NoticeVO> getNoticePaging(ClientCriteria cri);

	//공지사항 총 개수
	public int getNoticeTotal(ClientCriteria cri);





}
