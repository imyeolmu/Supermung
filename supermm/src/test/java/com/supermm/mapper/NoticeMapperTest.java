package com.supermm.mapper;

import java.util.List;

import javax.swing.plaf.basic.BasicSplitPaneUI.KeyboardDownRightHandler;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.supermm.model.Criteria;
import com.supermm.model.NoticeVO;
import com.supermm.service.NoticeService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeMapperTest {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Autowired
	private NoticeService service;
	
	
/*@Test*/
//등록테스트
/*public void Noticeregister(){
	
	NoticeVO vo =new NoticeVO();
	
	 vo.setNno(1);
	 vo.setNtitle("테스트");
	vo.setNcontent("테스트");
	vo.setNwriter_id("test");


	
	service.Noticeregister(vo);
		*/
		

	//목록 테스트

/*	public void NoticelistGet() {
	*/
	
	
		/* service.Noticelist().forEach(notice->System.out.println("" + notice)); */
	
	
	/*
	List list = mapper.Noticelist();
	for(int i=0; i <list.size(); i++) {
		
		System.out.println("" + list.get(i));
		
		
		
		 * for(Object a: list){ System.out.println("" + a); }
		 * 
		 */
			
	// 수정 테스트



/*	public void updateTest(){
	
	NoticeVO vo = new NoticeVO();
	
	 vo.setNno(1); 
	vo.setNwriter_id("안녕하세요");
	vo.setNcontent("수정이랍니다");
	vo.setNtitle("수정입니다");	
	
	
	
	mapper.Noticeupdate(vo);
	
	
}


*/

}


			
