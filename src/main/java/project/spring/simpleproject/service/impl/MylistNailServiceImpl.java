
package project.spring.simpleproject.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.MylistNail;
import project.spring.simpleproject.service.MylistNailService;
@Slf4j
@Service
public class MylistNailServiceImpl implements MylistNailService{
    @Autowired
    SqlSession sqlSession;
	
	@Override
	public int addList(Map<String, Integer> map) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("MylistNailMapper.addList_nail",map);
		return result;
	}
	@Override
	public int getNailno(String input) throws Exception {
		// TODO Auto-generated method stub
		int result =0;
		try {
			result = sqlSession.selectOne("MylistNailMapper.findNailno_nail",input);
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터  조회에 실패");
		}
		return result;
	}
	@Override
	public int cancelList(Map<String, Integer> map) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("MylistNailMapper.deletelist_nail", map);
		return result;
	}
	
	///
	@Override
	   public List<MylistNail> getMyListNailList(MylistNail input) throws Exception {
	      
	      List<MylistNail> result = null;
	      
	      try {
	         result = sqlSession.selectList("MylistNailMapper.selectMyList_nail",input);
	         
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
	   public List<MylistNail> getMyListNailMemoList(MylistNail input) throws Exception {
	      
	      List<MylistNail> result = null;
	      
	      try {
	         result = sqlSession.selectList("MylistNailMapper.selectMyMemoList_nail",input);
	         
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
	public Integer checklist(Map<String, Integer> map) throws Exception {
		// TODO Auto-generated method stub
		Integer result = sqlSession.selectOne("MylistNailMapper.checklist_nail",map);
		
		return result;
	}
	@Override
	public int updatememo(MylistNail mylist) throws Exception {
		
		int result = sqlSession.update("MylistNailMapper.updatememo_nail", mylist);
		return result;
	}




	
}

