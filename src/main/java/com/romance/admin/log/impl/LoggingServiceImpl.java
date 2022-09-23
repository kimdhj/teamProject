package com.romance.admin.log.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.log.LoggingService;
import com.romance.admin.log.WorkLogVO;

@Service("loggingService")
public class LoggingServiceImpl implements LoggingService {
	
	@Autowired
	private LoggingDAO loggingDAO;

//	@Override
//	public void insertUserInfoWorkLog(WorkLogVO workLogVO) throws Exception {
//		loggingDAO.insertUserInfoWorkLog(workLogVO);
//	}

	@Override
	public void insertWorkLog(WorkLogVO workLogVO) throws Exception {
		loggingDAO.insertWorkLog(workLogVO);
	}
	
	
}
