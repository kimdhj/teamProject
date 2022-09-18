package com.romance.user.my.request.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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

	@Override
	public void insertMyRequest(MyRequestVO myRequestVO) throws IOException {
		myRequestDAO.insertMyRequest(myRequestVO);	
	}
	
	
	@Override
	public String getMyRequestPassword(int ask_seq) throws Exception {
		return myRequestDAO.getMyRequestPassword(ask_seq);
	}

	@Override
	public void updateMyRequest(MyRequestVO myRequestVO) throws Exception {
		myRequestDAO.updateMyRequest(myRequestVO);
	}

	@Override
	public void deleteMyRequest(int ask_seq) throws Exception {
		myRequestDAO.deleteMyRequest(ask_seq);		
	}
	
	
}
