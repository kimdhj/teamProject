package com.romance.admin.icon;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
@SessionAttributes("icon")
public class IconController {

	@Autowired
	private IconService iconService;
	
	@RequestMapping("/getIcon.mdo")
	 public String getIcon(Model model) {
		 model.addAttribute("icon", iconService.getIcon());
		 model.addAttribute("bannerList", iconService.getBanner());
		 return "admin_marketing_Icon";
	 }
	 
	 @RequestMapping(value="/updateIcon.mdo", method = RequestMethod.POST)
	 public String updateIcon(@RequestParam("iconFile") MultipartFile iconFile, @RequestParam("banner_name") List<String> banner_name,@RequestParam("bannerFile") List<MultipartFile> bannerFile, IconVO vo1, BannerVO vo2) throws IOException {
		iconService.deleteIcon(vo1);
		iconService.insertIcon(iconFile, vo1);
		iconService.deleteBanner();
		iconService.insertBanner(banner_name, bannerFile, vo2);
		return "redirect:getIcon.mdo";
	 }
	 
	 

	
}
