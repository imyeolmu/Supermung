package com.supermm.service;

import java.util.List;

import com.supermm.model.ClientCriteria;
import com.supermm.model.Criteria;
import com.supermm.model.NoticeVO;

public interface NoticeService {
	//등록
	public void Noticeregister(NoticeVO vo);

	/*
	 * //리스트 public List<NoticeVO> Noticelist();
	 */
	//상세페이지



	public NoticeVO Noticedetail(int nno);

	//수정하기
	
	public int Noticeupdate(NoticeVO vo);


	//삭제하기

	public int  Noticedelete(int nno);



	//페이징
	public int getNoticeTotal(Criteria cri);

	List<NoticeVO> getNoticePaging(Criteria cri);
	
	//공지사항목록(페이징 적용)
	public List<NoticeVO> getNoticePaging(ClientCriteria cri);

	//공지사항 총 개수
	public int getNoticeTotal(ClientCriteria cri);















}
