package com.romance.user.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class book_controller {
	@RequestMapping("/romance.do")
	public String index() {
		return"index";
	}

}
