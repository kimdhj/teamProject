package com.romance.admin.log;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class WorkLogUtils {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertWorkLog() {
		String user_id="aa004";
		sqlSessionTemplate.selectOne("", user_id);
	}
}
