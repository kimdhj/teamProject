package com.romance.user.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	public UserVO onesearch(String user_id) {
		return sql.selectOne("user.onesearch", user_id);
	}
}
