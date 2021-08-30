package project.spring.simpleproject.controllers;

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
import project.spring.simpleproject.model.Traffic;
import project.spring.simpleproject.service.TrafficService;

@Controller
public class TrafficController {
	
	@Value("#{servletContext.contextPath}")
    String contextPath;
	
	@Autowired
    RegexHelper regexHelper;
	
	@Autowired
    WebHelper webHelper;
	
	@Autowired
	TrafficService trafficService;


	   @RequestMapping(value = "/traffic_search.do", method=RequestMethod.GET)
	   public ModelAndView traffic_search(Model model,HttpServletResponse response, HttpSession session, HttpServletRequest r) {
		   
		   	Member member = (Member) session.getAttribute("member");
		   	
		   	if(member ==null) {
		           response.setCharacterEncoding("UTF-8");
		          response.setContentType("text/html;charset=UTF-8");
		            return webHelper.redirect("login.do", "로그인 후 이용바랍니다.");
		         }
		   	
		   	int userno = member.getUserno();
			
		   	Traffic input = new Traffic();
			input.setMembers_userno(userno);
			
			List<Traffic> alias = null;
			
			try {
				alias = trafficService.getTrafficList(input);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("alias",alias);
			
			
			
	      return new ModelAndView("traffic_search");
	      
	   }

	   @RequestMapping(value = "/traffic_result.do", method=RequestMethod.GET)
	   public String traffic_result() throws Exception {
	
		   
	      return "traffic_result";
	      
	   }



	   
	   //찜추가
	   @ResponseBody
		@RequestMapping(value="/add_tbasket", method=RequestMethod.POST)
		public int basketAction(@RequestParam(value="s_lat", required=true)String s_lat,
				@RequestParam(value="s_lng", required=true)String s_lng,
				@RequestParam(value="e_lat", required=true)String e_lat,
				@RequestParam(value="e_lng", required=true)String e_lng, 
				@RequestParam(value="to", required=true)String to,
				@RequestParam(value="from", required=true)String from,
				HttpServletResponse response, HttpSession session, HttpServletRequest r)
				throws Exception {
			
					Member member = (Member) session.getAttribute("member");
			if(member==null) {
				System.out.println("로그인안됨");
				return 3; // 
			}	
			int userno = member.getUserno();
			
			Traffic input = new Traffic();
			input.setMembers_userno(userno);
			input.setS_lat(s_lat);
			input.setS_lng(s_lng);
			input.setE_lat(e_lat);
			input.setE_lng(e_lng);
			input.setTo(to);
			input.setFrom(from);

			int result = trafficService.addList(input);
			if(result ==1) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			return result;
		}
		
		//찜 취소
		@ResponseBody
		@RequestMapping(value="/cancel_tbasket", method=RequestMethod.POST)
		public int basket_cancel_Action(@RequestParam(value="s_lat", required=true)String s_lat,
				@RequestParam(value="s_lng", required=true)String s_lng,
				@RequestParam(value="e_lat", required=true)String e_lat,
				@RequestParam(value="e_lng", required=true)String e_lng, HttpServletResponse response, HttpSession session, HttpServletRequest r)
				throws Exception {
			Member member = (Member) session.getAttribute("member");
			
			if(member==null) {
				System.out.println("로그인안됨");
				return 3; // 
			}
			int userno= member.getUserno();
					
			Traffic input = new Traffic();
			input.setMembers_userno(userno);
			input.setS_lat(s_lat);
			input.setS_lng(s_lng);
			input.setE_lat(e_lat);
			input.setE_lng(e_lng);
			
			Traffic output = null;
			output = trafficService.getTrafficItem(input);
			int trafficno =output.getTrafficno();
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("trafficno", trafficno);

			int result = trafficService.cancelList(map);
			
			return result;
		}
		
		
		@ResponseBody
		@RequestMapping(value="/checktlist", method=RequestMethod.POST)
		public Integer checklistAction(@RequestParam(value="s_lat", required=true)String s_lat,
				@RequestParam(value="s_lng", required=true)String s_lng,
				@RequestParam(value="e_lat", required=true)String e_lat,
				@RequestParam(value="e_lng", required=true)String e_lng, HttpServletResponse response, HttpSession session, HttpServletRequest r)
				throws Exception {
			Member member = (Member) session.getAttribute("member");
			int userno = member.getUserno();		
			
			Traffic input = new Traffic();
			input.setMembers_userno(userno);
			input.setS_lat(s_lat);
			input.setS_lng(s_lng);
			input.setE_lat(e_lat);
			input.setE_lng(e_lng);
			
			Integer result = trafficService.checkList(input);		
					
			return result;
		}
		
		
	
	
}
