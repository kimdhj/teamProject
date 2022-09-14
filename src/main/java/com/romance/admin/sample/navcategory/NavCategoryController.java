package com.romance.admin.sample.navcategory;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.server.AwsS3;
@Controller
public class NavCategoryController {
 
	@Autowired
	NavCategoryService service;
	@RequestMapping("navcateupdate.mdo")
	@ResponseBody
	public List<Integer> navcateupdate(@RequestParam(value="order[]",required=false) List<Integer> order,@RequestParam(value="num[]",required=false) List<Integer> num,NavCategoryVO vo) {
	
		System.out.println(num);
		System.out.println(order);
		List<Integer> fail=new ArrayList<Integer>();
		for(int i=0;i<num.size();i++) {
			vo.setCategory_num(num.get(i));
			vo.setNav_category_order(order.get(i));
			int che=service.navcateupdate(vo);
			if(che<0) {
				fail.add(vo.getNav_category_order());
			}
		}
		System.out.println("mod end");
		return fail;
	}
	@RequestMapping("navList.mdo")
	@ResponseBody
	public List<NavCategoryVO> navList() {
	
		
		return service.navList();
	}
}
