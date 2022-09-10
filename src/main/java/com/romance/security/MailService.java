package com.romance.security;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

@Service
public class MailService {
public void sendEmail(String to,String subject,String msg) throws Exception{
		
		//Mail Server 설정
		String charSet="utf-8";
		String hostSMTP="smtp.gmail.com";
		String hostSMTPid="doublejo6543@gmail.com"; //관리자 이메일 아이디
		String hostSMTPpw="lhfzuntfhjesqnan"; //관리자 이메일 비밀번호
		
		//보내는 사람 
		String fromEmail="doublejo6543@gmail.com"; //보내는 사람 이메일 
		String fromName="권범준"; //보내는 사람 이름
		
		
		
		
		
		
		//email전송
		String mailRecipient=to;//받는 사람 이메일 주소
	
			//객체 선언
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465); 
			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSEnabled(true);
			mail.addTo(mailRecipient,charSet);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
			
	
	}
	public void findPw(HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		
	}
}