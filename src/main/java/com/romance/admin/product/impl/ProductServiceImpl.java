package com.romance.admin.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
