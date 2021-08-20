package project.spring.simpleproject.service;

import project.spring.simpleproject.model.Music;

public interface MusicService {
	
	public Music getMusicItem(Music input) throws Exception;
	
	public int editMusic(Music input) throws Exception;
	
	public int editMusicScheduler() throws Exception;

}
