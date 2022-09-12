package com.romance.admin.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
		@RequestMapping(value = "/ajax_search.mdo", method=RequestMethod.POST)
		@ResponseBody
		public List<ProductVO> ajax_search(ProductSearchVO svo, Model model) {
			if(svo.getPage()==0) {
				svo.setPage(1);
			}
			System.out.println(svo);
			System.out.println(svo.getPage());
			System.out.println(productService.all_count(svo));
			
			
			return productService.ajax_search(svo);
		}
		

		
}
