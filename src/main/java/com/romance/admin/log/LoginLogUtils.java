package com.romance.admin.log;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


public class LoginLogUtils {
			
	//ip 반환
	public String getUserIp() throws Exception {
		
	    String ip = null;
	    //HttpServletRequest 선언
	    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

	    ip = request.getHeader("X-Forwarded-For"); // 얘를 사용해서 제대로 된 ip 를 뽑아올 수 있도록, 아래 코드와 같이 하나의 공식처럼 사용
	    
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("Proxy-Client-IP"); 
	    } 
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("WL-Proxy-Client-IP"); 
	    } 
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("HTTP_CLIENT_IP"); 
	    } 
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("X-Real-IP"); 
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("X-RealIP"); 
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getHeader("REMOTE_ADDR");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        ip = request.getRemoteAddr(); 
	    }
	    
		return ip;
	}
	
	//접속URL
	public String getUserUrl() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest(); 
		String urlLog = request.getHeader("Referer"); // Referer 은 고정된 데이터 값
		return urlLog;
	}
	
	//접속 브라우저
	public String getUserBrowser() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String userBrowser = request.getHeader("user-agent");
		return userBrowser;
	}
	
		
	
}
