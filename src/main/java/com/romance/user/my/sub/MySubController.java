package com.romance.user.my.sub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("my_sub")
public class MySubController {

	@Autowired
	private MySubService mySubService;
	
	@RequestMapping("my_getSub.do")
	public String my_getSub() {
		return "my_AddReadInfo";
	}
	
}
