package com.romance.admin.log.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.log.Criteria;
import com.romance.admin.log.LogService;
import com.romance.admin.log.LoginLogVO;
import com.romance.admin.log.PaymentLogVO;
import com.romance.admin.log.WorkLogVO;

@Service("logService")
public class LogServiceImpl implements LogService {

	@Autowired
	private LogDAO logDAO;
	
	@Override
	public int getLoginTotalCount(Criteria criteria) throws Exception {
		return logDAO.getLoginTotalCount(criteria);
	}
	
	@Override
	public List<LoginLogVO> getLoginLogList(Criteria criteria) throws Exception {
		return logDAO.getLoginLogList(criteria);
	}

	@Override
	public int getWorkTotalCount(Criteria criteria) throws Exception {
		return logDAO.getWorkTotalCount(criteria);
	}

	@Override
	public List<WorkLogVO> getWorkLogList(Criteria criteria) throws Exception {
		return logDAO.getWorkLogList(criteria);
	}

	@Override
	public int getPaymentTotalCount(Criteria criteria) throws Exception {
		return logDAO.getPaymentTotalCount(criteria);
	}

	@Override
	public List<PaymentLogVO> getPaymentLogList(Criteria criteria) throws Exception {
		return logDAO.getPaymentLogList(criteria);
	}

	
	
}
