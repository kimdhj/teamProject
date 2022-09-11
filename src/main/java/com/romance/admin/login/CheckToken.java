package com.romance.admin.login;

import javax.servlet.http.HttpSession;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

public class CheckToken {
	
	public static int isTokenUser(HttpSession session, JwtUtils util) {
		UserVO vo = util.getuser(session);
		if(vo != null) {
			System.out.println("토큰있어 어서와");
			return 1;
		} else {
			System.out.println("토큰없어 돌아가");
			return 0;
		}
	}
	
	
	public static int isTokenAdmin(HttpSession session, JwtUtils util) {
		AdminUserVO vo = util.getAdmin(session);
		if(vo != null) {
			System.out.println("토큰있어 어서왕");
			return 1;
		} else {
			System.out.println("토큰없어 돌아강");
			return 0;
		}
	}
	
}
