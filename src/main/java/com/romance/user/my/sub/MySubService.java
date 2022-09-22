package com.romance.user.my.sub;

import java.util.List;

import com.romance.user.book.BookSearchVO;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;

public interface MySubService {

	List<String> getcate(UserVO vo);
	public List<BookVO> newcate(BookSearchVO vo);
	 public void subdel(String user_id);
	  public void subon(String user_id);
	  public void subupdate(UserVO vo);
	
}
