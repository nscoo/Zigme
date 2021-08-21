package project.spring.simpleproject.service;

import java.util.List;

import project.spring.simpleproject.model.Restaurant;
import project.spring.simpleproject.model.Avg;

public interface RestaurantService {
	
	public List<Restaurant> getRestaurantList(Restaurant input) throws Exception;
	
	public int getRestaurantCount(Restaurant input) throws Exception;
	
	public Avg getAvgs(Avg input_2) throws Exception;
}
