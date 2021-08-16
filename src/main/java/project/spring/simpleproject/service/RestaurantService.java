package project.spring.simpleproject.service;

import java.util.List;

import project.spring.simpleproject.model.Restaurant;

public interface RestaurantService {
	
	public Restaurant getRestaurantItem(Restaurant input) throws Exception;
	
	public List<Restaurant> getRestaurantList(Restaurant input) throws Exception;
	
	public int getRestaurantCount(Restaurant input) throws Exception;
	
}
