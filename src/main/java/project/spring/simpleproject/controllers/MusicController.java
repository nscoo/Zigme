package project.spring.simpleproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.helper.RetrofitHelper;
import project.spring.simpleproject.helper.WebHelper;
import project.spring.simpleproject.model.SearchYoutubeList;
import project.spring.simpleproject.model.SearchYoutubeList.Items;
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

	

	@RequestMapping(value = "/music_select1.do", method=RequestMethod.GET)
	public String searchYoutube(Model model,
			// Get 파라미터 받기
			@RequestParam(value="answer", defaultValue="0") String ans1) {
		String result = null;
		
		// 사용자의 기분선택에 따른 추천조건
		if (ans1 == "신나는") {
			result = "신나는곡 추천";
		} else if (ans1 == "편안한") {
			result = "마음이 편안해지는 곡 추천";
		} else if (ans1 == "감성적인") {
			result = "감성적인 노래 추천";
		}
		
		
		// 파라미터값을 View에게 전달
		model.addAttribute("ans1" , ans1);
		model.addAttribute("result",result);
	
		return "music_select1";
		
	}
	
	@RequestMapping(value = "/music_select2.do", method=RequestMethod.GET)
	public String music_select2(Model model,
			// Get 파라미터 받기
			@RequestParam(value="answer", defaultValue="0") String ans2) {
		String result = null;
		
		// 사용자의 날씨선택에 따른 추천조건
		if (ans2 == "맑은날") {
			result = "화창한날씨에 듣기 좋은 노래";
		} else if (ans2 == "비오는날") {
			result = "분위기 있는 노래 추천";
		} else if (ans2 == "흐린날") {
			result = "감성적인 노래 추천";
		}
		
		
		// 파라미터값을 View에게 전달
		model.addAttribute("ans2" ,ans2);
		model.addAttribute("result",result);
		
		return "music_select2";
		
	}
	
	@RequestMapping(value = "/music_select3.do", method=RequestMethod.GET)
	public String music_select3(Model model,
			// Get 파라미터 받기
			@RequestParam(value="answer", defaultValue="0") String ans3) {
          String result = null;
		
		// 시간대 선택에 따른 추천조건
		if (ans3 == "아침") {
			result = "신나는곡 추천";
		} else if (ans3 == "오전") {
			result = "마음이 편안해지는 곡 추천";
		} else if (ans3 == "오후") {
			result = "감성적인 노래 추천";
		}
		
		
		// 파라미터값을 View에게 전달
		model.addAttribute("ans3" ,ans3);
		model.addAttribute("result",result);
		
		return "music_select3";
		
	}
	
	@RequestMapping(value = "/music_select4.do", method=RequestMethod.GET)
	public String music_select4(Model model,
			// Get 파라미터 받기
			@RequestParam(value="answer", defaultValue="0") String ans4) {
		 String result = null;
			
			// 사용자의 기분선택에 따른 추천조건
			if (ans4 == "퇴근길") {
				result = "신나는곡 추천";
			} else if (ans4 == "공부할때") {
				result = "마음이 편안해지는 곡 추천";
			} else if (ans4 == "운동할때") {
				result = "감성적인 노래 추천";
			}
			
			
			// 파라미터값을 View에게 전달
			model.addAttribute("ans4" ,ans4);
			model.addAttribute("result",result);
		
		return "music_select4";
		
	}
	/** 음악페이지 선택 결과를 보여주는 페이지 */
	@RequestMapping(value = "/music_result.do", method=RequestMethod.GET)
	public String music_result(Model model, 
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
		
        String q = ans1.concat(ans3);

		/** 유투브 api 요청 받기 */
        SearchYoutubeList searchYoutubeList = null;
		Call<SearchYoutubeList> call = youtubeService.getSearchYoutube(q);
		
		try {
			searchYoutubeList = call.execute().body();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
        /** 조회결과  */
	    if(searchYoutubeList != null) {
	    	List<Items> list = searchYoutubeList.getItems();
	    }
		
		/** view 처리 */
		model.addAttribute("q", q);
		model.addAttribute("searchYoutubeList",searchYoutubeList);
	
		return "music_result";
		
	}

}
