package com.romance.admin.notice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.notice.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeVO> getNoticeList(){
		List<NoticeVO> noticeList = sqlSession.selectList("NoticeDAO.getNoticeList");
		return noticeList;
	}

}
