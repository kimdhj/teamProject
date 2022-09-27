package com.romance.user.my.sub;

import java.util.List;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.user.book.BookSearchVO;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;
import com.romance.user.usecategory.UserCategoryVO;

public interface MySubService {

	List<String> getcate(UserVO vo);
	public List<BookVO> newcate(BookSearchVO vo);
	 public void subdel(String user_id);
	  public void subon(String user_id);
	  public void subupdate(UserVO vo);
	  public List<CategoryVO> getcatelist();
	  public List<Integer> getcatemy(String user_id);
	  public String mybook(String user_id) ;
	  public void joininsert(int[] category_num,String user_id);
	  public void delcate(String user_id);
	  public String cansubpass(String user_id) ;
	
}
