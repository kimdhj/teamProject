package com.romance.user.my.main;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.login.CheckToken;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@RequestMapping("/")
public class MyController {
	@Autowired
	MyService ser;
	
	@GetMapping("myMain.do")
	public String myMain(HttpSession session, JwtUtils utils) throws IOException {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			return "my_Main";
		} else {
			return "redirect:login.do";
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
