package com.romance.admin.log.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.log.Criteria;
import com.romance.admin.log.LogService;
import com.romance.admin.log.LoginLogVO;

@Service("logService")
public class LogServiceImpl implements LogService {

	@Autowired
	private LogDAO logDAO;
	
	@Override
	public int getLoginTotalCount() throws Exception {
		return logDAO.getLoginTotalCount();
	}
	
	@Override
	public List<LoginLogVO> getLoginLogList(Criteria criteria) throws Exception {
		return logDAO.getLoginLogList(criteria);
	}

	@Override
	public int getWorkTotalCount() throws Exception {
		return 0;
	}
	
	

}
