package com.supermm.model;

import java.util.Date;

import lombok.Data;
@Data
public class BoardVO {

		
		private int bno;
		private String btitle;
		private String bwriter_id; 
	    private String bcontent; 
	    private Date bregdate;
	    private Date updatedate;
	    private Integer bhit;
	
	
	
	    
	    
	    public  BoardVO() {}
		
		public BoardVO(int bno) {
			this.bno= bno;
		}
		
		
		


		private int PageNum;
		private int amount;

		private String searchType;
		private String keyWord;
		public BoardVO(int pageNum, int amount) {
			pageNum =1;
			amount =5;
			
			this.PageNum = pageNum;
			this.amount = amount;
		}

	 }

	    
	    

