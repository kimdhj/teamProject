package com.romance.admin.product;

import java.util.List;

public interface ProductService {

	List<ProductVO> getProductList(ProductVO vo);
	List<ProductVO> ajax_search(ProductSearchVO svo);
	int all_count(ProductSearchVO svo);
	
}
