package project.spring.simpleproject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TrafficController {

	   @RequestMapping(value = "/traffic_search.do", method=RequestMethod.GET)
	   public String nearby() {
	      return "traffic_search";
	      
	   }
	   

	   

	   @RequestMapping(value = "/traffic_result.do", method=RequestMethod.GET)
	   public String main() {
	      return "traffic_result";
	      
	   }
	
	
}
