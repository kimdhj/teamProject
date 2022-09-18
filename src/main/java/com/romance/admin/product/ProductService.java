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
	String check_author(@RequestParam(name="author_seq") int author_seq);
	int check_isbn(@RequestParam(name="book_isbn") String book_isbn);
	int check_category(@RequestParam(name="category_num") int category_num);
	void del_product(@RequestParam(name="book_seq") int book_seq);
	public void del_chk(List<Integer> codelist);
	int product_Update(@RequestParam(name="book_seq") int book_seq);
	
}
