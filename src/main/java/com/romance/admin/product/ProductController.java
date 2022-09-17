package com.romance.admin.product;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.romance.user.concern.ConcernWriterVO;

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
		
		//ajax 검색하기!
		@RequestMapping(value = "/ajax_search.mdo", method=RequestMethod.POST)
		@ResponseBody
		public List<ProductVO> ajax_search(ProductSearchVO svo, Model model) {
			if(svo.getPage()==0) {
				svo.setPage(1);
			}
			
			return productService.ajax_search(svo);
		}
		
		//ajax 수 세오기!
		@RequestMapping(value = "/ajax_count.mdo", method=RequestMethod.POST)
		@ResponseBody
		public int ajax_count(ProductSearchVO svo) {
			int count = productService.all_count(svo);
			return count;
		}
		
		//상품 INSERT 가기!
		@RequestMapping("/product_Insert.mdo")
		public String product_Insert() {
			
			return "admin_product_Insert";
		}
		
		//상품 INSERT 시키기!
		@RequestMapping(value="product_Insert_real.mdo", method = RequestMethod.POST)
		public String product_Insert_real(@RequestParam(name="imgfile0") MultipartFile imgfile0, @RequestParam(name="imgfile1") MultipartFile imgfile1, ProductVO vo) throws IOException {
			productService.insertProduct(imgfile0, imgfile1, vo);
			
			return "redirect:getProductList.mdo";
		}
		
		//작가번호로 작가 검색!
		@RequestMapping(value="/check_author.mdo", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String check_author(@RequestParam(name="author_seq") int author_seq) {
			System.out.println(author_seq);
			System.out.println(productService.check_author(author_seq));
			
			return productService.check_author(author_seq);
		}
		
		//고유번호 있는지 확인!
		@RequestMapping(value="/check_isbn.mdo", method=RequestMethod.POST)
		@ResponseBody
		public int check_isbn(@RequestParam(name="book_isbn") String book_isbn) {
			System.out.println(book_isbn);
			
			return productService.check_isbn(book_isbn);
		}
		
		//카테고리 있는지 확인!
		@RequestMapping(value="/check_category.mdo", method=RequestMethod.POST)
		@ResponseBody
		public int check_category(@RequestParam(name="category_num") int category_num) {
			System.out.println(category_num);
			
			return productService.check_category(category_num);
		}
		
		//물품 단일 삭제!
		@RequestMapping(value="/del_product.mdo", method=RequestMethod.POST)
		@ResponseBody
		public void del_product(@RequestParam(name="book_seq") int book_seq) {
			productService.del_product(book_seq);
		}
		
		
}
