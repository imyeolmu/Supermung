package com.supermm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supermm.mapper.NoticeMapper;
import com.supermm.model.ClientCriteria;
import com.supermm.model.Criteria;
import com.supermm.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticemapper;

//등록하기		
	public void Noticeregister(NoticeVO vo) {

		noticemapper.Noticeregister(vo);
	}

//목록
	public List<NoticeVO> Noticelist() {

		return noticemapper.Noticelist();
	}

	public NoticeVO Noticedetail(Integer nno) {

		noticemapper.increase(nno);
		
		return noticemapper.Noticedetail(nno);
	}

	// 수정

	public Integer Noticeupdate(NoticeVO vo) {

		return noticemapper.Noticeupdate(vo);

	}

	// 삭제

	public Integer Noticedelete(Integer nno) {

		return noticemapper.Noticedelete(nno);

	}

	// 페이징 적용
	public List<NoticeVO> getNoticePaging(Criteria cri) {

		return noticemapper.getNoticePaging(cri);
	}

	
	public int getNoticeTotal(Criteria cri) {

		return noticemapper.getNoticeTotal(cri);
	}


	@Override
	public List<NoticeVO> getNoticePaging(ClientCriteria cri) {
		
		return noticemapper.getNoticePaging(cri);
	}
	
	@Override
	public int getNoticeTotal(ClientCriteria cri) {
		
		return noticemapper.getNoticeTotal(cri);
	}

	



	 
	 
	 
}
