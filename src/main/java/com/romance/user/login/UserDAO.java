package com.romance.user.login;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.user.usecategory.UserCategoryVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	public UserVO onesearch(String user_id) {
		return sql.selectOne("user.onesearch", user_id);
	}
	public int cheid(String user_id){
		return sql.selectOne("user.cheid", user_id);
	}
	public List<CategoryVO> logincate(){
		return sql.selectList("Category.logincate");
	}
	public void joininsert(UserCategoryVO vo) {
		sql.insert("usercategory.joininsert", vo);
	}
	public void userjoin(UserVO vo) {
		sql.insert("user.join", vo);
	}
	public void loginday(String user_id) {
		sql.insert("user.loginday", user_id);
	}
}
