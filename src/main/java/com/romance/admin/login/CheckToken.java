package com.romance.admin.login;

import java.io.IOException;

import javax.servlet.http.HttpSession;

public class CheckToken {
	
	public static String isToken(HttpSession session) throws IOException {
		return (String) session.getAttribute("id");
	}	
	
}
