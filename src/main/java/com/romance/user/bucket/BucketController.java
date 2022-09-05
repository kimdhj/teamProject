package com.romance.user.bucket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.romance.security.JwtUtils;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;

@Controller
public class BucketController {
	@GetMapping("cart.do")
	public String cart() {
		return "cart_Cart";
	}
	@GetMapping("cartadd.do")
	@ResponseBody
	public String cartadd(BookVO bvo,HttpSession session,JwtUtils util) {
		
		UserVO vo=util.getuser(session);
		System.out.println("con"+vo.getUser_id());
		System.out.println("con"+vo.getUser_phone());
		System.out.println("con"+vo.getUser_role());
		
		
		
		return "cartadd";
	}
}
