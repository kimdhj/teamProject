package com.romance.admin.author;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class AdminAuthorDAO {
  @Autowired
  SqlSessionTemplate sql;
  public List<AdminAuthorVO> adminauthorlist(AdminAuthorSearchVO vo){
    return sql.selectList("adminauthor.adminauthorlist",vo);
    
  }
  public int adminauthorcount(AdminAuthorSearchVO vo) {
    return sql.selectOne("adminauthor.adminauthorcount",vo);
    
  }
  public void  adminauthorcreate(AdminAuthorVO vo) {
    sql.insert("adminauthor.adminauthorcreate",vo);
    
  }
  public void  adminauthorupdate(AdminAuthorVO vo) {
    sql.update("adminauthor.adminauthorupdate",vo);
    
  }
  public void  adminbookupdate(AdminAuthorVO vo) {
    sql.update("adminauthor.adminbookupdate",vo);
    
  }
  
  public void  adminauthordelete(AdminAuthorVO vo) {
    sql.delete("adminauthor.adminauthordelete",vo);
    
  }
  public void  adminbookdelete(AdminAuthorVO vo) {
    sql.delete("adminauthor.adminbookdelete",vo);
    
  }
  
  
}
