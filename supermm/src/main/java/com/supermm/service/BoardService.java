package com.supermm.service;

import java.util.List;

import com.supermm.model.ClientCriteria;
import com.supermm.model.Criteria;
import com.supermm.model.NoticeVO;
import com.supermm.model.BoardVO;

public interface BoardService {
	

	public int getBoardTotal(Criteria cri);
	

	List<BoardVO> getBoardPaging(Criteria cri);

	
	
	//등록
	public void Boardregister(BoardVO vo);

	//상세조회
	public BoardVO Boarddetail(int bno);
	
	  //봉사게시판 목록(페이징 적용) 
	
	public List<BoardVO> getBoardPaging(ClientCriteria cri);
	  
	  //봉사게시판 총 개수
	
	public int getBoardTotal(ClientCriteria cri);
	 

	//수정하기
	
	public int Boardupdate(BoardVO vo);


	//삭제하기

	public int  Boarddelete(int bno);

	
	

	

}
