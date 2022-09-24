package com.romance.admin.dashboard;

import java.util.List;

public interface DashService {
	public DashVO getSubRatio(DashVO dashVO);
	//한번게 5개
	 public List<DashOutVO> categorysel(DashDataVO vo) ;
	 public List<DashOutVO> booksel(DashDataVO vo);
	 //한개씩 5번
	 public List<DashOutVO> dashcache(DashDataVO vo);
	 public  List<DashOutVO> dashcount(DashDataVO vo);
	 //도넛1
	 public List<DashOutVO> dashbookbuy(DashDataVO vo);
	 //도넛 2
	 public List<DashOutVO> dashgetuser(DashDataVO vo);
	 //젤상단 두개
	 public List<DashOutVO> dashnotcancelcount(DashDataVO vo);
	 public List<DashOutVO> dashcancelcount(DashDataVO vo);
}
