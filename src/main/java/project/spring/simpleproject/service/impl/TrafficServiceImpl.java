package project.spring.simpleproject.service.impl;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.Traffic;
import project.spring.simpleproject.service.TrafficService;

@Slf4j
@Service
public class TrafficServiceImpl implements TrafficService{
	
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public int addList(Traffic input) throws Exception {
		int result = sqlSession.insert("TrafficMapper.insertItem",input);
		return result;
	}
	
	
	@Override
	public int cancelList(Map<String, Integer> map) throws Exception {
		
		int result = sqlSession.delete("TrafficMapper.deleteList",map);
		return result;
	}


	@Override
	public Traffic getTrafficItem(Traffic input) throws Exception {
		Traffic result = null;
		try {
			result = sqlSession.selectOne("TrafficMapper.selectItem", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}


	@Override
	public int checkList(Traffic input) throws Exception {
		int result = sqlSession.selectOne("TrafficMapper.checkList",input);
		return result;
	}


	@Override
	public List<Traffic> getTrafficList(Traffic input) throws Exception {
		List<Traffic> result = null;
		
		try {
			result = sqlSession.selectList("TrafficMapper.selectList",input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	
	

}
