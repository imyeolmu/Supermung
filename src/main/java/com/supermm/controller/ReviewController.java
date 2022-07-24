package com.supermm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminReviewController")
public class ReviewController {

	//review
		@RequestMapping("/admin-review-board")
		public String adreviewboard() {
			
			return "admin/review/admin-review-board";
		}
		@RequestMapping("/admin-review-detail")
		public String adreviewdetail() {
			
			return "admin/review/admin-review-detail";
		}
		
}
