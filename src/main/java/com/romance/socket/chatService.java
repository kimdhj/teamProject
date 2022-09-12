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
	public List<chatVO> selectList(chatSearchVO vo) {
		// TODO Auto-generated method stub
		chatVO tra = null;
		List<chatVO> chatlist = dao.selectmain(vo);
		System.out.println(chatlist+":chlist");
		if (chatlist.size() >= 1) {
			for (chatVO ch : chatlist) {
				tra = dao.selectcontent(ch);

				ch.setReal_chat_content(tra.getReal_chat_content());
				ch.setReal_chat_date(tra.getReal_chat_date());

			}
		}
		return chatlist;
	}

	public void insertAPI(API vo) {
		dao.insertAPI(vo);
	}

	@Override
	public void author() {
		// TODO Auto-generated method stub
		List<String> au=dao.author();
		System.out.println(au);
		for(int i=0;i<au.size();i++) {
			System.out.println(au.get(i));
			dao.authorinser(au.get(i));
		}
	}


	
}
