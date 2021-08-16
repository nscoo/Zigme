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

import project.spring.simpleproject.model.Restaurant;
import project.spring.simpleproject.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService restaurantService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value="/restaurant_result.do", method = RequestMethod.GET)
	public String restaurant_result(
			Model model, HttpServletResponse response,
			@RequestParam(value="loc", required=false) String loc,
			@RequestParam(value="subject", required=false) String subject,
			@RequestParam(value="stars", required=false) double stars,
			@RequestParam(value="review_count", required=false) int review_count,
			@RequestParam(value="input_keyword", required=false) String input_keyword
	) {
		
		Restaurant input = new Restaurant();
		input.setLoc(loc);
		input.setSubject(subject);
		input.setStars(stars);
		input.setReview_count(review_count);
		// 키워드는 DB theme_N 부분 통합하고 다시 추가해야 함

		List<Restaurant> output = null;
		
		try {
			output = restaurantService.getRestaurantList(input);
		} catch(Exception e) { e.printStackTrace(); }
		
		model.addAttribute("output",output);
		model.addAttribute("loc",loc);
		model.addAttribute("subject",subject);
		model.addAttribute("stars", stars);
		model.addAttribute("review_count", review_count);
		// 키워드는 DB theme_N 부분 통합하고 다시 추가해야 함
		
		return "restaurant_result";
	}
	
	@RequestMapping(value = "/restaurant_search.do", method=RequestMethod.GET)
	public String restaurant_search() {
		return "restaurant_search";
		
	}
}
