package com.romance.admin.dashboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	 
	
	
}
