
package project.spring.simpleproject.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
		int result = sqlSession.delete("MylistHairMapper.deletelist", map);
		return result;
	}
	
	///
	@Override
	   public List<MylistHair> getMyListHairList(MylistHair input) throws Exception {
	      
	      List<MylistHair> result = null;
	      
	      try {
	         result = sqlSession.selectList("MylistHairMapper.selectMyList",input);
	         
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
	   public List<MylistHair> getMyListHairMemoList(MylistHair input) throws Exception {
	      
	      List<MylistHair> result = null;
	      
	      try {
	         result = sqlSession.selectList("MylistHairMapper.selectMyMemoList",input);
	         
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
		Integer result = sqlSession.selectOne("MylistHairMapper.checklist",map);
		System.out.println("+++++++++impll"+result);
		return result;
	}
	@Override
	public int updatememo(MylistHair mylist) throws Exception {
		System.out.println("impl&&&&&&&&&&&&&&"+mylist.getMylistno());
		int result = sqlSession.update("MylistHairMapper.updatememo", mylist);
		return result;
	}




	
}

