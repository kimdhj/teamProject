package com.romance.user.my.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.notice.NoticeVO;
import com.romance.security.JwtUtils;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;
import com.romance.user.my.request.MyRequestVO;

@Controller
@RequestMapping("/")
public class MyController {
	@Autowired
	MyService ser;
	
	@GetMapping("myMain.do")
	public String myMain(NoticeVO noticeVO, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			//유저아이디값
			model.addAttribute("sessionUserId", voToken.getUser_id());
			//최근주문 3개
			model.addAttribute("getMyMainOrders", ser.getMyMainOrders(voToken.getUser_id()));;
			//안내사항
			//최신 공지글 가져오기
			model.addAttribute("getRecentNotice", ser.getRecentNotice());
			return "my_Main";
		} else {
			return "redirect:login.do";
		}
		
	}
	
	@PostMapping("myRecentRequest.do")
	@ResponseBody
	public List<MyRequestVO> myRecentRequest(HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			List<MyRequestVO> myRecentRequest = new ArrayList<>();
			myRecentRequest = ser.myRecentRequest(voToken.getUser_id());
			System.out.println("날짜 뭥미 : " + myRecentRequest.get(0).getAsk_date());
			//날짜형식 String으로 변환해서 저장한뒤 뿌려준다. (MyRequestVO에 String타입 날짜 저장할 변수 생성)
			for(int i = 0; i < myRecentRequest.size(); i++) {
				String dateToString = DateFormatUtils.format(myRecentRequest.get(i).getAsk_date(), "yyyy-MM-dd HH:mm:SS");
				System.out.println(dateToString);
				myRecentRequest.get(i).setAsk_dateToString(dateToString); //문자열 변수에 넣어줌
			}
			System.out.println(myRecentRequest);			
			return myRecentRequest;
		} else {
			return null;
		}
	}
	
	@PostMapping("myRecentCart.do")
	@ResponseBody
	public List<BookVO> myRecentCart(HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			List<BookVO> myRecentCartList = ser.myRecentCart(voToken.getUser_id());
			System.out.println("나의 장바구니! : " + myRecentCartList);
			return myRecentCartList;
		} else {
			return null;
		}
	}
	
	
	@GetMapping("myPassword.do")
	public String myPassword() {
		
		return "my_Password";
	}
	@GetMapping("/getmyuser.do")
	@ResponseBody
	public UserVO getmyuser(HttpSession session, JwtUtils util) throws IOException  {
	  UserVO vo=util.getuser(session);
	  System.out.println("vo+"+vo);
	  if(vo!=null) {
	    vo.setUser_enabled(ser.owncoupon(vo.getUser_id()));
	    return vo;
	  }else {
	    return null;
	  }
	  
	}
}
