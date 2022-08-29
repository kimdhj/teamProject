package com.romance.admin.sample.category;

import java.util.List;

public interface CategoryService {
	public List<CategoryVO> getCategoryList(CateSearchVO vos);
	public int getCount(CateSearchVO vos);
	public String categoryInsert(CateSearchVO vos);
	public int categorydel(CateSearchVO vos);
	public int categoryMod(CategoryVO vo);
}
