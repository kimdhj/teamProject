package com.romance.admin.author;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class AdminAuthorServiceImpl implements AdminAuthorService{
  @Autowired
  AdminAuthorDAO dao;
  @Override
  public List<AdminAuthorVO> adminauthorlist(AdminAuthorSearchVO vo) {
    // TODO Auto-generated method stub
    return dao.adminauthorlist(vo);
  }

  @Override
  public int adminauthorcount(AdminAuthorSearchVO vo) {
    // TODO Auto-generated method stub
    return dao.adminauthorcount(vo);
  }

  @Override
  public void adminauthorcreate(AdminAuthorVO vo) {
    // TODO Auto-generated method stub
    dao.adminauthorcreate(vo);
  }

  @Override
  public void adminauthordelete(AdminAuthorVO vo) {
    // TODO Auto-generated method stub
    dao.adminbookdelete(vo);
    dao.adminauthordelete(vo);
    
  }



  @Override
  public void updatelist(List<Integer> author_seq,List<String> author_name) {
    
    AdminAuthorVO vo=new AdminAuthorVO();
    for(int i=0;i<author_seq.size();i++) {
      vo.setAuthor_name(author_name.get(i));
      vo.setAuthor_seq(author_seq.get(i));
      dao.adminbookupdate(vo);
      dao.adminauthorupdate(vo);
    }
    
  }
  
}
