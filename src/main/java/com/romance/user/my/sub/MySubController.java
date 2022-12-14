package com.romance.user.my.sub;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.romance.admin.coupon.CouponService;
import com.romance.admin.icon.IconService;
import com.romance.admin.log.LoggingService;
import com.romance.admin.log.PaymentLogVO;
import com.romance.admin.sub.SubscribeService;
import com.romance.admin.sub.SubscribeVO;
import com.romance.security.JwtUtils;
import com.romance.user.book.BookSearchVO;
import com.romance.user.book.BookService;
import com.romance.user.login.UserService;
import com.romance.user.login.UserVO;
import com.romance.user.my.infomodify.MyInfoService;
import com.romance.user.my.profile.MyProfileService;
import com.romance.user.subUtil.subscancel;
import com.romance.user.subUtil.subsche;


@Controller
@SessionAttributes("my_sub")
public class MySubController {

	@Autowired
	private IconService iconService;
	@Autowired
	private MySubService mySubService;
	@Autowired
	private SubscribeService subscribeService;
	@Autowired
	private CouponService couponService;
	@Autowired
	MyProfileService myProfileService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	MyInfoService ser;
	@Autowired
	UserService seru;
	@Autowired
	LoggingService loggingService;
	@Autowired
	BookService serr;
	
	//???????????? ?????? ??????
	//??????????????? ????????????
	@RequestMapping("/my_getSub.do")
	public String my_getSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo, BookSearchVO vo) throws IOException {
		UserVO vosession = util.getuser(session);
		if((vosession == null||!vosession.getUser_sub().equals("1"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
		   return "redirect:/myMain.do";
		}   
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		
		model.addAttribute("mybook",mySubService.mybook(vosession.getUser_id()));
		model.addAttribute("user_name", vosession.getUser_name());
		model.addAttribute("user_point", vosession.getUser_point());
		model.addAttribute("user_sub_count", vosession.getUser_sub_count());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(vosession));
		model.addAttribute("cate", mySubService.getcate(vosession));
		model.addAttribute("mynewlist",serr.detailbooklist());
		model.addAttribute("newlist",mySubService.newcate(vo));
		
		return "my_AddReadInfo";
	}
	
	//??????????????? vo??? ??????
	@RequestMapping(value="check_csb.do", method=RequestMethod.POST)
	@ResponseBody
	public UserVO check_csb(HttpSession session, JwtUtils util) throws IOException {
		UserVO userVO = util.getuser(session);
		
		return userVO;
	}
	//ajax ???????????? ??????
	@RequestMapping(value="/cansubpass.do", method=RequestMethod.POST)
	@ResponseBody
	public int cansubpass(HttpSession session, JwtUtils util, @RequestParam(name="user_id") String user_id, @RequestParam(name="user_password") String user_password) throws IOException {
		UserVO vosession = util.getuser(session);
		if((vosession == null||!vosession.getUser_sub().equals("1"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
			System.out.println("?????? ??????????????????2");
		   return 2;
		}   
		//DB?????? ????????? ???????????? ????????????
		String my_pass = mySubService.cansubpass(user_id);
		if(bCryptPasswordEncoder.matches(user_password, my_pass)) {
			return 1;	
		}else {
			return 0;
		}
		
	}
	
	//??????????????? ????????????
	@RequestMapping("/my_cancelSub.do")
	public String my_cancelSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) throws IOException {
		UserVO vosession = util.getuser(session);
		if((vosession == null||!vosession.getUser_sub().equals("1"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
		   return "redirect:index.do";
		}   
	
		
		model.addAttribute("user_id", vosession.getUser_id());
		model.addAttribute("cate", mySubService.getcate(vosession));
		model.addAttribute("mybook",mySubService.mybook(vosession.getUser_id()));
		model.addAttribute("user_name", vosession.getUser_name());
		model.addAttribute("user_point", vosession.getUser_point());
		model.addAttribute("user_sub_count", vosession.getUser_sub_count());
		model.addAttribute("user_sub_pay_before", vosession.getUser_sub_pay_before());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(vosession));
		
		return "my_AddReadCancel";
	}
	
	//??????????????? ??????????????????
	@RequestMapping("/my_modifySub.do")
	public String my_modifySub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) throws IOException {
		UserVO vosession = util.getuser(session);
		if((vosession == null||!vosession.getUser_sub().equals("1"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
		   return "redirect:index.do";
		}   
	 
    model.addAttribute("catelist",mySubService.getcatelist());
    model.addAttribute("mybook",mySubService.mybook(vosession.getUser_id()));
    model.addAttribute("catemy",mySubService.getcatemy(vosession.getUser_id()));
		model.addAttribute("user_name", vosession.getUser_name());
		model.addAttribute("user_point",vosession.getUser_point());
		model.addAttribute("user_sub_count", vosession.getUser_sub_count());
		model.addAttribute("user_sub_pay_before", vosession.getUser_sub_pay_before());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(vosession));
		
		return "my_AddReadModify";
	}
	
	//?????? ?????? ???????????? ??????
	@PostMapping("/cancelSubs.do")
	public String cancelSubs(UserVO vo, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			System.out.println("???????????? ???????????? ???????? + " + voToken.getUser_id());
			String user_id = voToken.getUser_id();
			String user_password = myProfileService.getSessionUser(user_id).getUser_password();
			System.out.println("?????? ???????????? ???????????? : " + user_password);
			
			//??????????????? ??????????????? ?????? ???????????? ?????? ????????? ?????? ?????????????????? ?????? ?????????.
			//?????? ??????????????? ??????????????? ???????????? ??????????????? ???????????? ????????????????????????.
			if(bCryptPasswordEncoder.matches(vo.getUser_password(), user_password)) {//matches - ????????????????????????, ????????????????????? ???????????? ????????????
				System.out.println("??????????????? ???????????? ?????????~");
				System.out.println("d");
				//session.invalidate();//???????????? ???????????? ?????????????????????|
				vo.setUser_id(voToken.getUser_id());
			    session.removeAttribute("id");
			    myProfileService.cancelSubs(user_id);
			    voToken = seru.onesearch(vo.getUser_id());
			    voToken.setUser_password(null);	//??????????????? ???????????? null - ????????? ?????? ????????????.
			    String token = utils.createToken("??????", voToken); //????????? ????????????.
			    session.setAttribute("id", token); //????????? ????????? ?????????.
				return "redirect:event_Sub.do";
			} else {
				System.out.println("??????????????? ????????????!!");
				return "redirect:my_cancelSub.do";
			}
			//????????????????????? ????????? ?????? ????????? ???????????? ???????????? ??? ???????????? ?????????
	
		} else {
			return "redirect:login.do";
		}
	}
	
	@RequestMapping("/go_Sub_Pay.do")
	public String go_Sub_Pay(UserVO vo, Model model, HttpSession session, JwtUtils util) {
		
		return "sub_Pay";
	}
	
	@GetMapping("/mysubpay.do")
  public String mysubpay(Model model, JwtUtils util, HttpSession session) throws IOException {
	  UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
return "redirect:index.do";
} 
	  UserVO vo = util.getuser(session);
    model.addAttribute("user", vo);
    return "my_SubPay";
  }
  
  @PostMapping("/subreg.do")
  @ResponseBody
  public int subreg(@RequestParam("cuid") String cuid, subsche sc,JwtUtils util,HttpSession session) throws Exception {
    System.out.println("subreg " + cuid);
    UserVO vo=util.getuser(session);
    String num=cuid.replaceAll(vo.getUser_id(),"");
    System.out.println("?????? num : "+num);
    vo.setUser_sub_start(num);
    System.out.println("?????? vo : "+vo);
    mySubService.subupdate(vo);
    UUID ran = UUID.randomUUID();
    System.out.println("?????? id"+cuid + "|" + ran.toString());
    sc.subpay(cuid, cuid + "|" + ran.toString());
    // ???????????? ?????? ?????????????????? ????????? ?????? + ????????? 1??? ?????????
    
    //?????? ?????? ?????? ??????
    subPaymentLog(vo.getUser_id());
 
    mySubService.subon(vo.getUser_id());
    UserVO vou=seru.onesearch(vo.getUser_id());
    vou.setUser_password(null);
    String token=util.createToken("??????", vou);
    session.setAttribute("id", token);
    return 1;
  }
  
  @PostMapping("/subcancel.do")
  @ResponseBody
  public int subcancel(String cuid, subscancel sc,JwtUtils util,HttpSession session) throws Exception {
    // ???????????? ?????? ?????????????????? ????????? ?????????
    UserVO user=util.getuser(session);
    cuid=user.getUser_id()+user.getUser_sub_start();
    System.out.println("?????? ?????????"+cuid);
    sc.subcancel(cuid);
    mySubService.subdel(user.getUser_id());
    UserVO vo=seru.onesearch(user.getUser_id());
    String token=util.createToken("??????", vo);
    session.setAttribute("id", token);
    return 1;
  }
  
  @PostMapping("/subrepay.do")
  @ResponseBody
  public void subrepay(@RequestBody JSONObject json, subsche sc,JwtUtils util,HttpSession session) throws Exception {
    System.out.println("?????? ?????????");
    System.out.println(json);
    System.out.println(json.get("merchant_uid"));
    
    String mid = (String) json.get("merchant_uid");
    if (!mid.contains("_")) {
      int ind = mid.indexOf("|");
      System.out.println("?????????12" + mid.substring(0, ind));
      String cuid = mid.substring(0, ind);
      UUID ran = UUID.randomUUID();
      
      sc.subpay(cuid, cuid + "|" + ran.toString());
      int idd=cuid.indexOf("&");
      String id=cuid.substring(0,idd);
      
      //?????? ????????? ?????? ??????
      subRePaymentLog(id);
      
      mySubService.subon(id);
      
    }
    
  }
  @GetMapping("subfin.do")
  public String subfin(JwtUtils util, HttpSession session) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:index.do";
      } 
    return "sub_Finish";
  }
  
  //????????????
  public void subPaymentLog(String user_id) throws Exception {
	  String payment_log_id = user_id;
	  int payment_log_money = 30000;
	  String payment_log_contents = "[?????? ??????] ";
	  payment_log_contents += "???????????? 30,000";
	  
	  PaymentLogVO paymentLogVO = new PaymentLogVO();
	  paymentLogVO.setPayment_log_id(payment_log_id);
	  paymentLogVO.setPayment_log_money(payment_log_money);
	  paymentLogVO.setPayment_log_contents(payment_log_contents);
	  loggingService.insertPaymentLog(paymentLogVO);
  }
  //?????? repay ??????
  public void subRePaymentLog(String user_id) throws Exception {
	  String payment_log_id = user_id;
	  int payment_log_money = 30000;
	  String payment_log_contents = "[?????? ?????????] ";
	  payment_log_contents += "???????????? 30,000";
	  
	  PaymentLogVO paymentLogVO = new PaymentLogVO();
	  paymentLogVO.setPayment_log_id(payment_log_id);
	  paymentLogVO.setPayment_log_money(payment_log_money);
	  paymentLogVO.setPayment_log_contents(payment_log_contents);
	  loggingService.insertPaymentLog(paymentLogVO);
  }
  @PostMapping("subupdate.do")
  public String subupdate(int[] category_num,JwtUtils util, HttpSession session) throws IOException {
    UserVO user=util.getuser(session);
    mySubService.delcate(user.getUser_id());
    mySubService.joininsert(category_num, user.getUser_id());
    System.out.println("cnum : "+category_num.toString());
    return "redirect:my_getSub.do";
  }
	
}
