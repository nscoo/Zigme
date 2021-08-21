

package project.spring.simpleproject.service;

import java.util.List;
import java.util.Map;

import project.spring.simpleproject.model.MylistRestaurant;

public interface MylistRestaurantService {
	public int addList(Map<String, Integer> map) throws Exception;
	public int getResno(String name) throws Exception;
	public int cancelList(Map<String, Integer> map) throws Exception;
	public List<MylistRestaurant> getMyListResList(MylistRestaurant input) throws Exception;
    public List<MylistRestaurant> getMyListResMemoList(MylistRestaurant input) throws Exception;
    public Integer checklist(Map<String,Integer> map)throws Exception;
    public int updatememo(MylistRestaurant mylist)throws Exception;
}

