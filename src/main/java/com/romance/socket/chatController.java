package com.romance.socket;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

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
  
  @RequestMapping("/deletall.do")
  @ResponseBody
  public String deletall() {
    ser.delall();
    return "success";
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
  public List<chatVO> selectList(chatVO vo, chatSearchVO vos) {
    if (vos.getPage() == 0) {
      vos.setPage(1);
    }
    return ser.selectList(vos);
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
  
  @PostMapping("/chat.do")
  public String chat(String user, Model model, JwtUtils util, HttpSession session) throws IOException {
    
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
return "redirect:index.do";
} 

    UserVO vo = util.getuser(session);
    if (vo == null) {
 
      return "redirect:index.do";
    }
    System.out.println("chat");
    
    model.addAttribute("userid", vo.getUser_id());
    return "realchat_user";
  }
  
  @GetMapping("/chatAdmin.mdo")
  public String chatAdmin(String user, Model model,JwtUtils util, HttpSession session) throws IOException  {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }
    model.addAttribute("userid", user);
    return "admin_realchat_admin";
  }
  
  @RequestMapping("/countlist.do")
  @ResponseBody
  public int countlist(chatSearchVO vos) {
    if (vos.getPage() == 0) {
      vos.setPage(1);
    }
    
    return ser.countlist(vos);
  }
  @GetMapping("/chatseldel.mdo")
  @ResponseBody
  public void chatseldel(@RequestParam("delid[]") List<String> delid) {
    System.out.println("chatseldel"+delid);
    ser.chatseldel(delid);
  }
  @GetMapping("/chatList.mdo")
  public String chatList(chatVO vo, chatSearchVO vos, Model model,JwtUtils util, HttpSession session) throws IOException  {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }

    if (vos.getPage() == 0) {
      vos.setPage(1);
    }
    
    List<chatVO> vol = ser.selectList(vos);
    
    int count = vol.size();
    
    if (count % 5 == 0) {
      count--;
    }
    if (vos.getPage() < 3) {
      model.addAttribute("startpage", 1);
    } else {
      model.addAttribute("startpage", vos.getPage() - 2);
    }
    if (vos.getPage() + 2 > count / 5 + 1) {
      model.addAttribute("endpage", count / 5 + 1);
    } else {
      model.addAttribute("endpage", vos.getPage() + 2);
    }
    model.addAttribute("all_sum", count);
    model.addAttribute("all_page", vos.getPage());
    model.addAttribute("all_vos", vos);
    model.addAttribute("chatli", vol);
    return "admin_realChat";
  }
  // ?????? ????????? ??????
  // @RequestMapping("/country.do")
  // @ResponseBody
  // public JSONObject country(API vo1, Model model1)
  // throws IOException, ParseException, java.text.ParseException, org.json.simple.parser.ParseException {
  // JSONObject jsonObj = null;
  //
  //
  // for (int j = 0; j < 20; j++) {
  // System.out.println("j: " + j);
  // String result = HttpUtil.callApi("L", "foreign", "215", 10, j);
  // JSONParser jsonParser = new JSONParser();
  //
  // // 3. To Object
  // Object obj = jsonParser.parse(result);
  //
  // // 4. To JsonObject
  // jsonObj = (JSONObject) obj;
  //
  // List<JSONObject> jsarr = (List<JSONObject>) jsonObj.get("item");
  // for (int i = 0; i < jsarr.size(); i++) {
  //
  // vo1.setBook_points(0);
  // if ((String) jsarr.get(i).get("coverLargeUrl") != null
  // && (String) jsarr.get(i).get("categoryId") != null
  // && (String) jsarr.get(i).get("author") != null && (String) jsarr.get(i).get("isbn") != null
  // && (String) jsarr.get(i).get("description") != null
  // && (String) jsarr.get(i).get("title") != null
  // && (String) jsarr.get(i).get("pubDate") != null
  // && (String) jsarr.get(i).get("publisher") != null
  // && (Long) jsarr.get(i).get("priceStandard") != null
  // && (String) jsarr.get(i).get("coverSmallUrl") != null
  // && (String) jsarr.get(i).get("categoryId") != null) {
  // vo1.setBook_bigimgURL((String) jsarr.get(i).get("coverLargeUrl"));
  // vo1.setBook_author((String) jsarr.get(i).get("author"));
  // vo1.setBook_isbn((String) jsarr.get(i).get("isbn"));
  // vo1.setBook_descript((String) jsarr.get(i).get("description"));
  // vo1.setBook_title((String) jsarr.get(i).get("title"));
  // SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd"); // ????????? -> Date Date date =
  // // formatter.parse(dateStr);
  // Date date = formatter.parse((String) jsarr.get(i).get("pubDate"));
  // vo1.setBook_publish_date(date);
  //
  // vo1.setBook_publish((String) jsarr.get(i).get("publisher"));
  // vo1.setBook_price(((Long) jsarr.get(i).get("priceStandard")).intValue());
  //
  // vo1.setBook_imgURL((String) jsarr.get(i).get("coverSmallUrl"));
  //
  // vo1.setCategory_num(Integer.parseInt((String) jsarr.get(i).get("categoryId")));
  //
  // vo1.setBook_points(0);
  // vo1.setAuthor_seq(0);
  // ser.insertAPI(vo1);
  // }
  // }
  //
  // }
  //
  // return jsonObj;
  // }
  // @GetMapping("test.do")
  // public String input1(MultipartFile mainUploadFile) throws IOException {
  // return "test";
  // }
  // @PostMapping("test.do")
  // public String input(@RequestParam("mainUploadFile") MultipartFile mainUploadFile) throws IOException {
  // System.out.println(mainUploadFile);
  // //?????? ?????????
  // String upoladFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";
  // String filename=mainUploadFile.getOriginalFilename();
  // String expand=filename.substring(filename.indexOf("."));
  // String key=UUID.randomUUID().toString()+expand;
  // System.out.println(key+" :key"); // key="/?????????/"+key; ?????? ?????? ?????? ?????????
  // InputStream is = mainUploadFile.getInputStream();
  // String contentType = mainUploadFile.getContentType();
  // long contentLength = mainUploadFile.getSize();
  // AwsS3 awsS3 = AwsS3.getInstance();
  // awsS3.upload(is, key, contentType, contentLength);
  // System.out.println(key);
  // //?????? ??????
  // key=key.replace(upoladFolder,"");
  // System.out.println(key);
  //
  // System.out.println(key);
  // awsS3.delete(key); //key??? ?????????
  // return "redirect:test.do";
  // }
  // //????????????
  // @GetMapping("author.do")
  // public void author() {
  // ser.author();
  // }
  
}
