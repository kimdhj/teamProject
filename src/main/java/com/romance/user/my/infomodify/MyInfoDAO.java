package com.romance.user.my.infomodify;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.login.UserVO;

@Repository
public class MyInfoDAO {
  @Autowired
  SqlSessionTemplate sql;
  public String passwordsearch(UserVO vo) {
    return sql.selectOne("user.passwordsearch",vo);
  }
  public void infomod(UserVO vo) {
    sql.update("user.infomod",vo);
  }
}
