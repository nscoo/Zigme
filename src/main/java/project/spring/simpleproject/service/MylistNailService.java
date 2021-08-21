

package project.spring.simpleproject.service;

import java.util.List;
import java.util.Map;

import project.spring.simpleproject.model.MylistNail;

public interface MylistNailService {
	public int addList(Map<String, Integer> map) throws Exception;
	public int getNailno(String name) throws Exception;
	public int cancelList(Map<String, Integer> map) throws Exception;
	public List<MylistNail> getMyListNailList(MylistNail input) throws Exception;
    public List<MylistNail> getMyListNailMemoList(MylistNail input) throws Exception;
    public Integer checklist(Map<String,Integer> map)throws Exception;
    public int updatememo(MylistNail mylist)throws Exception;
}

