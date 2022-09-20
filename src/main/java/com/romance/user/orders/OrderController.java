package com.romance.user.orders;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@SessionAttributes("result")
public class OrderController {
	@Autowired
	OrderService ser;
	@GetMapping("bookpay.do")
	public String bookpay(@RequestParam(value = "book_seq")List<Integer> book_seq,@RequestParam(value = "book_count")List<Integer> book_count,int iscart,Model model,HttpSession session,JwtUtils util) throws IOException {
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
		System.out.println("iscart"+iscart);
		
			model.addAttribute("iscart",iscart);
	
		
		model.addAttribute("user",vo);
		model.addAttribute("list",lca); 
		System.out.println(lca.get(0));
		
		return "book_Pay";
	}
	@PostMapping("bookfinish.do")
	public String bookfinish(OrdersVO vo,@RequestParam(value = "book_seq")List<Integer> book_seq,@RequestParam(value = "book_count")List<Integer> book_count,int iscart,OrderBookListVO lvo,Model model) throws ParseException {
		System.out.println(vo.getOrders_vbank_Date_String());
		System.out.println("controllerl vo : "+vo);
		System.out.println("bookseq : "+book_seq);
		System.out.println("book_count  : "+book_count);
		System.out.println("iscart"+iscart);
		if(vo.getOrders_cache_tool()=="vbank") {
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");         // 문자열 -> Date        Date date = formatter.parse(dateStr);
		 Date date = formatter.parse(vo.getOrders_vbank_Date_String().replaceAll("T", " ")); 
		 vo.setOrders_vbank_Date(date);
		}
		 System.out.println("결제1"+vo);
		 //orders테이블에 추가 포인트 기록 남기기
		 ser.ordersIn(vo);
		 System.out.println("결제3"+vo);
		 //orders테이블에 검색
		 vo=ser.getorder(vo.getOrders_cache_uid());
		 System.out.println("결제4"+vo);
		 List<OrderBookListVO> vol=new ArrayList<OrderBookListVO>();
		
		 for(int i= 0;i<book_seq.size();i++) {
			 lvo.setBook_seq(book_seq.get(i));
			 lvo.setOrder_bookList_count(book_count.get(i));
			 lvo.setOrders_seq(vo.getOrders_seq());
			 vol.add(lvo);
		 }
		//booklist에 추가
		 ser.booklistin(vol);
		 if(iscart==1) {
		   //cart에서 구매한거 삭제
		 ser.delfin(vo.getUser_id());
		 }
		 System.out.println("결제2"+vo);
		 model.addAttribute("result", vo);
				 
		  
		return "redirect:bookfin.do";
	}
	@GetMapping("bookfin.do")
	public String bookfin(HttpSession session,Model model) {
		
		model.addAttribute("result", session.getAttribute("result"));
		System.out.println(session.getAttribute("result"));
		session.removeAttribute("result");
		return "book_Finish";
	}
}
