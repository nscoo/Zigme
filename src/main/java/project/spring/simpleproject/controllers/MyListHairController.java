package project.spring.simpleproject.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.spring.simpleproject.helper.RegexHelper;
import project.spring.simpleproject.helper.WebHelper;
import project.spring.simpleproject.model.Hair;
import project.spring.simpleproject.model.Member;
import project.spring.simpleproject.model.MyListHair;
import project.spring.simpleproject.service.HairService;
import project.spring.simpleproject.service.MemberService;
import project.spring.simpleproject.service.MyListHairService;

@Controller
public class MyListHairController {
	
	@Autowired WebHelper webHelper;
	
	@Autowired RegexHelper regexHelper;
	
	@Autowired MyListHairService myListHairService;
	
	@Autowired HairService hairService;
	
	@Autowired MemberService memberService; 
	
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value ="/mylist.do", method=RequestMethod.GET)
	public ModelAndView list(Model model, HttpServletRequest r) {

		HttpSession session = r.getSession();
		Member member = (Member) session.getAttribute("member");
		int userno=member.getUserno();
		
		MyListHair input = new MyListHair();
		input.setUserno(userno);
		
		List<MyListHair> hairno = null;
		try {
			hairno = myListHairService.getMyListHairList(input);
		} catch (Exception e) {			
			e.printStackTrace();
		}

		
		Hair input1 = new Hair();
		List<Hair> output = null;
		
		for( int i =0; i<hairno.size(); i++) {
			
			input1.setHairno(hairno.get(i).getHairno());
			
			try {
				//output += hairService.getHairMyList(input1);
			} catch(Exception e) { e.printStackTrace(); }
			
			
			
			
			}
		
		model.addAttribute("output",output);
		return new ModelAndView("mylist");
		}
	
	@RequestMapping(value ="/view.do", method=RequestMethod.GET)
	public ModelAndView view(Model model) {return null;}
	
	
	
	
	

	@RequestMapping(value ="/add_ok.do", method=RequestMethod.GET)
	public ModelAndView add_ok(Model model, 
			@RequestParam(value="userno") int userno,
			@RequestParam(value="hairno") int hairno){
		
		MyListHair input = new MyListHair();
		input.setUserno(userno);
		input.setHairno(hairno);
		
		try {
			myListHairService.addMyListHair(input);
		} catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		return webHelper.redirect(null, "MyList에 저장되었습니다.");

		}
	
	
	
	
	@RequestMapping(value ="/edit_hair.do", method=RequestMethod.GET)
	public String edit(Model model) {return null;}
	
	@RequestMapping(value ="/edit_ok.do", method=RequestMethod.GET)
	public ModelAndView edit_ok(Model model) {return null;}
	
	@RequestMapping(value ="/delete_ok.do", method=RequestMethod.GET)
	public ModelAndView delete(Model model) {return null;}
	
}
