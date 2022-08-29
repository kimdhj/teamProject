package com.romance.admin.sample.category;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CategoryController {
	@Autowired
	CategoryService service;
	@GetMapping("category.mdo")
	public String category(CateSearchVO vos,Model model) {
		
		List<CategoryVO> categoryList=service.getCategoryList(vos);
		int count=service.getCount(vos);
		
		model.addAttribute("all_categoryList",categoryList);
		model.addAttribute("all_count",count-(vos.getPage()-1)*5);
		if(count%5==0) {
			count--;
		}
		model.addAttribute("all_sum",count);
		model.addAttribute("all_page",vos.getPage());
		model.addAttribute("all_vos",vos);
		return "admin_category";
		
	}
	@GetMapping("categoryList.mdo")
	@ResponseBody
	public List<CategoryVO> categoryList(CateSearchVO vos) {
		List<CategoryVO> categoryList=service.getCategoryList(vos);
	
		return categoryList;
		
	}

	@GetMapping("categoryCount.mdo")
	@ResponseBody
	public int categoryCount(CateSearchVO vos) {
		
		int count=service.getCount(vos);
		
		return count;
		
	}
	@GetMapping("categoryInsert.mdo")
	@ResponseBody
	public String categoryInsert(CateSearchVO vos) {
			System.out.println(vos);
		String re=service.categoryInsert(vos);
		
		return re;
		
	}
	@GetMapping("categorydel.mdo")
	@ResponseBody
	public int categorydel(CateSearchVO vos) {
			System.out.println(vos);
	
		
		return service.categorydel(vos);
		
	}
	
	@GetMapping("categoryMod.mdo")
	@ResponseBody
	public List<Integer> categoryMod(@RequestParam(value="num[]",required=false) List<Integer> num,@RequestParam(value="name[]",required=false) List<String> name,@RequestParam(value="seq[]",required=false) List<Integer> seq,CategoryVO vo) {
	List<Integer> fail=new ArrayList<Integer>(); 
	System.out.println(num);
	System.out.println(name);
	System.out.println(seq);
	
	for(int i=0;i<num.size();i++) {
		vo.setCategory_name(name.get(i));
		vo.setCategory_num(num.get(i));
		vo.setCategory_seq(seq.get(i));
		int cat=service.categoryMod(vo);
		if(cat==0) {
			fail.add(vo.getCategory_seq());
		}
	}
		
		return fail;

		
	}




}
