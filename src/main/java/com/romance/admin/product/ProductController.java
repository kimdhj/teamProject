package com.romance.admin.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		@GetMapping("/getProductList.mdo")
		public String getProductList(ProductVO vo, Model model, ProductSearchVO svo) {
			System.out.println("글 목록 검색 처리");

			if(svo.getPage()==0) {
				svo.setPage(1);
			}
			System.out.println("현재페이지 : "+svo.getPage());
			System.out.println("총갯수 : "+productService.all_count(svo));
			int count = productService.all_count(svo);
			int page = svo.getPage();
			int fullpage = 0;
			if(count%20 ==0) {
				fullpage=count/20;
			}else if(count%20 !=0) {
				fullpage=count/20 +1;
			}
			int wherepage = page/10;
			int startpage = wherepage*10 +1;
			int endpage = wherepage*10 +10;
			if(endpage>fullpage) {
				endpage=fullpage;
			}
			int start = page*20-20;
			int end = page*20-1;
			
			System.out.println("count : " + count);
			System.out.println("page : " + page);
			System.out.println("fullpage : " + fullpage);
			System.out.println("wherepage : " + wherepage);
			System.out.println("startpage : " + startpage);
			System.out.println("endpage : " + endpage);
			System.out.println("start : " + start);
			System.out.println("end : " + end);
			model.addAttribute("count", count);
			model.addAttribute("page", page);
			model.addAttribute("fullpage", fullpage);
			model.addAttribute("wherepage", wherepage);
			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			model.addAttribute("svo", svo);
			model.addAttribute("start", start);
			model.addAttribute("end", end);

			
			model.addAttribute("productList", productService.getProductList(vo));	
			return "admin_product";
		}
	
		@RequestMapping(value = "/ajax_search.mdo", method=RequestMethod.POST)
		@ResponseBody
		public List<ProductVO> ajax_search(ProductSearchVO svo, Model model) {
			if(svo.getPage()==0) {
				svo.setPage(1);
			}
			
			
			return productService.ajax_search(svo);
		}
		
		@RequestMapping(value = "/ajax_count.mdo", method=RequestMethod.POST)
		@ResponseBody
		public int ajax_count(ProductSearchVO svo) {
			int count = productService.all_count(svo);
			return count;
		}
		
}
