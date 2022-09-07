package com.supermm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supermm.mapper.BoardMapper;
import com.supermm.model.BoardVO;
import com.supermm.model.ClientCriteria;
import com.supermm.model.Criteria;
import com.supermm.model.NoticeVO;


@Service
public class BoardServcielmpl implements BoardService {
	
	@Autowired
	private BoardMapper boardmapper;
	
	
	@Override
	public List<BoardVO> getBoardPaging(Criteria cri) {
		
		return boardmapper.getBoardPaging(cri);
	}
	
	
	@Override
	public int getBoardTotal(Criteria cri) {
		
		return boardmapper.getBoardTotal(cri);
		
		
	}
	
	
	@Override
	public List<BoardVO> getBoardPaging(ClientCriteria cri) {
		
		return boardmapper.getBoardPaging(cri);
	}
	
	@Override
	public int getBoardTotal(ClientCriteria cri) {
		
		return boardmapper.getBoardTotal(cri);
	}

// 등록
	@Override
	public void Boardregister(BoardVO vo) {
		
		
		 boardmapper.Boardregister(vo);
		
	}
// 조회수 및 상세페이지
	
	//조회수

	public BoardVO Boarddetail(int bno) {

		boardmapper.bincrease(bno);
		
		return boardmapper.Boarddetail(bno);
	}


	// 수정
	
	@Override
	public int Boardupdate(BoardVO vo) {
		
		System.out.println("수정 service입니다");
		
	
		return boardmapper.Boardupdate(vo);
	}
	

	// 삭제

	public int Boarddelete(int bno) {

		return boardmapper.Boarddelete(bno);

	}
	
	
	
	

	

}
