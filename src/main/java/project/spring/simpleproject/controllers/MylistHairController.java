package project.spring.simpleproject.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.simpleproject.helper.RegexHelper;
import project.spring.simpleproject.helper.WebHelper;
import project.spring.simpleproject.model.Hair;
import project.spring.simpleproject.model.Member;
import project.spring.simpleproject.model.MylistHair;
import project.spring.simpleproject.model.MylistNail;
import project.spring.simpleproject.model.MylistRestaurant;
import project.spring.simpleproject.model.Nail;
import project.spring.simpleproject.model.Restaurant;
import project.spring.simpleproject.service.HairService;
import project.spring.simpleproject.service.NailService;
import project.spring.simpleproject.service.RestaurantService;
import project.spring.simpleproject.service.MylistHairService;
import project.spring.simpleproject.service.MylistNailService;
import project.spring.simpleproject.service.MylistRestaurantService;

@Controller
public class MylistHairController {
	@Autowired
	HairService hairService;
	@Autowired
	NailService nailService;
	@Autowired
	RestaurantService restaurantService;
	@Autowired
	MylistHairService mylisthair;
	@Autowired
	@Value("#{servletContext.contextPath}")
    String contextPath;
	@Autowired
    RegexHelper regexHelper;
	@Autowired
    WebHelper webHelper;
	@Autowired
	MylistHairService myListHairService;
	@Autowired
	MylistNailService myListNailService;
	@Autowired
	MylistRestaurantService myListRestaurantService;
	//?????????
	/*
	 * Member session?????? ????????? ?????? ??????, span,i ????????? ???????????? ?????? ????????? ?????? ??? DB??????
	 */
	@ResponseBody
	@RequestMapping(value="/add_basket", method=RequestMethod.POST)
	public int basketAction(@RequestParam(value="name", defaultValue="")String name,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		
		if(member==null) {
			System.out.println("???????????????");
			return 3; // 
		}	
		int user_no = member.getUserno();		
		int hair_hairno = mylisthair.getHairno(name);		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("members_userno", user_no);
		map.put("hair_hairno", hair_hairno);
		int result = mylisthair.addList(map);
		if(result ==1) {
			System.out.println("??????");
		}else {
			System.out.println("??????");
		}
		return result;
	}
	
	//??? ??????
	@ResponseBody
	@RequestMapping(value="/cancel_basket", method=RequestMethod.POST)
	public int basket_cencel_Action(@RequestParam(value="name", defaultValue="")String name,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		
		if(member==null) {
			System.out.println("???????????????");
			return 3; // 
		}	
		int user_no = member.getUserno();		
		int hair_hairno = mylisthair.getHairno(name);		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("members_userno", user_no);
		map.put("hair_hairno", hair_hairno);
		int result = mylisthair.cancelList(map);
		
		return result;
	}

	
	@RequestMapping(value ="/mylist.do", method=RequestMethod.GET)
	   public ModelAndView list(Model model, HttpServletRequest r, HttpServletResponse response) {

	      //?????? userno ?????????
	      HttpSession session = r.getSession();
	      Member member = (Member) session.getAttribute("member");
	      if(member ==null) {
	  		response.setCharacterEncoding("UTF-8");
	    	response.setContentType("text/html;charset=UTF-8");
	    	  return webHelper.redirect("login.do", "????????? ??? ??????????????????.");
	      }
	      int userno=member.getUserno();
	      
	      //userno ??????????????? hairlist??? ????????? hairno ?????????
	      MylistHair input_h = new MylistHair();
	      input_h.setMembers_userno(userno);
	      //
	      List<MylistHair> mylist_h = null;
	      try {
	         mylist_h = myListHairService.getMyListHairList(input_h);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }
	      
	      //userno ??????????????? hair???????????? ????????? memo ?????????
	      List<MylistHair> mymemolist_h = null;
	      try {
	         mymemolist_h = myListHairService.getMyListHairMemoList(input_h);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }

	      
	      //?????? ???????????? array???????????? ????????????!
	      Hair input1 = new Hair();
	      List<Hair> output_h = new ArrayList<Hair>();
	      
	      for(int i=0; i<mylist_h.size(); i++) {

	         input1.setHairno(mylist_h.get(i).getHair_hairno());
	         
	         try {
	            output_h.addAll(hairService.getHairMyList(input1));
	         } catch(Exception e) { e.printStackTrace(); }
	         
	      }
	      
	      //??????
	      //userno ??????????????? naillist??? ????????? nailno ?????????
	      MylistNail input_n = new MylistNail();
	      input_n.setMembers_userno(userno);
	      //
	      List<MylistNail> mylist_n = null;
	      try {	
	         mylist_n = myListNailService.getMyListNailList(input_n);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }
	      
	      //userno ??????????????? hair???????????? ????????? memo ?????????
	      List<MylistNail> mymemolist_n = null;
	      try {
	         mymemolist_n = myListNailService.getMyListNailMemoList(input_n);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }

	      
	      //?????? ???????????? array???????????? ????????????!
	      Nail input2 = new Nail();
	      List<Nail> output_n = new ArrayList<Nail>();
	      
	      for(int i=0; i<mylist_n.size(); i++) {

	         input2.setNailno(mylist_n.get(i).getNail_nailno());
	         
	         try {
	            output_n.addAll(nailService.getNailMyList(input2));
	         } catch(Exception e) { e.printStackTrace(); }
	         
	      }
	      //??????
	      MylistRestaurant input_r = new MylistRestaurant();
	      input_r.setMembers_userno(userno);
	      //
	      List<MylistRestaurant> mylist_r = null;
	      try {	
	         mylist_r = myListRestaurantService.getMyListResList(input_r);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }
	      
	      //userno ??????????????? ?????????????????? ????????? memo ?????????
	      List<MylistRestaurant> mymemolist_r = null;
	      try {
	         mymemolist_r = myListRestaurantService.getMyListResMemoList(input_r);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }

	      
	      //?????? ???????????? array???????????? ????????????!
	      Restaurant input3 = new Restaurant();
	      List<Restaurant> output_r = new ArrayList<Restaurant>();
	      
	      for(int i=0; i<mylist_r.size(); i++) {

	         input3.setResno(mylist_r.get(i).getRestaurant_resno());
	         
	         try {
	            output_r.addAll(restaurantService.getResMyList(input3));
	         } catch(Exception e) { e.printStackTrace(); }
	      }
	      model.addAttribute("output_r", output_r);
	      model.addAttribute("mymemolist_r", mymemolist_r);
	      model.addAttribute("output_h",output_h);
	      model.addAttribute("mymemolist_h",mymemolist_h);
	      model.addAttribute("output_n",output_n);
	      model.addAttribute("mymemolist_n",mymemolist_n);

	      return new ModelAndView("mylist");
	      }
	//?????????
	@ResponseBody
	@RequestMapping(value="/checklist", method=RequestMethod.POST)
	public Integer checklistAction(@RequestParam(value="hairno", defaultValue="")int hairno,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		Integer result = null;
		if(member!=null) {
			int user_no = member.getUserno();		
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("members_userno", user_no);
			map.put("hair_hairno", hairno);
			result = mylisthair.checklist(map);		
		}			
		return result;
	}
	//?????? ??????
	@ResponseBody
	@RequestMapping(value="/savememo", method=RequestMethod.POST)
	public int savememoAction(@RequestParam(value="mylistno", defaultValue="")int mylistno , @RequestParam(value="memo", defaultValue="")String memo) throws Exception {
		MylistHair mylist =new MylistHair();
		
		mylist.setMylistno(mylistno);
		mylist.setMemo(memo);
		int result = mylisthair.updatememo(mylist);
		return result;
	}
	
}

