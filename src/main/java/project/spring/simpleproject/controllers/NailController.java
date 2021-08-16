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

import project.spring.simpleproject.model.Nail;
import project.spring.simpleproject.service.NailService;

@Controller
public class NailController {
	
	@Autowired
	NailService nailService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value="/nail_result.do", method=RequestMethod.GET)
	public String list(Model model, HttpServletResponse response, @RequestParam(value="keyword", required=false) String keyword) {
		Nail input = new Nail();
		input.setName(keyword);
		input.setAddress(keyword);
		
		List<Nail> output = null;
		
		try {
			output = nailService.getNailList(input);
		} catch(Exception e) {e.printStackTrace();	}
		
		model.addAttribute("output",output);
		model.addAttribute("keyword",keyword);
		
		return "nail_result";
		
	}
	
	@RequestMapping(value = "/nail_search.do", method=RequestMethod.GET)
	public String nail_search() {
		return "nail_search";
		
	}
	
	
}
