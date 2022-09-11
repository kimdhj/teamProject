package com.romance.user.login;

import java.util.List;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.user.usecategory.UserCategoryVO;

public interface UserService {
	public UserVO onesearch(String user_id);
	public int cheid(String user_id);
	public List<CategoryVO> logincate();
	public void joininsert(List<Integer> category_num,UserVO vo);
	public void loginday(String user_id);
	public List<UserVO> findid(UserVO vo);
	public int findpassword(UserVO vo) ;
	public void passwordin(UserVO vo);

}
