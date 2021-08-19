package project.spring.simpleproject.service;

import java.util.Map;

public interface MylistHairService {
	public int addList(Map<String, Integer> map) throws Exception;
	public int getHairno(String name) throws Exception;
	public int cancelList(Map<String, Integer> map) throws Exception;
}
