package project.spring.simpleproject;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	@RequestMapping(value = "/restaurant_search.do", method=RequestMethod.GET)
	public String restaurant_search() {
		return "restaurant_search";
		
	}
	
	@RequestMapping(value = "/restaurant_result.do", method=RequestMethod.GET)
	public String restaurant_result() {


		return "restaurant_result";

	}
	
	@RequestMapping(value = "/nearby.do", method=RequestMethod.GET)
	public String nearby() {
		return "nearby";
		
	}
	
	@RequestMapping(value = "/nail_search.do", method=RequestMethod.GET)
	public String nail_search() {
		return "nail_search";
		
	}
	
	@RequestMapping(value = "/nail_result.do", method=RequestMethod.GET)
	public String nail_result() {
		return "nail_result";
		
	}
	
	@RequestMapping(value = "/hair_search.do", method=RequestMethod.GET)
	public String hair_search() {
		return "hair_search";
		
	}
	
	@RequestMapping(value = "/hair_result.do", method=RequestMethod.GET)
	public String hair_result() {
		return "hair_result";
		
	}
	
	@RequestMapping(value = "/traffic_search.do", method=RequestMethod.GET)
	public String traffic_search() {
		return "traffic_search";
		
	}
	
	@RequestMapping(value = "/traffic_result.do", method=RequestMethod.GET)
	public String traffic_result() {
		return "traffic_result";
		
	}
	
	@RequestMapping(value = "/main.do", method=RequestMethod.GET)
	public String main() {
		return "main";
		
	}
	@RequestMapping(value = "/music_select1.do", method=RequestMethod.GET)
	public String music_select1() {
		return "music_select1";
		
	}
	
	@RequestMapping(value = "/music_select2.do", method=RequestMethod.GET)
	public String music_select2() {
		return "music_select2";
		
	}
	
	@RequestMapping(value = "/music_select3.do", method=RequestMethod.GET)
	public String music_select3() {
		return "music_select3";
		
	}
	
	@RequestMapping(value = "/music_select4.do", method=RequestMethod.GET)
	public String music_select4() {
		return "music_select4";
		
	}
	
	@RequestMapping(value = "/music_result.do", method=RequestMethod.GET)
	public String music_result() {
		return "music_result";
		
	}
	
	@RequestMapping(value = "/mylist.do", method=RequestMethod.GET)
	public String mylist() {
		return "mylist";
		
	}
	
	@RequestMapping(value = "/edit.do", method=RequestMethod.GET)
	public String edit() {
		return "edit";
		
	}
	
	@RequestMapping(value = "/login.do", method=RequestMethod.GET)
	public String login() {
		return "login";
		
	}
	
	@RequestMapping(value ="/register.do")
	public String register() {
	return "register";
	}	
	
	@RequestMapping(value ="/find_account.do")
	public String find() {
	return "find_account";
	}

}
