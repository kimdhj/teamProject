package com.romance.security;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;

@Service
public class MailService {
public void sendEmail(String to,String subject,String msg,String name) throws Exception{
	Email email = new SimpleEmail();
	email.setHostName("smtp.naver.com");
	email.setSmtpPort(465);
	email.setCharset("euc-kr"); // 인코딩 설정(utf-8, euc-kr)
	email.setAuthenticator(new DefaultAuthenticator("doublejo653", "doublejo65#"));
	email.setSSL(true);
	email.setFrom("doublejo653@naver.com", "낭만서점");
	email.setSubject(subject);
	email.setMsg(msg);
	email.addTo(to, name+"님");
	email.send();


	
//구글로 보내는거 (일일한도로 잘안됨)	
	
//		//Mail Server 설정
//		String charSet="utf-8";
//		String hostSMTP="smtp.gmail.com";
//		String hostSMTPid="doublejo6543@gmail.com"; //관리자 이메일 아이디
//		String hostSMTPpw="lhfzuntfhjesqnan"; //관리자 이메일 비밀번호
//		
//		//보내는 사람 
//		String fromEmail="doublejo6543@gmail.com"; //보내는 사람 이메일 
//		String fromName="권범준"; //보내는 사람 이름
//		
//		
//		
//		
//		
//		
//		//email전송
//		String mailRecipient=to;//받는 사람 이메일 주소
//	
//			//객체 선언
//			HtmlEmail mail = new HtmlEmail();
//			mail.setDebug(true);
//			mail.setCharset(charSet);
//			mail.setSSLOnConnect(true);
//			mail.setHostName(hostSMTP);
//			mail.setSmtpPort(25); 
//			mail.setAuthentication(hostSMTPid, hostSMTPpw);
//			mail.setStartTLSEnabled(true);
//			mail.addTo(mailRecipient,charSet);
//			mail.setFrom(fromEmail, fromName, charSet);
//			mail.setSubject(subject);
//			mail.setHtmlMsg(msg);
//			mail.send();
//			
	
	}
	public void findPw(HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		
	}
}