package com.romance.admin.product;

import java.io.IOException;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.romance.user.concern.ConcernWriterVO;

public interface ProductService {

	List<ProductVO> getProductList(ProductVO vo);
	List<ProductVO> ajax_search(ProductSearchVO svo);
	int all_count(ProductSearchVO svo);
	void insertProduct(@RequestParam(name="imgfile0") MultipartFile imgfile0, @RequestParam(name="imgfile1") MultipartFile imgfile1, ProductVO vo) throws IOException;
	ConcernWriterVO check_author(ConcernWriterVO vo);
	
}
