package com.romance.admin.sample.navcategory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NavCategoryServiceImpl implements NavCategoryService {
	@Autowired
	NavCategoryDAO dao;

	@Override
	public int navcateupdate(NavCategoryVO vo) {
		System.out.println(vo+"af");
		vo.setNav_category_name(dao.getItem(vo).getNav_category_name());
		System.out.println(vo+"be");
		if(vo.getNav_category_name()==null) {
			return 0;
		}
		return dao.updateItem(vo);
	}

	@Override
	public List<NavCategoryVO> navList() {
		// TODO Auto-generated method stub
		return dao.navList();
	}
	

	
}
