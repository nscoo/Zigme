package project.spring.simpleproject.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.MylistHair;
import project.spring.simpleproject.service.MylistHairService;
@Slf4j
@Service
public class MylistHairServiceImpl implements MylistHairService{
    @Autowired
    SqlSession sqlSession;
	
	@Override
	public int addList(Map<String, Integer> map) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("MylistHairMapper.addList",map);
		return result;
	}
	@Override
	public int getHairno(String input) throws Exception {
		// TODO Auto-generated method stub
		int result =0;
		System.out.println("impl ++++"+input+"*****");
		try {
			result = sqlSession.selectOne("MylistHairMapper.findHairno",input);
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터  조회에 실패");
		}
		return result;
	}
	@Override
	public int cancelList(Map<String, Integer> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<MylistHair> getMyListHairList(MylistHair input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<MylistHair> getMyListHairMemoList(MylistHair input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
