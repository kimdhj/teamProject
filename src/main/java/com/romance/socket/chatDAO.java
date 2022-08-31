package com.romance.socket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class chatDAO implements chatDAOInter {
	@Autowired
	SqlSessionTemplate myba;
	
	@Override
	public List<chatVO> selectmy(String myname, String adminname) {
		// TODO Auto-generated method stub
		
		Map<String, Object> vo=new HashMap<String, Object>();
		vo.put("myname", myname);
		vo.put("adminname", adminname);	
		List<chatVO> result=myba.selectList("ChatDAO.selectmy",vo);
		return result;
	}

	@Override
	public void updatestate(chatVO vo) {
		// TODO Auto-generated method stub

		myba.update("ChatDAO.updatestate",vo);
	}

	@Override
	public void deletename(chatVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.getRealchatname()+"dao");
		myba.delete("ChatDAO.delname", vo);
	}

	@Override
	public void insertchat(chatVO vo) {
		// TODO Auto-generated method stub
		myba.insert("ChatDAO.insertchat", vo);
		
	}

	@Override
	public int selectnum(chatVO vo) {
		// TODO Auto-generated method stub
		
		return myba.selectOne("ChatDAO.selectnum",vo);
	}

	@Override
	public List<chatVO> selectmain(chatVO vo) {
		// TODO Auto-generated method stub
		return myba.selectList("ChatDAO.selectmain",vo);
	}

	@Override
	public chatVO selectcontent(chatVO vo) {
		// TODO Auto-generated method stub
		return myba.selectOne("ChatDAO.selectcontent",vo);
	}
	public void insertAPI(API vo) {
		myba.insert("ChatDAO.API",vo);
	}

	
}
