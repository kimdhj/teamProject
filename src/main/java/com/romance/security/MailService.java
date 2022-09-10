package com.romance.security;

import org.springframework.beans.factory.annotation.Autowired;

public class MailService {

	@Autowired
	private MailSender mailSender;
	
	public void sendEmail(String toAddress, String fromAddress,
					String subject, String msgBody) {
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom(fromAddress);
		smm.setTo(toAddress);
		smm.setSubject(subject);
		smm.setText(msgBody);
		
		mailSender.send(smm);
	}
}