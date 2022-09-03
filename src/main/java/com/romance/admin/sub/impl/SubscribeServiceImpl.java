package com.romance.admin.sub.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.sub.SubscribeService;
import com.romance.admin.sub.SubscribeVO;

@Service("SubscribeService")
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDAO subscribeDAO;
	
	@Override
	public SubscribeVO getSub(SubscribeVO vo) {
		return subscribeDAO.getSub(vo);
	}
	
}
