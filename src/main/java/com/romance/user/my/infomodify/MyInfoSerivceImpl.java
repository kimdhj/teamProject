package com.romance.user.my.infomodify;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.login.UserVO;

@Service
public class MyInfoSerivceImpl implements MyInfoService {
  @Autowired
  MyInfoDAO dao;

  @Override
  public String passwordsearch(UserVO vo) {
    // TODO Auto-generated method stub
    return dao.passwordsearch(vo);
  }
                                
  @Override
  public void infomod(UserVO vo) {
    // TODO Auto-generated method stub
    dao.infomod(vo);
  }
  
}
