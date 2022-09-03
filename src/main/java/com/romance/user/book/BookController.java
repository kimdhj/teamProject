package com.romance.user.book;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookController {
	@Autowired
	BookService ser;
	@RequestMapping("/romance.do")
	public String index() {
		return"index";
	}
	@RequestMapping("/booklist.do")
	public String booklist(BookSearchVO vo,Model model) {
		System.out.println(vo);
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		//일반 리스트와 카운트
		int count=ser.bookcount(vo);
		List<BookVO> list=ser.booklist(vo);
		if(count%5==0) {
			count-=1;
		}
		if(vo.getPage()<3) {
			model.addAttribute("startpage", 1);
		}else {
			model.addAttribute("startpage", vo.getPage()-2);
		}
		if(vo.getPage()+2>(count/5)+1) {
			System.out.println(count);
			model.addAttribute("endpage", count/5+1);
		}else {
			System.out.println("el"+count);
			model.addAttribute("endpage", vo.getPage()+2);
		}
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("maxpage",count/5+1);
		//베스트 리스트와 카운트
		int bestcount=ser.bestcount(vo);
		List<BookVO> bestlist=ser.bestlist(vo);
		if(bestcount%5==0) {
			bestcount-=1;
		}
		if(vo.getPage()<3) {
			model.addAttribute("beststartpage", 1);
		}else {
			model.addAttribute("beststartpage", vo.getPage()-2);
		}
		if(vo.getPage()+2>(bestcount/5)+1) {
			System.out.println(bestcount);
			model.addAttribute("bestendpage", bestcount/5+1);
		}else {
			System.out.println("bestcountel"+bestcount);
			model.addAttribute("bestendpage", vo.getPage()+2);
		}
		model.addAttribute("bestcount", bestcount);
		model.addAttribute("bestlist", bestlist);
		model.addAttribute("bestmaxpage",bestcount/5+1);
		//신간 리스트와 카운트
		int newcount=ser.newcount(vo);
		List<BookVO> newlist=ser.newlist(vo);
		if(newcount%5==0) {
			newcount-=1;
		}
		if(vo.getPage()<3) {
			model.addAttribute("newstartpage", 1);
		}else {
			model.addAttribute("newstartpage", vo.getPage()-2);
		}
		if(vo.getPage()+2>(newcount/5)+1) {
			System.out.println(newcount);
			model.addAttribute("newendpage", newcount/5+1);
		}else {
			System.out.println("newcountel"+newcount);
			model.addAttribute("newendpage", vo.getPage()+2);
		}
		model.addAttribute("newcount", newcount);
		model.addAttribute("newlist", newlist);
		model.addAttribute("newmaxpage",newcount/5+1);
		//공통
		model.addAttribute("vo",vo);
		model.addAttribute("konav",ser.categoryko());
		model.addAttribute("ennav",ser.categoryen());
		model.addAttribute("renav",ser.navlist());
		System.out.println(ser.categoryko());
		
		
		return"book_List";
	}
	@RequestMapping("/bookdetail.do")
	public String bookdetail() {
		return"book_Detail";
	}
	@RequestMapping("updatebook.do")
	@ResponseBody
	public JSONObject updatebook(BookSearchVO vo) {
		JSONObject json=new JSONObject();
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		//일반 리스트와 카운트
		int count=ser.bookcount(vo);
		List<BookVO> list=ser.booklist(vo);
		if(count%5==0) {
			count-=1;
		}
		if(vo.getPage()<3) {
			json.put("startpage", 1);
		}else {
			json.put("startpage", vo.getPage()-2);
		}
		if(vo.getPage()+2>(count/5)+1) {
			System.out.println(count);
			json.put("endpage", count/5+1);
		}else {
			System.out.println("el"+count);
			json.put("endpage", vo.getPage()+2);
		}
		json.put("count", count);
		json.put("list", list);
		json.put("maxpage",count/5+1);
		json.put("vo",vo);
		return json;
	}
	@RequestMapping("updatebestbook.do")
	@ResponseBody
	public JSONObject updatebestbook(BookSearchVO vo) {
		JSONObject json=new JSONObject();
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		int bestcount=ser.bestcount(vo);
		List<BookVO> bestlist=ser.bestlist(vo);
		if(bestcount%5==0) {
			bestcount-=1;
		}
		if(vo.getPage()<3) {
			json.put("beststartpage", 1);
		}else {
			json.put("beststartpage", vo.getPage()-2);
		}
		if(vo.getPage()+2>(bestcount/5)+1) {
			System.out.println(bestcount);
			json.put("bestendpage", bestcount/5+1);
		}else {
			System.out.println("bestcountel"+bestcount);
			json.put("bestendpage", vo.getPage()+2);
		}
		json.put("bestcount", bestcount);
		json.put("bestlist", bestlist);
		json.put("bestmaxpage",bestcount/5+1);
		json.put("vo",vo);
		return json;
	}
	@RequestMapping("updatenewbook.do")
	@ResponseBody
	public JSONObject updatenewbook(BookSearchVO vo) {
		JSONObject json=new JSONObject();
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		int newcount=ser.newcount(vo);
		List<BookVO> newlist=ser.newlist(vo);
		if(newcount%5==0) {
			newcount-=1;
		}
		if(vo.getPage()<3) {
			json.put("newstartpage", 1);
		}else {
			json.put("newstartpage", vo.getPage()-2);
		}
		if(vo.getPage()+2>(newcount/5)+1) {
			System.out.println(newcount);
			json.put("newendpage", newcount/5+1);
		}else {
			System.out.println("newcountel"+newcount);
			json.put("newendpage", vo.getPage()+2);
		}
		json.put("newcount", newcount);
		json.put("newlist", newlist);
		json.put("newmaxpage",newcount/5+1);
		json.put("vo",vo);
		return json;
	}



}