

package project.spring.simpleproject.service;

import java.util.List;
import java.util.Map;

import project.spring.simpleproject.model.MylistHair;

public interface MylistHairService {
	public int addList(Map<String, Integer> map) throws Exception;
	public int getHairno(String name) throws Exception;
	public int cancelList(Map<String, Integer> map) throws Exception;
	public List<MylistHair> getMyListHairList(MylistHair input) throws Exception;
    public List<MylistHair> getMyListHairMemoList(MylistHair input) throws Exception;
}

