package com.romance.user.points;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrderService;

@Controller
public class MyPointsController {

		@Autowired
		OrderService ser;
		@Autowired
		MyPointsService myPointsService;
		
		@RequestMapping("/goGetPoint.do")
		public String goGetPoint(Model model,JwtUtils util,HttpSession session) throws IOException {
			UserVO vou = util.getuser(session);
			
			System.out.println("찍어봤어요"+vou);
			
			model.addAttribute("mapoint", vou);
			
			return "my_MileagePay";
			
		}
		
		@PostMapping("/pointfinish.do")
		public String pointfinish(MyPointsVO vo, Model model,JwtUtils util,HttpSession session) throws ParseException, IOException {
			UserVO userVO = util.getuser(session);
			String iiiid = userVO.getUser_id();
			vo.setUser_id(iiiid);
			int popoint = vo.getPoints_count();
			int pointnt = userVO.getUser_point();
			System.out.println(popoint);
			System.out.println(pointnt);
			userVO.setUser_point(popoint+pointnt);
			myPointsService.createPoints(vo);
			myPointsService.addPoint(userVO);  
			
			userVO = myPointsService.renew(userVO);
			
			String token = util.createToken("user", userVO);
			session.setAttribute("id", token);
			
			return "redirect:myMain.do";
		}
		
		
}
