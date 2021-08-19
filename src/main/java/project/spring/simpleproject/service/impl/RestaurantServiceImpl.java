package project.spring.simpleproject.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.Restaurant;
import project.spring.simpleproject.service.RestaurantService;

@Slf4j
@Service
public class RestaurantServiceImpl implements RestaurantService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Restaurant getRestaurantItem(Restaurant input) throws Exception {
		Restaurant result = null;
		try {
			result = sqlSession.selectOne("RestaurantMapper.selectItem", input);
			
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
	public List<Restaurant> getRestaurantList(Restaurant input) throws Exception {
		List<Restaurant> result = null;
		
		try {
			result = sqlSession.selectList("RestaurantMapper.selectList",input);
			
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
	public int getRestaurantCount(Restaurant input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("RestaurantMapper.selectCountAll",input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	

}

