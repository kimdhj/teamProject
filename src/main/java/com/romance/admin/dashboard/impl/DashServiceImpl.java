package com.romance.admin.dashboard.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.dashboard.DashDataVO;
import com.romance.admin.dashboard.DashOutVO;
import com.romance.admin.dashboard.DashService;
import com.romance.admin.dashboard.DashVO;

@Service("dashService")
public class DashServiceImpl implements DashService {
	
	@Autowired
	private DashDAO dashDAO;

	@Override
	public DashVO getSubRatio(DashVO dashVO) {
		
		return dashDAO.getSubRatio(dashVO);
	}
//한번게 5개
  @Override
  public List<DashOutVO> categorysel(DashDataVO vo) {
   //기본값 현재 껄로 설정
   
    if(vo.getMonth().trim().length()<2) {
      vo.setMonth("0"+vo.getMonth());
    }
    System.out.println("vo에이지"+vo);
    
   
   
    // TODO Auto-generated method stub
    return dashDAO.categorysel(vo);
  }
//한번게 5개
  @Override
  public List<DashOutVO> booksel(DashDataVO vo) {
    // TODO Auto-generated method stub
    //기본값 현재 껄로 설정
    if(vo.getMonth().trim().length()<2) {
      vo.setMonth("0"+vo.getMonth());
    }
    System.out.println("vo에이지"+vo);
    return dashDAO.booksel(vo);
  }
//한개씩 5번
  @Override
  public List<DashOutVO> dashcache(DashDataVO vo) {
    // TODO Auto-generated method stub
    //기본값 현재 껄로 설정
    if(vo.getMonth().trim().length()<2) {
      vo.setMonth("0"+vo.getMonth());
    }
    System.out.println("vo에이지"+vo);
    
    List<DashOutVO> dout=new ArrayList<DashOutVO>();
    
    //숫자 5번빼기
    vo.setMonth(String.valueOf(Integer.parseInt(vo.getMonth())-5));
    for(int i=1;i<=5;i++) {
      
      vo.setMonth(String.valueOf(Integer.parseInt(vo.getMonth())+1));
      if(vo.getMonth().trim().length()<2) {
        vo.setMonth("0"+vo.getMonth());
      }
      DashOutVO vod=dashDAO.dashcache(vo);
      vod.setTitlestr(vo.getYear()+"-"+vo.getMonth());
      dout.add(vod);
      if(Integer.parseInt(vo.getMonth())==0) {
      vo.setYear(String.valueOf(Integer.parseInt(vo.getYear())-1));
      vo.setMonth("12");
      }
    
     
      
    }
    
    return dout;
  }
//한개씩 5번
  @Override
  public List<DashOutVO> dashcount(DashDataVO vo) {
    // TODO Auto-generated method stub

    if(vo.getMonth().trim().length()<2) {
      vo.setMonth("0"+vo.getMonth());
    }
    System.out.println("vo에이지"+vo);
   
    vo.setMonth(String.valueOf(Integer.parseInt(vo.getMonth())-5));
    List<DashOutVO> dout=new ArrayList<DashOutVO>();
    //숫자 5번빼기
    for(int i=1;i<=5;i++) {
 
     
      vo.setMonth(String.valueOf(Integer.parseInt(vo.getMonth())+1));
      if(vo.getMonth().trim().length()<2) {
        vo.setMonth("0"+vo.getMonth());
      }
      DashOutVO vod=dashDAO.dashcount(vo);
      vod.setTitlestr(vo.getYear()+"-"+vo.getMonth());
      dout.add(vod);
      
      if(Integer.parseInt(vo.getMonth())==0) {
      vo.setYear(String.valueOf(Integer.parseInt(vo.getYear())-1));
      vo.setMonth("12");
      }
    
      
      
    }
    
    return dout;
  }
  //도넛1
  @Override
  public List<DashOutVO> dashbookbuy(DashDataVO vo) {
    // TODO Auto-generated method stub
    if(vo.getMonth().trim().length()<2) {
      vo.setMonth("0"+vo.getMonth());
    }
    System.out.println("vo에이지"+vo);
    List<DashOutVO> dout=new ArrayList<DashOutVO>();
    
    DashOutVO vob=dashDAO.dashbookbuy(vo);
    vob.setTitlestr("책 구매");
    dout.add(vob);
    vob=dashDAO.dashreply(vo);
    vob.setTitlestr("댓글 수");
    dout.add(vob);
    return dout;
  }
  //도넛2
  @Override
  public List<DashOutVO> dashgetuser(DashDataVO vo) {
    // TODO Auto-generated method stub
    if(vo.getMonth().trim().length()<2) {
      vo.setMonth("0"+vo.getMonth());
    }
    System.out.println("vo에이지"+vo);
    List<DashOutVO> dout=new ArrayList<DashOutVO>();
    DashOutVO vob=dashDAO.dashgetuser(vo);
    vob.setTitlestr("구독 회원");
    dout.add(vob);
    vob=dashDAO.dashgetsub(vo);
    vob.setTitlestr("일반 회원");
    dout.add(vob);
    return dout;
  }
//젤상단 두개
  @Override
  public List<DashOutVO> dashnotcancelcount(DashDataVO vo) {
    LocalDate now = LocalDate.now();

    vo.setDate(now.toString());
    List<DashOutVO> dout=new ArrayList<DashOutVO>();
    dout.add(dashDAO.dashnotcancelcount(vo));
    LocalDate yesterday=now.minusDays(1);
    vo.setDate(yesterday.toString());
    dout.add(dashDAO.dashnotcancelcount(vo));
    return dout;
  }
//젤상단 두개
  @Override
  public List<DashOutVO> dashcancelcount(DashDataVO vo) {
    LocalDate now = LocalDate.now();

    vo.setDate(now.toString());
    List<DashOutVO> dout=new ArrayList<DashOutVO>();
    DashOutVO voo=dashDAO.dashcancelcount(vo);
 
    dout.add(dashDAO.dashcancelcount(vo));
    LocalDate yesterday=now.minusDays(1);
    vo.setDate(yesterday.toString());
    dout.add(dashDAO.dashcancelcount(vo));
    return dout;
  }
	
	 
	
	
}
