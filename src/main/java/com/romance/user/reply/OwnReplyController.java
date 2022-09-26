package com.romance.user.reply;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.reply.ReplyService;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
public class OwnReplyController {

	@Autowired
	OwnReplyService ownReplyService;	
	@Autowired
	ReplyService replyService;
	

	@RequestMapping(value="/ajax_rerecount.do", method=RequestMethod.POST)
	@ResponseBody
	public List<ReplyVO> ajax_rerecount(ReplyVO vo, Model model,JwtUtils util, HttpSession session) {
			System.out.println("깐뜨롤러 : "+ownReplyService.ajax_rerecount(vo));
		return ownReplyService.ajax_rerecount(vo);
	}
	
	@RequestMapping(value="/ajax_recount.do", method=RequestMethod.POST)
	@ResponseBody
	public int ajax_recount(ReplyVO vo, Model model,JwtUtils util, HttpSession session) {
		
		return ownReplyService.ajax_recount(vo);
	}
	
	@RequestMapping(value="/ajax_delmyre.do", method = RequestMethod.POST)
	@ResponseBody
	public String ajax_delmyre(com.romance.admin.reply.ReplyVO vo) {
		replyService.delete(vo);
		return null;
	}
	
	@RequestMapping("/movingReview.do")
	public String moveInsert(ReplyVO vo, Model model,JwtUtils util, HttpSession session) throws IOException {
		UserVO vosession = util.getuser(session);
		if ((vosession == null || !vosession.getUser_role().equals("ROLE_MEMBER")) && (vosession == null || !vosession.getUser_role().equals("ROLE_MASTER"))) {
			return "redirect:index.do";
		}
		String iid = vosession.getUser_id();
		ReplyVO replyVO = new ReplyVO();
		replyVO.setUser_id(iid);
		model.addAttribute("ownReview", ownReplyService.movingReview(replyVO));
		
		int total = ownReplyService.ajax_recount(replyVO);
		int now = 1;
		int fullpage = 0;
		if(total%5!=0) {
			fullpage = (total/5)+1;
		}else {
			fullpage = total/5;
		}
		int start = ((now-1)/5)*5 +1;
		int end = ((now-1)/5)*5 +5;
		if(end>fullpage) {
			end = fullpage;
		}
		int st = (now*5)-5;
		int en = (now*5);
		System.out.println("아"+now);
		System.out.println("제발"+fullpage);
		System.out.println("그러지"+start);
		System.out.println("마"+end);
		model.addAttribute("now",now);
		model.addAttribute("fullpage",fullpage);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("st",st);
		model.addAttribute("en",en);
		model.addAttribute("user_id",iid);
		model.addAttribute("total", total);
		
		return "my_Review";
	}
	
}
