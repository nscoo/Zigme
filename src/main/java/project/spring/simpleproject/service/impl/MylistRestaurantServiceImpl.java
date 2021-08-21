
package project.spring.simpleproject.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.MylistRestaurant;
import project.spring.simpleproject.service.MylistRestaurantService;
@Slf4j
@Service
public class MylistRestaurantServiceImpl implements MylistRestaurantService{
    @Autowired
    SqlSession sqlSession;
	
	@Override
	public int addList(Map<String, Integer> map) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("MylistResMapper.addList_res",map);
		return result;
	}
	@Override
	public int getResno(String input) throws Exception {
		// TODO Auto-generated method stub
		int result =0;
		try {
			result = sqlSession.selectOne("MylistResMapper.findResno_res",input);
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터  조회에 실패");
		}
		return result;
	}
	@Override
	public int cancelList(Map<String, Integer> map) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("MylistResMapper.deletelist_res", map);
		return result;
	}
	
	///
	@Override
	   public List<MylistRestaurant> getMyListResList(MylistRestaurant input) throws Exception {
	      
	      List<MylistRestaurant> result = null;
	      
	      try {
	         result = sqlSession.selectList("MylistResMapper.selectMyList_res",input);
	         
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
	   public List<MylistRestaurant> getMyListResMemoList(MylistRestaurant input) throws Exception {
	      
	      List<MylistRestaurant> result = null;
	      
	      try {
	         result = sqlSession.selectList("MylistResMapper.selectMyMemoList_res",input);
	         
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
		Integer result = sqlSession.selectOne("MylistResMapper.checklist_res",map);
		
		return result;
	}
	@Override
	public int updatememo(MylistRestaurant mylist) throws Exception {
		
		int result = sqlSession.update("MylistResMapper.updatememo_res", mylist);
		return result;
	}




	
}

