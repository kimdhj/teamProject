package com.spring.mystore.user.my;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class MyController {
		
	@RequestMapping("my_Main.do")
	public String myMain() {
		System.out.println("마이페이지 메인");
		return "my/my_Main";
	}
	@RequestMapping("my_RequestDetail.do")
	public String myRequestDetail() {
		System.out.println("문의상세");
		return "my/my_RequestDetail";
	}
	@RequestMapping("my_RequestWrite.do")
	public String myRequestWrite() {
		System.out.println("문의글 작성");
		return "my/my_RequestWrite";
	}
	@RequestMapping("my_RequestList.do")
	public String myRequest() {
		System.out.println("문의글 목록");
		return "my/my_RequestList";
	}
	@RequestMapping("/my_Order.do")
	public String myOrder() {
		System.out.println("마이페이지 주문조회");
		return"/WEB-INF/view/user/my/my_Order";
	}
	@RequestMapping("my_Review.do")
	public String myReview() {
		System.out.println("마이페이지 리뷰");
		return"/my/my_Review";
	}
	@RequestMapping("my_AddReadCancel.do")
	public String myAddReadCancel() {
		System.out.println("뀨");
		return "my/my_AddReadCancel";
	}
}
