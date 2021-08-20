package project.spring.simpleproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.helper.RetrofitHelper;
import project.spring.simpleproject.helper.WebHelper;
import project.spring.simpleproject.model.Music;
import project.spring.simpleproject.model.SearchYoutubeList;
import project.spring.simpleproject.model.SearchYoutubeList.Items;
import project.spring.simpleproject.service.MusicService;
import project.spring.simpleproject.service.YoutubeService;
import retrofit2.Call;
import retrofit2.Retrofit;


@Slf4j
@Controller
public class MusicController {
		
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RetrofitHelper retrofitHelper;
	
	@Autowired
	MusicService musicService;

	

	@RequestMapping(value = "/music_select1.do", method=RequestMethod.GET)
	public String music_select1() {
		return "music_select1";
		
	}
	
	@RequestMapping(value = "/music_select2.do", method=RequestMethod.GET)
	public String music_select2() {
		
		return "music_select2";
		
	}
	
	@RequestMapping(value = "/music_select3.do", method=RequestMethod.GET)
	public String music_select3() {
		
		return "music_select3";
		
	}
	
	@RequestMapping(value = "/music_select4.do", method=RequestMethod.GET)
	public String music_select4() {
		
		return "music_select4";
		
	}
	/** 음악페이지 선택 결과를 보여주는 페이지 */
	@RequestMapping(value = "/music_result.do", method=RequestMethod.GET)
	public ModelAndView music_result(Model model, 
			@RequestParam(required=false) String ans1,
			@RequestParam(required=false) String ans2,
			@RequestParam(required=false) String ans3,
			@RequestParam(required=false) String ans4) {
		
		
		
		/** API 연동 객체 생성 */
		// Retrofit 객체 생성
		Retrofit retrofit = retrofitHelper.getRetrofit(YoutubeService.BASE_URL);
		
		// Service 객체 생성 구현체는 Retrofit이 자동 생성해줌
		YoutubeService youtubeService = retrofit.create(YoutubeService.class);

		/** 사용자 선택 파라미터 처리  */
        String q = ans1.concat(ans2).concat(ans3).concat(ans4);

		/** 유투브 api 요청 받기 */
        SearchYoutubeList searchYoutubeList = null;
		Call<SearchYoutubeList> call = youtubeService.getSearchYoutube(q);
		
		try {
			searchYoutubeList = call.execute().body();
		} catch(Exception e) {
			e.printStackTrace();
		}

		
		//music 선택지에 따른 시각화
		
		Music input = new Music();
		input.setMusicno(1);
		
		Music output = null;
		
		try {
			output=musicService.getMusicItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//감정 선택시 sql +1 처리
		Music choice = new Music();
		choice.setMusicno(output.getMusicno());
		
		if(ans3.equals("행복한")) {
			choice.setHappy(output.getHappy()+1);
			choice.setJoy(output.getJoy());
			choice.setMad(output.getMad());
			choice.setBlue(output.getBlue());
			choice.setComfy(output.getComfy());
		} else if(ans3.equals("즐거운")) {
			
			choice.setHappy(output.getHappy());
			choice.setJoy(output.getJoy()+1);
			choice.setMad(output.getMad());
			choice.setBlue(output.getBlue());
			choice.setComfy(output.getComfy());
		} else if(ans3.equals("화가나는")) {
		
			choice.setHappy(output.getHappy());
			choice.setJoy(output.getJoy());
			choice.setMad(output.getMad()+1);
			choice.setBlue(output.getBlue());
			choice.setComfy(output.getComfy());
		} else if(ans3.equals("우울한")) {
			
			choice.setHappy(output.getHappy());
			choice.setJoy(output.getJoy());
			choice.setMad(output.getMad());
			choice.setBlue(output.getBlue()+1);
			choice.setComfy(output.getComfy());
		}else if(ans3.equals("편안한")) {
			
			choice.setHappy(output.getHappy());
			choice.setJoy(output.getJoy());
			choice.setMad(output.getMad());
			choice.setBlue(output.getBlue());
			choice.setComfy(output.getComfy()+1);
		}
		
		try {
			musicService.editMusic(choice);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		

		/** view 처리 */
		model.addAttribute("searchYoutubeList",searchYoutubeList);
		model.addAttribute("output",output);
		model.addAttribute("ans3",ans3);
	
		return new ModelAndView("music_result");
		
	}

	
	
}
