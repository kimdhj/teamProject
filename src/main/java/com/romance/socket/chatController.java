package com.romance.socket;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.protobuf.TextFormat.ParseException;

@Controller
public class chatController {
	@Autowired
	chatServiceInter ser;

	@GetMapping("/selectmy.do")
	@ResponseBody
	public List<chatVO> selectmy(String myname, String adminname) {
		System.out.println(myname + adminname);

		return ser.selectmy(myname, adminname);
	}

	@RequestMapping("/updatestate.do")
	@ResponseBody
	public chatVO updatestate(chatVO vo) {

		ser.updatestate(vo);

		return vo;

	}

	@RequestMapping("/delete.do")
	@ResponseBody
	public chatVO deletename(chatVO vo) {
		System.out.println(vo + "del");
		ser.deletename(vo);
		return vo;
	}

	@RequestMapping("/insertchat.do")
	@ResponseBody
	public chatVO insertchat(chatVO vo) {
		ser.insertchat(vo);
		return vo;
	}

	@RequestMapping("/selectnum.do")
	@ResponseBody
	public int selectnum(chatVO vo) {

		return ser.selectnum(vo);
	}

	@RequestMapping("/selectList.do")
	@ResponseBody
	public List<chatVO> selectList(chatVO vo) {

		return ser.selectList(vo);
	}

	@RequestMapping("/eunxi.do")
	public String hi(chatVO vo) {
		System.out.println("hi");
		return "chat";
	}

	@RequestMapping("/eunxi.mdo")
	public String hi1(chatVO vo) {
		System.out.println("hi");
		return "redirect:/socketTest/chat.jsp";
	}

	@GetMapping("/chat.do")
	public String chat(String user, Model model) {

		System.out.println("chat");

		model.addAttribute("userid", user);
		return "admin_realchat_user";
	}

	@GetMapping("/chatAdmin.mdo")
	public String chatAdmin(String user, Model model) {

		model.addAttribute("userid", user);
		return "admin_realchat_admin";
	}

	@GetMapping("/chatList.mdo")
	public String chatList() {

		return "admin_realChat";
	}

	@RequestMapping("/country.do")
	@ResponseBody
	public JSONObject country(API vo1, Model model1)
			throws IOException, ParseException, java.text.ParseException, org.json.simple.parser.ParseException {
		JSONObject jsonObj = null;
	
			
			for (int j = 0; j < 20; j++) {
				System.out.println("j: " + j);
				String result = HttpUtil.callApi("L", "foreign", "215", 10, j);
				JSONParser jsonParser = new JSONParser();

				// 3. To Object
				Object obj = jsonParser.parse(result);

				// 4. To JsonObject
				jsonObj = (JSONObject) obj;

				List<JSONObject> jsarr = (List<JSONObject>) jsonObj.get("item");
				for (int i = 0; i < jsarr.size(); i++) {

					vo1.setBook_points(0);
					if ((String) jsarr.get(i).get("coverLargeUrl") != null
							&& (String) jsarr.get(i).get("categoryId") != null
							&& (String) jsarr.get(i).get("author") != null && (String) jsarr.get(i).get("isbn") != null
							&& (String) jsarr.get(i).get("description") != null
							&& (String) jsarr.get(i).get("title") != null
							&& (String) jsarr.get(i).get("pubDate") != null
							&& (String) jsarr.get(i).get("publisher") != null
							&& (Long) jsarr.get(i).get("priceStandard") != null
							&& (String) jsarr.get(i).get("coverSmallUrl") != null
							&& (String) jsarr.get(i).get("categoryId") != null) {
						vo1.setBook_bigimgURL((String) jsarr.get(i).get("coverLargeUrl"));
						vo1.setBook_author((String) jsarr.get(i).get("author"));
						vo1.setBook_isbn((String) jsarr.get(i).get("isbn"));
						vo1.setBook_descript((String) jsarr.get(i).get("description"));
						vo1.setBook_title((String) jsarr.get(i).get("title"));
						SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd"); // 문자열 -> Date Date date =
																						// formatter.parse(dateStr);
						Date date = formatter.parse((String) jsarr.get(i).get("pubDate"));
						vo1.setBook_publish_date(date);

						vo1.setBook_publish((String) jsarr.get(i).get("publisher"));
						vo1.setBook_price(((Long) jsarr.get(i).get("priceStandard")).intValue());

						vo1.setBook_imgURL((String) jsarr.get(i).get("coverSmallUrl"));

						vo1.setCategory_num(Integer.parseInt((String) jsarr.get(i).get("categoryId")));

						vo1.setBook_points(0);
						vo1.setAuthor_seq(0);
						ser.insertAPI(vo1);
					}
				}

			}
		
		return jsonObj;
	}

}
