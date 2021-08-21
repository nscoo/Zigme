package project.spring.simpleproject.service;

import java.util.List;
import java.util.Map;

import project.spring.simpleproject.model.Traffic;

public interface TrafficService {
	
	public int addList(Traffic input) throws Exception;
	
	public int cancelList(Map<String, Integer> map) throws Exception;
	
	public Traffic getTrafficItem(Traffic input) throws Exception;
	
	public int checkList(Traffic input)throws Exception;
	
	public List<Traffic> getTrafficList(Traffic input) throws Exception;

}
