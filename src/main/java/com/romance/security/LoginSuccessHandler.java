package com.romance.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component("LoginSuccessHandler")
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		System.out.println("hidsklfjlsdkf");
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		System.out.println(roleNames);
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin.do");
			return;
		}
		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/member.do");
			return;
		}
		response.sendRedirect("/");

	}

}
