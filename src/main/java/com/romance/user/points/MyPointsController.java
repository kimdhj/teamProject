package com.romance.user.points;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrderBookListVO;
import com.romance.user.orders.OrderService;
import com.romance.user.orders.OrdersVO;

@Controller
public class MyPointsController {

		@Autowired
		OrderService ser;
	
		@RequestMapping("/goGetPoint.do")
		public String goGetPoint(Model model,JwtUtils util,HttpSession session) throws IOException {
			UserVO vou = util.getuser(session);
			
			System.out.println("찍어봤어요"+vou);
			
			model.addAttribute("mapoint", vou);
			
			return "my_MileagePay";
		}
		
		@PostMapping("pointfinish.do")
		public String bookfinish(OrdersVO vo,OrderBookListVO lvo,Model model) throws ParseException {
			
			if(vo.getOrders_cache_tool()=="vbank") {
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");         // 문자열 -> Date        Date date = formatter.parse(dateStr);
			 Date date = formatter.parse(vo.getOrders_vbank_Date_String().replaceAll("T", " ")); 
			 vo.setOrders_vbank_Date(date);
			}
			
			 model.addAttribute("result", vo);
					 
			  
			return "redirect:bookfin.do";
		}
		
		
}
