package project.spring.simpleproject.service;

import java.util.List;

import project.spring.simpleproject.model.MyListHair;

public interface MyListHairService {


	public MyListHair getMyListHairItem(MyListHair input) throws Exception;
	
	public List<MyListHair> getMyListHairList(MyListHair input) throws Exception;
	
	public int getMyListHairCount(MyListHair input) throws Exception;
	
	public int addMyListHair(MyListHair input) throws Exception;
	
	public int editMyListHair(MyListHair input) throws Exception;
	
	public int deleteMyListHair(MyListHair input) throws Exception;
	

}
