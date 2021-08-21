package project.spring.simpleproject.service;

import java.util.List;

import project.spring.simpleproject.model.Hair;


public interface HairService {
	
	public Hair getHairItem(Hair input) throws Exception;
	
	public List<Hair> getHairList(Hair input) throws Exception;
	
	public int getHairCount(Hair input) throws Exception;
	public List<Hair> getHairMyList(Hair input) throws Exception;
}
