package com.romance.admin.notice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.notice.NoticeSearchVO;
import com.romance.admin.notice.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeVO> getNoticeList(NoticeSearchVO svo){
		return sqlSession.selectList("NoticeDAO.getNoticeList", svo);
	}
	
	public int getCount(NoticeSearchVO svo) {
		return sqlSession.selectOne("NoticeDAO.getCount", svo);
	}
	
	public NoticeVO getNotice(NoticeVO vo) {
		return sqlSession.selectOne("NoticeDAO.getNotice", vo);
	}
	
	public void insertNotice(NoticeVO vo) {
		sqlSession.insert("NoticeDAO.insertNotice", vo);
	}
	
	public NoticeVO selectSeq(int notice_seq) {
		return sqlSession.selectOne("NoticeDAO.selectSeq", notice_seq);
	}
	
	public void deleteNotice(NoticeVO vo) {
		System.out.println(vo);
		sqlSession.delete("NoticeDAO.deleteNotice", vo);
	}
	
	public void updateNotice(NoticeVO vo) {
		sqlSession.update("NoticeDAO.updateNotice", vo);
	}
	
	// �������� ����, ������ ���� ��й�ȣ üũ
	public boolean checkPW(NoticeVO vo) {
		boolean result = false;
		/*
		Map<String, String> map = new HashMap<String, String>();
		String notice_seq = Integer.toString(vo.getNotice_seq()); // seq Integer ���� String ���� ����

		map.put("notice_seq", notice_seq); 
		map.put("notice_passwd", vo.getNotice_passwd());
		*/
		// notice_seq �� ���� �� String -> Integer �� �ٽ� ����������Ѵ�.
		
		int count = sqlSession.selectOne("NoticeDAO.checkPW", vo); 
		
		System.out.println(count);
		if(count == 1) result = true;
		return result;
	}
	
	// üũ�ڽ� ���� ����
	public void checkBox(int notice_seq) {
		System.out.println("DAO : " + notice_seq);
		sqlSession.delete("NoticeDAO.checkBox", notice_seq);
	}
}
