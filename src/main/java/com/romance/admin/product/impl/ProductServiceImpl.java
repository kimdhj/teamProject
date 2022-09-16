package com.romance.admin.product.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.romance.admin.product.ProductSearchVO;
import com.romance.admin.product.ProductService;
import com.romance.admin.product.ProductVO;
import com.romance.server.AwsS3;
import com.romance.user.concern.ConcernWriterVO;

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
	
	@Override
	public void insertProduct(@RequestParam(name="imgfile0") MultipartFile imgfile0, @RequestParam(name="imgfile1") MultipartFile imgfile1, ProductVO vo) throws IOException {
		if (!imgfile0.isEmpty()) {
			String filename=imgfile0.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = imgfile0.getInputStream();
		      String contentType = imgfile0.getContentType();
		      long contentLength = imgfile0.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setBook_imgURL(uploadFolder+key);
		}
		if (!imgfile1.isEmpty()) {
			 String filename=imgfile1.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = imgfile1.getInputStream();
		      String contentType = imgfile1.getContentType();
		      long contentLength = imgfile1.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setBook_bigimgURL(uploadFolder+key);
		}
		ProductDAO.insertProduct(vo);
	}
	
	@Override
	public ConcernWriterVO check_author(ConcernWriterVO vo) {
		
		return ProductDAO.check_author(vo);
	}
	
	@Override
	public int check_isbn(ProductVO vo) {
		
		return ProductDAO.check_isbn(vo);
	}
	
}
