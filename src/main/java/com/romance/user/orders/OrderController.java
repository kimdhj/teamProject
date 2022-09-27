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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.romance.admin.log.LoggingService;
import com.romance.admin.log.PaymentLogVO;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserService;
import com.romance.user.login.UserVO;
import com.romance.user.my.delivery.DeliveryVO;

@Controller
@SessionAttributes("result")
public class OrderController {
	@Autowired
	OrderService ser;
	@Autowired
  UserService seru;
	@Autowired
	LoggingService loggingService; //로그입력 서비스
	@GetMapping("divide.do")
	public String divide() {
	  int i=1/0;
	  return "df";
	  }
	
	@GetMapping("bookpay.do")
	public String bookpay(@RequestParam(value = "book_seq")List<Integer> book_seq,@RequestParam(value = "book_count")List<Integer> book_count,int iscart,Model model,HttpSession session,JwtUtils util) throws IOException {
	  UserVO vosession = util.getuser(session);
	  
	   if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	     return "redirect:index.do";
	     } 
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
	
		model.addAttribute("delivery",ser.paydelivery(vo.getUser_id()));
		model.addAttribute("coupon",ser.paycouponlist(vo.getUser_id()));
		model.addAttribute("user",vo);
		model.addAttribute("list",lca); 
		System.out.println(lca.get(0));
		
		return "book_Pay";
	}
	@PostMapping("bookfinish.do")
	public String bookfinish(OrdersVO vo,@RequestParam(value = "book_seq")List<Integer> book_seq,@RequestParam(value = "book_count")List<Integer> book_count,int iscart,int couponselcode,OrderBookListVO lvo,Model model,JwtUtils util,HttpSession session) throws ParseException, IOException {
    if(vo.getOrders_vbank_Date_String()=="") {
      vo.setOrders_vbank_Date_String(null);
    }
	  System.out.println("결제끝 : "+vo);
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
		 ser.ordersIn(vo); //책 주문 리스트 인서트
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
			//쿠폰삭제
		 ser.usecoupon(couponselcode);
		 UserVO vou=seru.onesearch(vo.getUser_id());
	    vou.setUser_password(null);
	    String token=util.createToken("유저", vou);
	    session.setAttribute("id", token);
		return "redirect:bookfin.do";
	}
	@GetMapping("bookfin.do")
	public String bookfin(HttpSession session,JwtUtils util,Model model) throws Exception {
	  UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
return "redirect:index.do";
} 
		model.addAttribute("result", session.getAttribute("result"));
		System.out.println(session.getAttribute("result"));
		
		//세션 끊기기 전에 로그메서드 호출
		bookPaymentLog(session);
		
		session.removeAttribute("result");
		return "book_Finish";
	}
	@GetMapping("seldeli.do")
	@ResponseBody
	public DeliveryVO seldeli(int seq) {
	  return ser.seledelivery(seq);
	}
	
	//책 결제 로그
	public void bookPaymentLog(HttpSession session) throws Exception {
		OrdersVO vo = (OrdersVO) session.getAttribute("result");
		System.out.println(">>>>>주문정보 출력 : " + session.getAttribute("result"));
		System.out.println(">>>>>유저아이디 출력 : " + vo.getUser_id());
		
		//로그 입력내용
		String payment_log_id = vo.getUser_id(); //구매자
		int payment_log_money = vo.getOrders_cache_sum(); //총 결제금액
		String payment_log_contents = "";
		payment_log_contents += "[책 구매] "
								+ "결제수단 : " + vo.getOrders_cache_tool()
								+ ", 포인트 사용 : " + vo.getOrders_point()
								+ ", 포인트 적립 : " + vo.getOrders_add_point()
								+ ", 주문내용 : " + vo.getOrders_title();
		
		PaymentLogVO paymentVO = new PaymentLogVO();
		paymentVO.setPayment_log_id(payment_log_id);
		paymentVO.setPayment_log_money(payment_log_money);
		paymentVO.setPayment_log_contents(payment_log_contents);
		
		//입력 메서드 호출
		loggingService.insertPaymentLog(paymentVO);
		
	}
	
	
}
