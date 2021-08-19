package project.spring.simpleproject.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.spring.simpleproject.model.Traffic;

@Controller
public class TrafficController {
	
	@Value("#{servletContext.contextPath}")
	
	@RequestMapping(value = "/traffic_result.do", method = RequestMethod.GET)
	public String traffic_result() {
//			Model model,
//			HttpServletResponse response,
//			@RequestParam(value="s_lat", required=false) String s_lat,
//			@RequestParam(value="s_lng", required=false) String s_lng,
//			@RequestParam(value="e_lat", required=false) String e_lat,
//			@RequestParam(value="e_lng", required=false) String e_lng
//	) {
////		Traffic input = new Traffic();
////		input.setS_lat(s_lat);
////		input.setS_lng(s_lng);
////		input.setE_lat(e_lat);
////		input.setE_lng(e_lng);
////		
//		model.addAttribute("s_lat", s_lat);
//		model.addAttribute("s_lng", s_lng);
//		model.addAttribute("e_lat", e_lat);
//		model.addAttribute("e_lng", e_lng);
//		
//		
		return "traffic_result";
		
	}
	
	@RequestMapping(value = "/traffic_search.do", method=RequestMethod.GET)
	public String traffic_search() {
		return "traffic_search";
		
	}
	
}
