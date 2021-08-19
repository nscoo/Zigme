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
import project.spring.simpleproject.model.MylistHair;
import project.spring.simpleproject.service.HairService;
import project.spring.simpleproject.service.MylistHairService;

@Controller
public class MylistHairController {
	@Autowired
	HairService hairService;
	@Autowired
	MylistHairService mylisthair;
	@Value("#{servletContext.contextPath}")
    String contextPath;
	@Autowired
    RegexHelper regexHelper;
	@Autowired
    WebHelper webHelper;

	//찜하기
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
		map.put("item1", user_no);
		map.put("item2", hair_hairno);
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
		map.put("item1", user_no);
		map.put("item2", hair_hairno);
		int result = mylisthair.addList(map);
		if(result ==1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return result;
	}
}
