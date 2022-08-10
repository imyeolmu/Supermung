package com.supermm.model;

import lombok.Data;

@Data //lombok
public class ClientPageMakeDTO {
   
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private boolean prev, next; //이전페이지, 다음페이지 존재유무
	private int realEnd; //전체 마지막페이지
	private int realStart; //전체 시작페이지
	
	private int total; //전체 게시물 수
	
	private int pageNum; //조회 페이지 번호
	private int amount; //보여질 데이터 개수
	
	
	private ClientCriteria cri; //현재페이지, 페이지당 게시물 표시수 정보
	
	
	//생성자
	public ClientPageMakeDTO(ClientCriteria cri,int total) {
		
		this.cri = cri;
		this.total = total;
		
		//////
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		//////
		
		//마지막페이지
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		//시작페이지
		this.startPage = this.endPage - 9;
		
		//전체 마지막페이지
		this.realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
		
		//전체 시작페이지
		this.realStart = this.realEnd - (this.realEnd-1);
		
		//전체 마지막페이지(realEnd)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage)값 조정 (화면에 보일 마지막페이지 유효성 체크)
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//시작페이지(startPage)값이 1보다 큰 경우 true
		this.prev = this.startPage > 1;
		
		//마지막페이지(endPage)값이 1보다 큰 경우 true 
		this.next = this.endPage < realEnd;
	}
   
   
}
