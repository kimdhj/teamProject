package com.romance.user.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FineServiceImpl implements FineService{
  @Autowired
  FineDAO dao;
  @Override
  public void finedel(FineVO vo) {
    // TODO Auto-generated method stub
    dao.finedel(vo);
  }

  @Override
  public void finein(FineVO vo) {
    // TODO Auto-generated method stub
    dao.finein(vo);
  }
  
}
