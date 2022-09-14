package com.romance.user.my.request.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.login.UserVO;
import com.romance.user.my.request.Criteria;
import com.romance.user.my.request.MyRequestReplyVO;
import com.romance.user.my.request.MyRequestService;
import com.romance.user.my.request.MyRequestVO;

@Service("myRequestService")
public class MyRequestServiceImpl implements MyRequestService {
	
	@Autowired
	private MyRequestDAO myRequestDAO;
	
	@Override
	public UserVO getUser(String session_user_id) {
		return myRequestDAO.getUser(session_user_id);
	}

	@Override
	public List<MyRequestVO> getRequestList(String session_user_id) {
		return myRequestDAO.getRequestList(session_user_id);
	}

	@Override
	public int myRequestTotalCount(Criteria criteria) {
		return myRequestDAO.myRequestTotalCount(criteria);
	}

	@Override
	public List<MyRequestVO> getMyRequestList(Criteria criteria) {
		return myRequestDAO.getMyRequestList(criteria);
	}

	@Override
	public MyRequestVO getMyRequestDetail(MyRequestVO myRequestVO) {
		return myRequestDAO.getMyRequestDetail(myRequestVO);
	}

	@Override
	public MyRequestReplyVO getMyRequestReply(MyRequestReplyVO myRequestReplyVO) {
		return myRequestDAO.getMyRequestReply(myRequestReplyVO);
	}
	
	
}
