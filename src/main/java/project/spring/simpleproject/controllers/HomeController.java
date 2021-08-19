package project.spring.simpleproject.controllers;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		log.debug("Hello Spring");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	

	@RequestMapping(value = "/nearby.do", method=RequestMethod.GET)
	public String nearby() {
		return "nearby";
		
	}
	

	

//	@RequestMapping(value = "/traffic_search.do", method=RequestMethod.GET)
//	public String traffic_search() {
//		return "traffic_search";
//		
//	}
//	
//	@RequestMapping(value = "/traffic_result.do", method=RequestMethod.GET)
//	public String traffic_result() {
//		return "traffic_result";
//		
//	}
	
	@RequestMapping(value = "/main.do", method=RequestMethod.GET)
	public String main() {
		return "main";
		
	}
	
	



	
	@RequestMapping(value = "/login.do", method=RequestMethod.GET)
	public String login() {
		return "login";
		
	}
	
	@RequestMapping(value ="/register.do")
	public String register() {
	return "register";
	}	
	
	@RequestMapping(value ="/find_account.do", method={RequestMethod.GET, RequestMethod.POST})
	public String find() {
	return "find_account";
	}
	
	@RequestMapping(value = "/delete.do", method=RequestMethod.GET)
	public String delete() {
		return "delete";
		
	}


}
