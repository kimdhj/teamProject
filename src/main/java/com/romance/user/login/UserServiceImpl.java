package com.romance.user.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.romance.admin.log.LoginLogVO;
import com.romance.admin.sample.category.CategoryVO;
import com.romance.user.usecategory.UserCategoryVO;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;

	@Override
	public UserVO onesearch(String user_id) {
		UserVO vo = dao.onesearch(user_id);
		
		return vo;
	}

	@Override
	public int cheid(String user_id) {
		// TODO Auto-generated method stub
		return dao.cheid(user_id);
	}

	@Override
	public List<CategoryVO> logincate() {
		// TODO Auto-generated method stub
		return dao.logincate();
	}

	@Transactional
	@Override
	public void joininsert(List<Integer> category_num, UserVO vo) {
		if (category_num != null) {
			UserCategoryVO vo1 = new UserCategoryVO();
			for (int num : category_num) {
				vo1.setCategory_num(num);
				vo1.setUser_id(vo.getUser_id());
				dao.joininsert(vo1);
			}
		}
		dao.userjoin(vo);
	}

	@Override
	public void loginday(String user_id) {
		dao.loginday(user_id);
	}

	@Override
	public List<UserVO> findid(UserVO vo) {
		// TODO Auto-generated method stub
		return dao.findid(vo);
	}

	@Override
	public int findpassword(UserVO vo) {
		// TODO Auto-generated method stub
		return dao.findpassword(vo);
	}

	@Override
	public void passwordin(UserVO vo) {
		// TODO Auto-generated method stub
		dao.passwordin(vo);
	}
	
	
	//로그관련
	@Override
	public int isUserId(String login_log_id) {
		return dao.isUserId(login_log_id);
	}
	
	@Override
	public UserVO getLoginlogInfo(String login_log_id) {
		return dao.getLoginlogInfo(login_log_id);
	}

	@Override
	public void insertLoginLog(LoginLogVO loginLogVO) {
		dao.insertLoginLog(loginLogVO);
	}

}
