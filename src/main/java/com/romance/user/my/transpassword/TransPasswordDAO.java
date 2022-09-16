package com.romance.user.my.transpassword;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.login.UserVO;

@Repository
public class TransPasswordDAO {
  @Autowired
  SqlSessionTemplate sql;
  public UserVO passwordsearch(String user_id) {
    return sql.selectOne("user.passwordsearch",user_id);
  }
}
