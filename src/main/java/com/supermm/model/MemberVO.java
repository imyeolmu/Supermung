package com.supermm.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int mnum; //회원번호
	private String id; //아이디
	private String pw; //비밀번호
	private String name; //이름
	private Date birth; //생년월일
	private String gender; //성별
	private String email; //이메일
	private String phone; //핸드폰번호
	private String zipcode; //우편번호
	private String addr1; //도로명주소
	private String addr2; //지번주소
	private String addr3; //상세주소
	private int mpoint; //회원포인트
	private Date regdate; //가입일
	
	//생성자
	public MemberVO() {}
	
	public MemberVO(int mnum, int mpoint) {
		this.mnum = mnum;
		this.mpoint = mpoint;
	}
	
	public MemberVO(int mnum) {
		this.mnum = mnum;
	}
	
}
