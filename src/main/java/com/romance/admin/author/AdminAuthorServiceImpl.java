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

  // 작가 삭제 시, 작가 책이랑 작가 삭제
  @Override
  public void adminauthordelete(AdminAuthorVO vo) {
    // TODO Auto-generated method stub
    dao.adminbookdelete(vo);
    dao.adminauthordelete(vo);
    
  }



  @Override
  public void updatelist(List<Integer> author_seq,List<String> author_name) {
<<<<<<< HEAD
    AdminAuthorVO vo=new AdminAuthorVO(); // for 문 안에서 객체 생성 시, 같은 객체로 계속 받기 때문에 for문 밖에서 작성!
=======
    
    AdminAuthorVO vo=new AdminAuthorVO();
>>>>>>> a6af60c06b23eef970a37cbbf29a8d20e3c79ca9
    for(int i=0;i<author_seq.size();i++) {
      vo.setAuthor_name(author_name.get(i));
      vo.setAuthor_seq(author_seq.get(i));
      dao.adminbookupdate(vo);
      dao.adminauthorupdate(vo);
    }
    
  }
  
}
