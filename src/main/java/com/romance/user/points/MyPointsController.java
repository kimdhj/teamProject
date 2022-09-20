package com.romance.user.points;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;

@Controller
public class MyPointsController {


	
		@RequestMapping("/goGetPoint.do")
		public String goGetPoint(Model model,JwtUtils util,HttpSession session) {
			
			return "my_MileagePay";
		}
		
		
}
