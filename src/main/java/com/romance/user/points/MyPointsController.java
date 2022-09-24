package com.romance.user.points;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.admin.log.LoggingService;
import com.romance.admin.log.PaymentLogVO;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrderService;

@Controller
public class MyPointsController {

		@Autowired
		OrderService ser;
		@Autowired
		MyPointsService myPointsService;
		@Autowired
		LoggingService loggingService; //로그기록 서비스
		
		@RequestMapping("/goGetPoint.do")
		public String goGetPoint(Model model,JwtUtils util,HttpSession session) throws IOException {
			UserVO vou = util.getuser(session);
			
			System.out.println("찍어봤어요"+vou);
			
			model.addAttribute("mapoint", vou);
			
			return "my_MileagePay";
			
		}
		
		@PostMapping("/pointfinish.do")
		public String pointfinish(MyPointsVO vo, Model model,JwtUtils util,HttpSession session) throws Exception {
			UserVO userVO = util.getuser(session);
			String iiiid = userVO.getUser_id();
			vo.setUser_id(iiiid);
			//충전할 포인트
			int popoint = vo.getPoints_count();
			//충전 이전 현재포인트
			int pointnt = userVO.getUser_point();
			System.out.println(popoint);
			System.out.println(pointnt);
			userVO.setUser_point(popoint+pointnt);
			
			//충전할 포인트와, 유저정보 파라미터 받아서 로그기록
			pointChargeLog(popoint, userVO);
		
			myPointsService.createPoints(vo);
			myPointsService.addPoint(userVO);  
			
			userVO = myPointsService.renew(userVO);
			
			String token = util.createToken("user", userVO);
			session.setAttribute("id", token);
			
			return "redirect:myMain.do";
		}
		
		public void pointChargeLog(int popoint, UserVO userVO) throws Exception {
			//기록할 정보
			String payment_log_id = userVO.getUser_id();
			int payment_log_money = popoint; //마일리지 결제금
			String payment_log_contents = "[마일리지 충전] ";
			payment_log_contents += "충전 마일리지 : " + popoint
									+ ", 충전 후 마일리지 : " +  userVO.getUser_point();
			System.out.println(">>>>>" + payment_log_id);
			System.out.println(">>>>>" + payment_log_money);
			System.out.println(">>>>>" + payment_log_contents);
			//객체정보 세팅 후 로그에 기록
			PaymentLogVO paymentLogVO = new PaymentLogVO();
			paymentLogVO.setPayment_log_id(payment_log_id);
			paymentLogVO.setPayment_log_money(payment_log_money);
			paymentLogVO.setPayment_log_contents(payment_log_contents);			
			loggingService.insertPaymentLog(paymentLogVO);
		}
		
}
