package com.romance.user.orders;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.romance.security.JwtUtils;

import com.romance.user.login.UserVO;

@Controller
public class OrderController {
	@Autowired
	OrderService ser;
	@GetMapping("bookpay.do")
	public String bookpay(@RequestParam(value = "book_seq")List<Integer> book_seq,@RequestParam(value = "book_count")List<Integer> book_count,Model model,HttpSession session,JwtUtils util) {
		System.out.println(book_seq);
		System.out.println(book_count);
		UserVO vo=util.getuser(session);
		List<OrderBookListVO> lca=new ArrayList<OrderBookListVO>();
		OrderBookListVO ca=null;
		for(int i=0;i<book_seq.size();i++) {
			ca=ser.ordersearch(book_seq.get(i));
			ca.setBook_seq(book_seq.get(i));
			ca.setOrder_bookList_count(book_count.get(i));
			lca.add(ca);
		}
		model.addAttribute("user",vo);
		model.addAttribute("list",lca); 
		System.out.println(lca.get(0));
		
		return "book_Pay";
	}
}
