package com.romance.admin.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.product.ProductSearchVO;
import com.romance.admin.product.ProductService;
import com.romance.admin.product.ProductVO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO ProductDAO;

	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		return ProductDAO.getProductList(vo);
	}
	
	@Override
	public List<ProductVO> ajax_search(ProductSearchVO svo) {
		return ProductDAO.ajax_search(svo);
	}
	
	@Override
	public int all_count(ProductSearchVO svo) {
		return ProductDAO.all_count(svo);
	}
	
}
