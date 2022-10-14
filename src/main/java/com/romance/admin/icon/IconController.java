package com.romance.admin.icon;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@SessionAttributes("icon")
public class IconController {

	@Autowired
	private IconService iconService;
	
	// 아이콘, 배너 수정 페이지로 이동
	@RequestMapping("/getIcon.mdo")
	 public String getIcon(Model model,JwtUtils util, HttpSession session) throws IOException {
	  // 비로그인이거나 관리자나 마스터가 아닐경우 관리자 로그인 페이지로 이동
	  UserVO vosession = util.getuser(session);
	  if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	    return "redirect:admin_login.mdo";
	  }
	  // 현재 등록되어있는 아이콘, 배너 정보 불러오기
		 model.addAttribute("icon", iconService.getIcon());
		 model.addAttribute("bannerList", iconService.getBanner());
		 return "admin_marketing_Icon";
	 }
	 
	// 아이콘, 배너 수정 실시
	 @RequestMapping(value="/updateIcon.mdo", method = RequestMethod.POST)
	 public String updateIcon(@RequestParam("iconFile") MultipartFile iconFile, @RequestParam("banner_name") List<String> banner_name,@RequestParam("bannerFile") List<MultipartFile> bannerFile, IconVO vo1, BannerVO vo2) throws IOException {
		// 아이콘은 파일이 비어있을경우 이전 상태 유지
		if(!iconFile.isEmpty()) {
		iconService.deleteIcon(vo1);
		iconService.insertIcon(iconFile, vo1);
		}
		iconService.deleteBanner();
		iconService.insertBanner(banner_name, bannerFile, vo2);
		return "redirect:getIcon.mdo";
	 }
	 
	 

	
}
