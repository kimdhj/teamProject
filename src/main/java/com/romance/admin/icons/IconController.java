package com.romance.admin.icons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("Icon")
public class IconController {

	@Autowired
	private IconService iconService;
	
	@RequestMapping("/getIcon.mdo")
	 public String getIcon(IconVO vo1, BannerVO vo2, Model model) {
		 model.addAttribute("icon", iconService.getIcon(vo1));
		 model.addAttribute("icon", iconService.getBanner(vo2));
		 return "admin_marketing_Icon";
	 }
	 
	 @RequestMapping(value="/updateIcon.mdo", method = RequestMethod.POST)
	 public String updateIcon(IconVO vo1, BannerVO vo2) {
		 iconService.updateIcon(vo1);		
		 return "redirect:getIcon.mdo";
	 }
	 
	 

	
}
