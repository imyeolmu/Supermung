package com.supermm.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private Integer nno;
	private String ntitle;
	private String nwriter_id; 
    private String ncontent; 
    private Date nregdate;
    private Date nupdateDate;
    private Integer nhit;
    private String nfiles;


	
	
public  NoticeVO() {}
	
	public NoticeVO(Integer nno) {
		this.nno= nno;
	}
	
	
	

	private int PageNum;
	private int amount;

	private String searchType;
	private String keyWord;
	public NoticeVO(int pageNum, int amount) {
		pageNum =1;
		amount =5;
		
		this.PageNum = pageNum;
		this.amount = amount;
	}
}
