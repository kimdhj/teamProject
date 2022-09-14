package com.romance.user.my.main.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class MyServiceDAO {
    @Autowired
    SqlSessionTemplate sql;
    public int owncoupon(String user_id) {
      return sql.selectOne("coupon.owncoupon",user_id);
    }
}
