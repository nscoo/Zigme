package project.spring.simpleproject.service;

import java.util.List;

import project.spring.simpleproject.model.Nail;

public interface NailService {
	
	public Nail getNailItem(Nail input) throws Exception;
	
	public List<Nail> getNailList(Nail input) throws Exception;
	
	public int getNailCount(Nail input) throws Exception;

}
