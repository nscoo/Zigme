package project.spring.simpleproject.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.Hair;
import project.spring.simpleproject.model.MyListHair;
import project.spring.simpleproject.service.MyListHairService;

@Service
@Slf4j
public class MyListHairImpl implements MyListHairService{
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	
	@Override
	public MyListHair getMyListHairItem(MyListHair input) throws Exception {
		MyListHair result = null;
		try {
			result = sqlSession.selectOne("MyListHairMapper.selectItem",input);
			
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
	public List<MyListHair> getMyListHairList(MyListHair input) throws Exception {
		
		List<MyListHair> result = null;
		
		try {
			result = sqlSession.selectList("MyListHairMapper.selectMyList",input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다");
		}
		
		
		return result;
	}

	@Override
	public int getMyListHairCount(MyListHair input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addMyListHair(MyListHair input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("MyListHairMapper.insertItem", input);
			
			if(result ==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		
		return result;
	}
	
	@Override
	public int editMyListHair(MyListHair input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMyListHair(MyListHair input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
