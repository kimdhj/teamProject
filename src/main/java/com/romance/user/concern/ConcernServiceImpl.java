package com.romance.user.concern;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConcernServiceImpl implements ConcernService {
  @Autowired
  ConcernDAO dao;

  @Override
  public int concernin(ConcernWriterVO vo) {
    // TODO Auto-generated method stub
    int count=dao.checoncern(vo);
    if(count<=0) {
    dao.concernin(vo);
    return count;
    }else {
      return count;
    }
  }

  @Override
  public List<ConcernWriterVO> concernall(ConcernSearchVO vo) {
    // TODO Auto-generated method stub
    return dao.concernall(vo);
  }

  @Override
  public int concerncount(ConcernSearchVO vo) {
    // TODO Auto-generated method stub
    return dao.concerncount(vo);
  }

  @Override
  public void concerndel(List<Integer> author_seq,String user_id) {
    // TODO Auto-generated method stub
    ConcernWriterVO vo=new ConcernWriterVO();
    vo.setUser_id(user_id);
    for(int seq:author_seq) {
      vo.setAuthor_seq(seq);
      dao.concerndel(vo);
    }
    
  }

  @Override
  public List<ConcernWriterVO> getautor(List<ConcernWriterVO> vol) {
    // TODO Auto-generated method stub
    for(ConcernWriterVO vo:vol) {
      vo.setAuthor_name(dao.getautor(vo.getAuthor_seq()));
    }
    return vol;
  }
  

  

  
}
