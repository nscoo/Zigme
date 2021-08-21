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
	//찜하기
	/*
	 * Member session으로 로그인 여부 확인, span,i 태그의 클래스로 하트 채우기 결정 및 DB연동
	 */
	@ResponseBody
	@RequestMapping(value="/add_basket", method=RequestMethod.POST)
	public int basketAction(@RequestParam(value="name", defaultValue="")String name,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		
		if(member==null) {
			System.out.println("로그인안됨");
			return 3; // 
		}	
		int user_no = member.getUserno();		
		int hair_hairno = mylisthair.getHairno(name);		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("members_userno", user_no);
		map.put("hair_hairno", hair_hairno);
		int result = mylisthair.addList(map);
		if(result ==1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return result;
	}
	
	//찜 취소
	@ResponseBody
	@RequestMapping(value="/cancel_basket", method=RequestMethod.POST)
	public int basket_cencel_Action(@RequestParam(value="name", defaultValue="")String name,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		
		if(member==null) {
			System.out.println("로그인안됨");
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

	      //멤버 userno 구하기
	      HttpSession session = r.getSession();
	      Member member = (Member) session.getAttribute("member");
	      if(member ==null) {
	  		response.setCharacterEncoding("UTF-8");
	    	response.setContentType("text/html;charset=UTF-8");
	    	  return webHelper.redirect("login.do", "로그인 후 이용바랍니다.");
	      }
	      int userno=member.getUserno();
	      
	      //userno 파라미터로 hairlist에 저장된 hairno 빼내기
	      MylistHair input_h = new MylistHair();
	      input_h.setMembers_userno(userno);
	      //
	      List<MylistHair> mylist_h = null;
	      try {
	         mylist_h = myListHairService.getMyListHairList(input_h);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }
	      
	      //userno 파라미터로 hair리스트에 저장된 memo 빼내기
	      List<MylistHair> mymemolist_h = null;
	      try {
	         mymemolist_h = myListHairService.getMyListHairMemoList(input_h);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }

	      
	      //헤어 고유번호 array리스트로 합쳐주기!
	      Hair input1 = new Hair();
	      List<Hair> output_h = new ArrayList<Hair>();
	      
	      for(int i=0; i<mylist_h.size(); i++) {

	         input1.setHairno(mylist_h.get(i).getHair_hairno());
	         
	         try {
	            output_h.addAll(hairService.getHairMyList(input1));
	         } catch(Exception e) { e.printStackTrace(); }
	         
	      }
	      
	      //네일
	      //userno 파라미터로 naillist에 저장된 nailno 빼내기
	      MylistNail input_n = new MylistNail();
	      input_n.setMembers_userno(userno);
	      //
	      List<MylistNail> mylist_n = null;
	      try {	
	         mylist_n = myListNailService.getMyListNailList(input_n);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }
	      
	      //userno 파라미터로 hair리스트에 저장된 memo 빼내기
	      List<MylistNail> mymemolist_n = null;
	      try {
	         mymemolist_n = myListNailService.getMyListNailMemoList(input_n);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }

	      
	      //네일 고유번호 array리스트로 합쳐주기!
	      Nail input2 = new Nail();
	      List<Nail> output_n = new ArrayList<Nail>();
	      
	      for(int i=0; i<mylist_n.size(); i++) {

	         input2.setNailno(mylist_n.get(i).getNail_nailno());
	         
	         try {
	            output_n.addAll(nailService.getNailMyList(input2));
	         } catch(Exception e) { e.printStackTrace(); }
	         
	      }
	      //식당
	      MylistRestaurant input_r = new MylistRestaurant();
	      input_r.setMembers_userno(userno);
	      //
	      List<MylistRestaurant> mylist_r = null;
	      try {	
	         mylist_r = myListRestaurantService.getMyListResList(input_r);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }
	      
	      //userno 파라미터로 식당리스트에 저장된 memo 빼내기
	      List<MylistRestaurant> mymemolist_r = null;
	      try {
	         mymemolist_r = myListRestaurantService.getMyListResMemoList(input_r);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }

	      
	      //식당 고유번호 array리스트로 합쳐주기!
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
	//찜확인
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
	//메모 저장
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

