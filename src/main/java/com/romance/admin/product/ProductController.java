package com.romance.admin.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("pro")
public class ProductController {

	@Autowired
	private ProductService productService;
	
		//물품 목록
		@RequestMapping("/getProductList.mdo")
		public String getProductList(ProductVO vo, Model model) {
			System.out.println("글 목록 검색 처리");
			// null 체크
//			if (vo.getSearchCondition() == null)
//				vo.setSearchCondition("TITLE");
//			if (vo.getSearchKeyword() == null)
//				vo.setSearchKeyword("");
			model.addAttribute("productList", productService.getProductList(vo));		
			return "admin_product";
		}
	
}
