package com.supermm.mapper;

import java.util.List;

import com.supermm.model.BoardVO;
import com.supermm.model.ClientCriteria;
import com.supermm.model.Criteria;
import com.supermm.model.NoticeVO;

public interface BoardMapper {

	public List<BoardVO> getBoardPaging(Criteria cri);


	// 총 갯수
	public int getBoardTotal(Criteria cri);

	public int movepage(int bno);
	
	//목록(페이징 적용)
	public List<BoardVO> getBoardPaging(ClientCriteria cri);

	// 총 개수
	public int getBoardTotal(ClientCriteria cri);

	// 상세페이지
	public BoardVO Boarddetail(int bno);
	
	// 조회수
	public void bincrease(int bno);
	
	
	//등록
	public void Boardregister(BoardVO vo);
	
	//수정

	public int Boardupdate(BoardVO vo);

		//삭제
	public int Boarddelete(int bno);
	
	
	
	
	
	
	
}


