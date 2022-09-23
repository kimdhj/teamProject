package com.romance.user.login;

import java.util.List;

import com.romance.admin.log.LoginLogVO;
import com.romance.admin.sample.category.CategoryVO;

public interface UserService {
	public UserVO onesearch(String user_id);
	public int cheid(String user_id);
	public List<CategoryVO> logincate();
	public void joininsert(List<Integer> category_num,UserVO vo);
	public void loginday(String user_id);
	public List<UserVO> findid(UserVO vo);
	public int findpassword(UserVO vo) ;
	public void passwordin(UserVO vo);
	
	
	//로그인시 입력아이디가 존재하는아이디인지 확인
	public int isUserId(String login_log_id);
	
	//로그인 성공실패 및 user_role을 가져오기 위함.
	public UserVO getLoginlogInfo(String login_log_id);
	
	//로그인 로그 삽입
	public void insertLoginLog(LoginLogVO loginLogVO);

}
