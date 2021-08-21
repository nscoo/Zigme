package project.spring.simpleproject.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.service.MusicService;

@Slf4j
@Controller
public class MusicScheduler {
	
	@Autowired
	MusicService musicService;
	


	public void everyMidnight() {
		try {
			log.debug("매일 자정에 뮤직 선택 sql 0으로 초기화하는 작업 >>"+ musicService.editMusicScheduler());
		} catch (Exception e) {
		
			e.printStackTrace();
		}
	}

}
