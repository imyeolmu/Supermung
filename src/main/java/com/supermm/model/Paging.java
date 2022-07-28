package com.supermm.model;


import lombok.Data;

//import org.springframework.stereotype.Component;

/*@Component*/
@Data
public class Paging {
	private int totalCnt;
	
	private int viewPage;
	private int startIndex;
	private int blockSize = 5;
	private int currentBlock; // 현재 블럭의 위치
	private int blockStart;
	private int blockEnd;
	private int prevPage;
	private int nextPage;
	
	private int cntPerPage; // 한페이지당 게시글 수
	private int totalPage; // 전체페이지 수
	
	private int startRowNum; //rowNum 시작번호
	
	// 기본 생성자
	public Paging() {}
	
	// 인자 생성자
	public Paging(int totalCnt, int viewPage, int cntPerPage) {
		this.totalCnt = totalCnt;
		this.cntPerPage = cntPerPage;
		this.viewPage = viewPage;
		
		// 객체 생성시에 paging 처리 계산
		setValue(totalCnt, cntPerPage);
	}
	
	public void setValue(int totalCnt, int cntPerPage) {
		this.totalPage = (int) Math.ceil((double)totalCnt/cntPerPage);
		this.startIndex = (viewPage - 1)*cntPerPage;
		this.currentBlock = (viewPage-1)/blockSize;
		this.blockStart = (blockSize*currentBlock)+1;
		this.blockEnd = blockStart + (blockSize - 1);
		
		if(blockEnd > totalPage) blockEnd = totalPage;
		
		this.prevPage = blockStart - 1;
		this.nextPage = blockEnd + 1;
		
		if(nextPage > totalPage) nextPage = totalPage;
		
		// 행번호 출력하기
		// totalCnt 107 (11page)
//		1 페이지 -> 107 ~ 98
//		2 페이지 -> 97 ~ 88
//		3 페이지 -> 87 ~ 78
//		4 페이지 -> 77 ~ 68
//		~~~
//		1페이지의 startRowNum = totalCnt - 0
//		2페이지의 startRowNum = totalCnt - 10
//		3페이지의 startRowNum = totalCnt - 20
		
		// 페이지별 행시작번호 구하기
		startRowNum = totalCnt - (viewPage-1)*cntPerPage;
	}
}
