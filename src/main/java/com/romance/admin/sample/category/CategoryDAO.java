package com.romance.admin.sample.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.sample.navcategory.NavCategoryVO;
@Repository
public class CategoryDAO {
	@Autowired
	SqlSessionTemplate sqlsession;
	public List<CategoryVO> getCategoryList(CateSearchVO vos){
		System.out.println("daocate"+vos);
		return sqlsession.selectList("Category.getCategoryList",vos);
		
	}
	public int getCount(CateSearchVO vos) {
	return sqlsession.selectOne("Category.getCount",vos);
	}
	public CategoryVO selNum(CateSearchVO vos) {
		return sqlsession.selectOne("Category.selNum",vos);
		}
	public CategoryVO selName(CateSearchVO vos) {
		return sqlsession.selectOne("Category.selName",vos);
		}
	public int cateInsert(CateSearchVO vos) {
		return sqlsession.insert("Category.cateInsert",vos);
		}
	public int categorydel(CateSearchVO vos) {
		// TODO Auto-generated method stub
		return sqlsession.delete("Category.categorydel", vos);
	}
	public int categoryMod(CategoryVO vo) {
		// TODO Auto-generated method stub
		return sqlsession.update("Category.categoryMod",vo);
	}
	public List<NavCategoryVO> getNavCategoryList(){
		return sqlsession.selectList("navCategory.getList");
	}
	public int numche(int category_num) {
		return sqlsession.selectOne("Category.numche",category_num);
	}
	public int nameche(String category_name) {
		
		return sqlsession.selectOne("Category.nameche",category_name);
	}
	
	
	
}
