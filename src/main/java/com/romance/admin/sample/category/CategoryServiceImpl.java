package com.romance.admin.sample.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	CategoryDAO dao;

	@Override
	public List<CategoryVO> getCategoryList(CateSearchVO vos) {
		// TODO Auto-generated method stub
		if (vos.getPage() == 0) {
			vos.setPage(1);
		}
		System.out.println(vos.getName());
		if (vos.getName() != null) {
			vos.setName(vos.getName().trim());
		}
		return dao.getCategoryList(vos);
	}

	@Override
	public int getCount(CateSearchVO vos) {
		// TODO Auto-generated method stub
		if (vos.getName() != null) {
			vos.setName(vos.getName().trim());
		}
		return dao.getCount(vos);
	}

	@Override
	public String categoryInsert(CateSearchVO vos) {
		if(dao.selName(vos)!=null) {
			return "이름 중복 입니다.";
		}else if(dao.selNum(vos)!=null) {
			return "코드 중복 입니다.";
		}else {
			dao.cateInsert(vos);
			return null;
		}
		
	}

	@Override
	public int categorydel(CateSearchVO vos) {
		// TODO Auto-generated method stub
		return dao.categorydel(vos);
	}

	@Override
	public int categoryMod(CategoryVO vo) {
		// TODO Auto-generated method stub
		return dao.categoryMod(vo);
	}

}
