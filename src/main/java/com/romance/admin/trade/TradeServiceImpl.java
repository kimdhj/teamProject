package com.romance.admin.trade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TradeServiceImpl implements TradeService {
  @Autowired
  TradeDAO dao;

  @Override
  public List<TradeJoinVO> mainlist(TradeSearchVO vo) {
    if(vo.getSearchkeyword()!=null&& vo.getSearchcontent()!=null&& vo.getSearchcontent()!="") {
      System.out.println("ser1"+vo.getSearchcontent());
  
      if(vo.getSearchkeyword().trim().equals("orders_seq")||vo.getSearchkeyword().trim().equals("checksum")) {
       
        System.out.println("인트변경");
        vo.setSearchcontentint(Integer.parseInt(vo.getSearchcontent()));
      }
      
      
    
    }
    
    // TODO Auto-generated method stub
    return dao.mainlist(vo);
  }

  @Override
  public List<TradeJoinVO> cancellist(TradeSearchVO vo) {
    if(vo.getSearchkeyword()!=null&& vo.getSearchcontent()!=null&& vo.getSearchcontent()!="") {
      System.out.println("ser1"+vo.getSearchcontent());
  
      if(vo.getSearchkeyword().trim().equals("orders_seq")||vo.getSearchkeyword().trim().equals("checksum")) {
       
        System.out.println("인트변경");
        vo.setSearchcontentint(Integer.parseInt(vo.getSearchcontent()));
      }
      
      
    
    }
    // TODO Auto-generated method stub
    return dao.cancellist(vo);
  }

  @Override
  public TradeJoinVO booklistdetail(int order_bookList_seq) {
    // TODO Auto-generated method stub
    return dao.booklistdetail(order_bookList_seq);
  }

  @Override
  public TradeJoinVO ordersdetail(int orders_seq) {
    // TODO Auto-generated method stub
    return dao.ordersdetail(orders_seq);
  }

  @Override
  public int maincount(TradeSearchVO vo) {
    System.out.println("ser"+vo.getSearchkeyword());
    if(vo.getSearchkeyword()!=null&& vo.getSearchcontent()!=null&& vo.getSearchcontent()!="") {
      System.out.println("ser1"+vo.getSearchcontent());
      System.out.println("ser1"+vo.getSearchkeyword().trim().equals("orders_seq"));
      System.out.println("ser1"+vo.getSearchkeyword().trim().equals("checksum"));
  
      if(vo.getSearchkeyword().trim().equals("orders_seq")||vo.getSearchkeyword().trim().equals("checksum")) {
       
        System.out.println("인트변경");
        vo.setSearchcontentint(Integer.parseInt(vo.getSearchcontent()));
      }
      
      System.out.println("ser1"+vo.getSearchkeyword().trim().equals("orders_seq"));
      System.out.println("ser2"+vo.getSearchcontent().trim().equals("checksum"));
    
    }
    // TODO Auto-generated method stub
    return dao.maincount(vo);
  }

  @Override
  public int cancelcount(TradeSearchVO vo) {
    
    if(vo.getSearchkeyword()!=null&& vo.getSearchcontent()!=null&& vo.getSearchcontent()!="") {
     
  
      if(vo.getSearchkeyword().trim().equals("orders_seq")||vo.getSearchkeyword().trim().equals("checksum")) {
       
        System.out.println("인트변경");
        vo.setSearchcontentint(Integer.parseInt(vo.getSearchcontent()));
      }
      
      
    
    }
   
    // TODO Auto-generated method stub
    return dao.cancelcount(vo);
  }
  
  
}
