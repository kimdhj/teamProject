package com.romance.socket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class chatController {
	@Autowired
	chatServiceInter ser;
	
	@GetMapping("/selectmy.do")
	@ResponseBody
	public List<chatVO> selectmy(String myname,String adminname){
		System.out.println(myname+adminname);
	
		return ser.selectmy(myname,adminname);
	}
	@RequestMapping("/updatestate.do")
	@ResponseBody
	public chatVO updatestate(chatVO vo){
		
		ser.updatestate(vo);
	
		return vo;
		
	}
	@RequestMapping("/delete.do")
	@ResponseBody
	public chatVO deletename(chatVO vo){
		System.out.println(vo+"del");
		ser.deletename(vo);
		return vo;
	}
	
	@RequestMapping("/insertchat.do")
	@ResponseBody
	public chatVO insertchat(chatVO vo){
		ser.insertchat(vo);
		return vo;
	}
	@RequestMapping("/selectnum.do")
	@ResponseBody
	public int selectnum(chatVO vo){
		
		return ser.selectnum(vo);
	}
	@RequestMapping("/selectList.do")
	@ResponseBody
	public List<chatVO> selectList(chatVO vo){
		
		return ser.selectList(vo);
	}
	@RequestMapping("/eunxi.do")
	public String hi(chatVO vo){
		System.out.println("hi");
		return "chat";
	}
	@RequestMapping("/eunxi.mdo")
	public String hi1(chatVO vo){
		System.out.println("hi");
		return "redirect:/socketTest/chat.jsp";
	}
	@GetMapping("/chat.do")
	public String chat(String user,Model model) {
		
		System.out.println("chat");
		
		model.addAttribute("userid", user);
		return "admin_realchat_user";
	}
	@GetMapping("/chatAdmin.mdo")
	public String chatAdmin(String user,Model model) {
		
		
		
		model.addAttribute("userid", user);
		return "admin_realchat_admin";
	}
	@GetMapping("/chatList.mdo")
	public String chatList() {

		return "admin_realChat";
	}

}
