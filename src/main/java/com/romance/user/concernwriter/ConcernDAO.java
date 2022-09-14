package com.romance.user.concernwriter;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConcernDAO {
  @Autowired
  SqlSessionTemplate sql;
    public void concernin(ConcernWriterVO vo) {
      
      sql.insert("concern.concernin", vo);
    };
    public int checoncern(ConcernWriterVO vo) {
      
      return sql.selectOne("concern.checoncern", vo);
    };
}
