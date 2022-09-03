package com.romance.admin.sub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("subscribe")
public class SubscribeController {

	 @Autowired
	 private SubscribeService subscribeService;
	 
	 @RequestMapping("/getSubInfo.do")
	 public String getSubInfo(SubscribeVO vo) {
		 
		 return "event_Subscribe";
	 }
	
}
