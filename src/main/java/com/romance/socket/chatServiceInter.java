package com.romance.socket;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public interface chatServiceInter {

	public List<chatVO> selectmy(String myname,String adminname);

	public void updatestate(chatVO vo);

	public void deletename(chatVO vo);


	public void insertchat(chatVO vo);

	public int selectnum(chatVO vo);

	public List<chatVO> selectList(chatSearchVO vo);
	public void author();
	public void delall();
	 public int countlist(chatSearchVO vo);
   public void chatseldel(List<String> dellist);
}
