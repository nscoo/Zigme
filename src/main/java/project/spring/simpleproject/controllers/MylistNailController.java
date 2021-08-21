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

import project.spring.simpleproject.model.Member;
import project.spring.simpleproject.model.MylistNail;
import project.spring.simpleproject.model.Nail;
import project.spring.simpleproject.service.MylistNailService;
import project.spring.simpleproject.service.NailService;


@Controller
public class MylistNailController {
	@Autowired
	NailService nailService;
	@Autowired
	MylistNailService mylistnail;
	@Value("#{servletContext.contextPath}")
    String contextPath;
	@Autowired
    RegexHelper regexHelper;
	@Autowired
    WebHelper webHelper;
	@Autowired
	MylistNailService myListnailService;
	//찜하기
	/*
	 * Member session으로 로그인 여부 확인, span,i 태그의 클래스로 하트 채우기 결정 및 DB연동
	 */
	@ResponseBody
	@RequestMapping(value="/add_basket2", method=RequestMethod.POST)
	public int basketAction(@RequestParam(value="name", defaultValue="")String name,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		
		if(member==null) {
			System.out.println("로그인안됨");
			return 3; // 
		}	
		int user_no = member.getUserno();		
		int nail_nailno = mylistnail.getNailno(name);		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("members_userno", user_no);
		map.put("nail_nailno", nail_nailno);
		int result = mylistnail.addList(map);
		if(result ==1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return result;
	}
	
	//찜 취소
	@ResponseBody
	@RequestMapping(value="/cancel_basket2", method=RequestMethod.POST)
	public int basket_cencel_Action(@RequestParam(value="name", defaultValue="")String name,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		
		if(member==null) {
			System.out.println("로그인안됨");
			return 3; // 
		}	
		int user_no = member.getUserno();		
		int nail_nailno = mylistnail.getNailno(name);		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("members_userno", user_no);
		map.put("nail_nailno", nail_nailno);
		int result = mylistnail.cancelList(map);
		
		return result;
	}

	

	//찜확인
	@ResponseBody
	@RequestMapping(value="/checklist2", method=RequestMethod.POST)
	public Integer checklistAction(@RequestParam(value="nailno", defaultValue="")int nailno,
			HttpServletResponse response, HttpSession session, HttpServletRequest r)
			throws Exception {
		Member member = (Member) session.getAttribute("member");
		Integer result = null;
		if(member!=null) {
			int user_no = member.getUserno();		
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("members_userno", user_no);
			map.put("nail_nailno", nailno);
			result = mylistnail.checklist(map);		
		}			
		return result;
	}
	//메모 저장
	@ResponseBody
	@RequestMapping(value="/savememo2", method=RequestMethod.POST)
	public int savememoAction(@RequestParam(value="mylistno", defaultValue="")int mylistno , @RequestParam(value="memo", defaultValue="")String memo) throws Exception {
		MylistNail mylist =new MylistNail();
		
		mylist.setMylistno(mylistno);
		mylist.setMemo(memo);
		System.out.println("&&&&&&&&&&&&&&&&&&&&&"+mylist);
		int result = mylistnail.updatememo(mylist);
		return result;
	}
	
}

