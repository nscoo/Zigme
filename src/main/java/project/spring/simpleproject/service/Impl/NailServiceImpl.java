package project.spring.simpleproject.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.Nail;
import project.spring.simpleproject.service.NailService;

@Slf4j
@Service
public class NailServiceImpl implements NailService{
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public Nail getNailItem(Nail input) throws Exception {
		Nail result = null;
		try {
			result = sqlSession.selectOne("NailMapper.selectItem", input);
			
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
	public List<Nail> getNailList(Nail input) throws Exception {
		List<Nail> result = null;
		
		try {
			result = sqlSession.selectList("NailMapper.selectList",input);
			
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
	public int getNailCount(Nail input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("NailMapper.selectCountAll",input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	
	

}
