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
import project.spring.simpleproject.model.Avg;
import project.spring.simpleproject.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired(required = false)
	RestaurantService restaurantService;
	
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	@RequestMapping(value="/restaurant_result.do", method = RequestMethod.GET)
	public String restaurant_result(
			Model model, HttpServletResponse response,
			@RequestParam(value="loc", required=false) String loc,
			@RequestParam(value="subject", required=false) String subject,
			@RequestParam(value="stars", required=false) double stars,
			@RequestParam(value="review_count", required=false) int review_count
	) {
		
		Restaurant input = new Restaurant();
		input.setLoc(loc);
		input.setSubject(subject);
		input.setStars(stars);
		input.setReview_count(review_count);
		
		List<Restaurant> output = null;
		
		try {
			output = restaurantService.getRestaurantList(input);
		} catch(Exception e) { e.printStackTrace(); }
		
		
		Avg input_2 = new Avg();
		
		input_2.setAvg_loc(loc);
		input_2.setAvg_subject(subject);
		
		Avg output_2 = null;
		
		try {
			output_2 = restaurantService.getAvgs(input_2);
			
		} catch(Exception e) { e.printStackTrace(); }
		
		double avg_stars = output_2.getAvg_stars();
		double avg_rc = output_2.getAvg_rc();
		
		model.addAttribute("output",output);
		model.addAttribute("loc",loc);
		model.addAttribute("subject",subject);
		model.addAttribute("stars", stars);
		model.addAttribute("review_count", review_count);
		model.addAttribute("avg_stars", avg_stars);
		model.addAttribute("avg_rc", avg_rc);
		
		return "restaurant_result";
	}
	
	@RequestMapping(value = "/restaurant_search.do", method=RequestMethod.GET)
	public String restaurant_search() {
		return "restaurant_search";
		
	}
}
