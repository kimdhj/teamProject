package com.romance.user.bucket;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;

@Controller
public class BucketController {
	@Autowired
	BucketService ser;
	@GetMapping("cart.do")
	public String cart(BucketSearchVO vob,Model model,HttpSession session,JwtUtils util) {
		UserVO vo=util.getuser(session);
		if(vo!=null) {
		vob.setUser_id(vo.getUser_id());
		List<BucketVO> blist=ser.bucgetlist(vob);
		List<BookVO> list=ser.makelist(blist);
		model.addAttribute("list",list);
		model.addAttribute("user",vo);
		}else {
			return "redirect:index.do";
		}
			
	
		return "cart_Cart";
	}
	@GetMapping("cartadd.do")
	@ResponseBody
	public String cartadd(BucketVO bvo,HttpSession session,JwtUtils util) {
		
		UserVO vo=util.getuser(session);
		System.out.println(vo);
		if(vo!=null) {
		 bvo.setUser_id(vo.getUser_id());
		 if(ser.chedouble(bvo)>0) {
			 return "중복";
		 }else {
		 ser.insertone(bvo);
		 }
		}else {
			return "실패";
		}
		System.out.println("bvo"+bvo);
		
		
		
		return "성공";
	}
	@GetMapping("cartdel.do")
	@ResponseBody
	public void delbuc(@RequestParam("book_seq[]") int[] book_seq,HttpSession session,JwtUtils util) {
		
		UserVO vos=util.getuser(session);
		if(vos!=null) {
		
			ser.delbuc(book_seq,vos.getUser_id());
			
		}
	}
}
