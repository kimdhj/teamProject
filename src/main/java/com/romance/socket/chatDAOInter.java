package com.romance.socket;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public interface chatDAOInter {

	public List<chatVO> selectmy(String myname,String adminname);

	public void updatestate(chatVO vo);

	public void deletename(chatVO vo);


	public void insertchat(chatVO vo);

	public int selectnum(chatVO vo);



	public List<chatVO> selectmain(chatSearchVO vo);
	public chatVO selectcontent(chatVO vo);

	public void insertAPI(API vo);
	public List<String> author();
	public void authorinser(String author);
	
}
