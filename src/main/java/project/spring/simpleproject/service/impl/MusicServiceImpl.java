package project.spring.simpleproject.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.Music;
import project.spring.simpleproject.service.MusicService;

@Slf4j
@Service
public class MusicServiceImpl implements MusicService {
	
	@Autowired
	SqlSession sqlSession;


	@Override
	public Music getMusicItem(Music input) throws Exception {
		Music result = null;
		try {
			result = sqlSession.selectOne("MusicMapper.selectItem", input);
			
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
	public int editMusic(Music input) throws Exception {
		int result = 0;
		
		try {
		result=sqlSession.update("MusicMapper.updateItem",input);
			if (result==0) {
				throw new NullPointerException("result==0");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
			}
		
		
		return result;
	}


	@Override
	public int editMusicScheduler() throws Exception {
int result = 0;
		
		try {
		result=sqlSession.update("MusicMapper.updateSchedulerItem");
			if (result==0) {
				throw new NullPointerException("result==0");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
			}
		
		
		return result;
	}
}
