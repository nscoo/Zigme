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
	@Autowired
	MylistHairService myListHairService;
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
	   public ModelAndView list(Model model, HttpServletRequest r) {

	      //멤버 userno 구하기
	      HttpSession session = r.getSession();
	      Member member = (Member) session.getAttribute("member");
	      int userno=member.getUserno();
	      
	      //userno 파라미터로 hairlist에 저장된 hairno 빼내기
	      MylistHair input = new MylistHair();
	      input.setMembers_userno(userno);
	      //
	      List<MylistHair> mylist = null;
	      try {
	         mylist = myListHairService.getMyListHairList(input);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }
	      
	      //userno 파라미터로 hair리스트에 저장된 memo 빼내기
	      List<MylistHair> mymemolist = null;
	      try {
	         mymemolist = myListHairService.getMyListHairMemoList(input);
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }

	      
	      //헤어 고유번호 array리스트로 합쳐주기!
	      Hair input1 = new Hair();
	      List<Hair> output = new ArrayList<Hair>();
	      
	      for(int i=0; i<mylist.size(); i++) {

	         input1.setHairno(mylist.get(i).getHair_hairno());
	         
	         try {
	            output.addAll(hairService.getHairMyList(input1));
	         } catch(Exception e) { e.printStackTrace(); }
	         
	      }


	      model.addAttribute("output",output);
	      model.addAttribute("mymemolist",mymemolist);
	      
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

