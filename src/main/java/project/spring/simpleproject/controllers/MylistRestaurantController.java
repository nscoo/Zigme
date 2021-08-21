package project.spring.simpleproject.controllers;


import java.util.HashMap;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import project.spring.simpleproject.helper.RegexHelper;
import project.spring.simpleproject.helper.WebHelper;

import project.spring.simpleproject.model.Member;
import project.spring.simpleproject.model.MylistRestaurant;
import project.spring.simpleproject.model.Restaurant;
import project.spring.simpleproject.service.MylistRestaurantService;
import project.spring.simpleproject.service.RestaurantService;


@Controller
public class MylistRestaurantController {
	@Autowired
	RestaurantService restaurantService;
	@Autowired
	MylistRestaurantService mylistrestaurant;
	@Value("#{servletContext.contextPath}")
    String contextPath;
	@Autowired
    RegexHelper regexHelper;
	@Autowired
    WebHelper webHelper;
	@Autowired
	MylistRestaurantService myListrestaurantService;
	//찜하기
	/*
	 * Member session으로 로그인 여부 확인, span,i 태그의 클래스로 하트 채우기 결정 및 DB연동
	 */
	@ResponseBody
	@RequestMapping(value="/add_basket3", method=RequestMethod.POST)
	public int basketAction(@RequestParam(value="name", defaultValue="")String name,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		
		if(member==null) {
			System.out.println("로그인안됨");
			return 3; // 
		}	
		int user_no = member.getUserno();
		int restaurant_resno = mylistrestaurant.getResno(name);		

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("members_userno", user_no);
		map.put("restaurant_resno", restaurant_resno);
		int result = mylistrestaurant.addList(map);
		if(result ==1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return result;
	}
	
	//찜 취소
	@ResponseBody
	@RequestMapping(value="/cancel_basket3", method=RequestMethod.POST)
	public int basket_cencel_Action(@RequestParam(value="name", defaultValue="")String name,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		
		if(member==null) {
			
			return 3; // 로그인 X
		}	
		int user_no = member.getUserno();		
		int restaurant_resno = mylistrestaurant.getResno(name);		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("members_userno", user_no);
		map.put("restaurant_resno", restaurant_resno);
		int result = mylistrestaurant.cancelList(map);
		
		return result;
	}

	

	//찜확인
	@ResponseBody
	@RequestMapping(value="/checklist3", method=RequestMethod.POST)
	public Integer checklistAction(@RequestParam(value="resno", defaultValue="")int restaurant_resno,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		
		Member member = (Member) session.getAttribute("member");
		Integer result = null;
		if(member!=null) {
			int user_no = member.getUserno();	
			System.out.println("****************"+restaurant_resno);
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("members_userno", user_no);
			map.put("restaurant_resno", restaurant_resno);
			result = mylistrestaurant.checklist(map);		
		}			
		return result;
	}
	//메모 저장
	@ResponseBody
	@RequestMapping(value="/savememo3", method=RequestMethod.POST)
	public int savememoAction(@RequestParam(value="mylistno", defaultValue="")int mylistno , @RequestParam(value="memo", defaultValue="")String memo) throws Exception {
		MylistRestaurant mylist =new MylistRestaurant();
		
		mylist.setMylistno(mylistno);
		mylist.setMemo(memo);
		
		int result = mylistrestaurant.updatememo(mylist);
		return result;
	}
	
}

