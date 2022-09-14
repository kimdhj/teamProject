package com.romance.user.reply;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FineDAO {
  @Autowired
  SqlSessionTemplate sql;
  
  public void finedel(FineVO vo) {
    sql.delete("fine.finedel",vo);
  }
  public void finein(FineVO vo) {
    System.out.println("findao"+vo);
    sql.insert("fine.finein",vo);
  }
  
}
