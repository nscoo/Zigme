package project.spring.simpleproject.service;

import project.spring.simpleproject.model.SearchYoutubeList;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;


public interface YoutubeService {
	public static final String BASE_URL = "https://www.googleapis.com";

	// 유튜브 api 연동
	@GET("/youtube/v3/search?key=AIzaSyD0mRgl-STDQIH6sNl2fvE2YshQhzYmRS0&part=snippet&type=video")
	Call<SearchYoutubeList> getSearchYoutube(@Query("q") String q);

	


	
	
	

}
