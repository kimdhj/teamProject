package com.romance.user.concern;

import java.util.List;

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
    public List<ConcernWriterVO> concernall(ConcernSearchVO vo) {
      return sql.selectList("concern.concernall",vo);
    }
    public int concerncount(ConcernSearchVO vo) {
      return sql.selectOne("concern.concerncount",vo);
    }
    public void concerndel(ConcernWriterVO vo) {
      sql.delete("concern.concerndel",vo);
    }
    public String getautor(int author_seq) {
     return sql.selectOne("concern.getautor",author_seq);
    }
    
}
