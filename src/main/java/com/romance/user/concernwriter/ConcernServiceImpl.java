package com.romance.user.concernwriter;

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

  

  
}
