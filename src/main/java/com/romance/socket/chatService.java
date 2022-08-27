package com.romance.socket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class chatService implements chatServiceInter {
	@Autowired
	chatDAOInter dao;

	@Override
	public List<chatVO> selectmy(String myname, String adminname) {
		// TODO Auto-generated method stub

		return dao.selectmy(myname, adminname);
	}

	@Override
	public void updatestate(chatVO vo) {
		// TODO Auto-generated method stub
		dao.updatestate(vo);

	}

	@Override
	public void deletename(chatVO vo) {
		// TODO Auto-generated method stub
		dao.deletename(vo);

	}

	@Override
	public void insertchat(chatVO vo) {
		// TODO Auto-generated method stub
		dao.insertchat(vo);
	}

	@Override
	public int selectnum(chatVO vo) {
		// TODO Auto-generated method stub
		return dao.selectnum(vo);
	}

	@Override
	public List<chatVO> selectList(chatVO vo) {
		// TODO Auto-generated method stub
		chatVO tra = null;
		List<chatVO> chatlist = dao.selectmain(vo);
		System.out.println(chatlist.size());
		if (chatlist.size() >= 1) {
			for (chatVO ch : chatlist) {
				tra = dao.selectcontent(ch);

				ch.setContent(tra.getContent());
				ch.setRegdate(tra.getRegdate());

			}
		}
		return chatlist;
	}

}
