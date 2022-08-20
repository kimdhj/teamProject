package com.spring.mystore.user.my;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class MyController {
		
	@RequestMapping("my_Main.do")
	public String myMain() {
		System.out.println("���������� ����");
		return "my/my_Main";
	}
	@RequestMapping("my_RequestDetail.do")
	public String myRequestDetail() {
		System.out.println("���ǻ�");
		return "my/my_RequestDetail";
	}
	@RequestMapping("my_RequestWrite.do")
	public String myRequestWrite() {
		System.out.println("���Ǳ� �ۼ�");
		return "my/my_RequestWrite";
	}
	@RequestMapping("my_RequestList.do")
	public String myRequest() {
		System.out.println("���Ǳ� ���");
		return "my/my_RequestList";
	}
	@RequestMapping("/my_Order.do")
	public String myOrder() {
		System.out.println("���������� �ֹ���ȸ");
		return"/WEB-INF/view/user/my/my_Order";
	}
	@RequestMapping("my_Review.do")
	public String myReview() {
		System.out.println("���������� ����");
		return"/my/my_Review";
	}
	@RequestMapping("my_AddReadCancel.do")
	public String myAddReadCancel() {
		System.out.println("��");
		return "my/my_AddReadCancel";
	}
}
