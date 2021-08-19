package project.spring.simpleproject.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.Hair;
import project.spring.simpleproject.service.HairService;

@Slf4j
@Service
public class HairServiceImpl implements HairService{
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public Hair getHairItem(Hair input) throws Exception {
		Hair result = null;
		try {
			result = sqlSession.selectOne("HairMapper.selectItem", input);
			
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
	public List<Hair> getHairList(Hair input) throws Exception {
		List<Hair> result = null;
		
		try {
			result = sqlSession.selectList("HairMapper.selectList",input);
			
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
	public List<Hair> getHairMyList(Hair input) throws Exception {
		List<Hair> result = null;
		
		try {
			result = sqlSession.selectList("HairMapper.selectMyList",input);
			
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
	public int getHairCount(Hair input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("HairMapper.selectCountAll",input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}




	
	

}
