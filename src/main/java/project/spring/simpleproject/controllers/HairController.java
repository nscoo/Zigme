package project.spring.simpleproject.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.spring.simpleproject.model.Hair;
import project.spring.simpleproject.service.HairService;

@Controller
public class HairController {

	@Autowired
	HairService hairService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value="/hair_result.do", method = RequestMethod.GET)
	public String list(Model model, HttpServletResponse response, @RequestParam(value="keyword", required=false) String keyword) {
		
		Hair input = new Hair();
		input.setName(keyword);
		input.setAddress(keyword);
		
		List<Hair> output = null;
		
		try {
			output = hairService.getHairList(input);
		} catch(Exception e) { e.printStackTrace(); }
		
		//view 처리
		model.addAttribute("output",output);
		model.addAttribute("keyword",keyword);
		
		
		return "hair_result";
	}
	
	@RequestMapping(value = "/hair_search.do", method=RequestMethod.GET)
	public String hair_search() {
		return "hair_search";
		
	}
}
