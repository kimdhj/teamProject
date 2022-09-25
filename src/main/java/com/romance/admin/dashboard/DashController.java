package com.romance.admin.dashboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@RequestMapping("/")
public class DashController {
	@Autowired
	private DashService dashService;
	
	@GetMapping("adminMain.mdo")
	public String myMain(DashVO dashVO, Model model,JwtUtils util, HttpSession session) throws IOException {
	  UserVO vosession = util.getuser(session);
	  if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	    return "redirect:admin_login.mdo";
	  }
		System.out.println("Mybatis로 차트데이터 테스트용 처리");
		model.addAttribute("dashVO", dashVO);
		model.addAttribute("getSubRatio", dashService.getSubRatio(dashVO));
		System.out.println(dashVO);

		return "admin_main";
	}
	@GetMapping("categorysel.do")
	@ResponseBody
	public List<DashOutVO> categorysel(DashDataVO vo){
	  return dashService.categorysel(vo);
	}
	 @GetMapping("booksel.do")
	  @ResponseBody
	  public List<DashOutVO> booksel(DashDataVO vo){
	   System.out.println("booksel"+dashService.booksel(vo));
	    return dashService.booksel(vo);
	  }
	 @GetMapping("dashcache.do")
   @ResponseBody
   public List<DashOutVO> dashcache(DashDataVO vo){
     return dashService.dashcache(vo);
   }
	 @GetMapping("dashcount.do")
   @ResponseBody
   public List<DashOutVO> dashcount(DashDataVO vo){
     return dashService.dashcount(vo);
   }
	 @GetMapping("dashbookbuy.do")
   @ResponseBody
   public List<DashOutVO> dashbookbuy(DashDataVO vo){
     return dashService.dashbookbuy(vo);
   }
	 @GetMapping("dashgetuser.do")
   @ResponseBody
   public List<DashOutVO> dashgetuser(DashDataVO vo){
     return dashService.dashgetuser(vo);
   }
   @GetMapping("dashnotcancelcount.do")
   @ResponseBody
   public List<DashOutVO> dashnotcancelcount(DashDataVO vo){
     return dashService.dashnotcancelcount(vo);
   }
   @GetMapping("dashcancelcount.do")
   @ResponseBody
   public List<DashOutVO> dashcancelcount(DashDataVO vo){
     return dashService.dashcancelcount(vo);
   }
	
}
