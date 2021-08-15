package project.spring.simpleproject.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.simpleproject.helper.RegexHelper;
import project.spring.simpleproject.helper.WebHelper;
import project.spring.simpleproject.model.Member;
import project.spring.simpleproject.service.MemberService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberservice;
	@Value("#{servletContext.contextPath}")
    String contextPath;
	@Autowired
    RegexHelper regexHelper;
	@Autowired
    WebHelper webHelper;
    
	
	/* 로그인*/
    /*
     * 세션을 통한 로그인
     * */
	@RequestMapping(value="loginAction.do", method=RequestMethod.POST)
	public ModelAndView loginAction( Member m, HttpServletRequest r,
		HttpServletResponse response)throws Exception {
		HttpSession session = r.getSession();
		Member login = memberservice.login(m);
		response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
		if(login == null)
		{
			return webHelper.redirect(null, "아이디/비밀번호가 맞지않습니다.");
		}else {
			session.setAttribute("member", login);
		}

		return webHelper.redirect("main.do", "로그인완료");
	}
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "login";
	}
	
	
	
	//회원가입
	/*
	 * @Param 
	 * 이름 : name 아이디 : userid
	 * 비밀번호 :userpw 비밀번호확인 : user_ch_pw
	 * 휴대폰 번호 : tel 생일 : brithdate
	 * 집 주소 : addr_h 회사주소 : addr_c
	 * 
	 * @description : input 내용을 입력받아 유효성검사후 db에 저장 성공시 메인페이지로 이동
	 */
	@RequestMapping(value="registAction.do", method=RequestMethod.POST)
	public ModelAndView add(Model model,HttpServletResponse response,
			@RequestParam(value="name", defaultValue = "") String name,
			@RequestParam(value="userid", defaultValue = "") String userid,
			@RequestParam(value="userpw", defaultValue = "") String userpw,
			@RequestParam(value="user_ch_pw", defaultValue = "") String user_ch_pw,
			@RequestParam(value="tel", defaultValue = "") String tel,
			@RequestParam(value="birthdate", defaultValue = "") String birthdate,
			@RequestParam(value="addr_h", defaultValue = "") String addr_h,
			@RequestParam(value="addr_c", defaultValue = "") String addr_c
			)  throws Exception{
		response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	
        if (!regexHelper.isKor(name))       { 
        	return webHelper.redirect(null, "사용자이름은 한글로만 가능합니다."); }
		if(!regexHelper.isEngNum(userid)) {
			return webHelper.redirect(null, "아이디는 영어와 숫자만 가능합니다");	
		}
		if(!regexHelper.isCellPhone(tel)) {
			return webHelper.redirect(null, "휴대전화 형식이 아닙니다.");	
		}
		if(userid.length()<4 || userid.length()>=14) {
			return webHelper.redirect(null, "아이디는 4~13글자 사이만 가능합니다");
		}
		if(userpw.length()<4 || userpw.length()>=20) {
			return webHelper.redirect(null, "비밀번호는 5글자이상 20글자이하로 입력 가능합니다.");
		}
		if(!userpw.equals(user_ch_pw)) {
			return webHelper.redirect(null, "비밀번호가 서로 다릅니다.");
		}
		Member input = new Member();
        input.setName(name);
        input.setUserid(userid);
        input.setUserpw(userpw);
        input.setTel(tel);
        input.setBirthdate(birthdate);
        input.setAddr_h(addr_h);
        input.setAddr_c(addr_c);

		try {
				memberservice.addMembers(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect("main.do", "회원가입완료");

	}

	//아이디 중복체크
	/*
	 * 멤버 객체를 받아 확인
	 * 리턴이 0이 아닐시 중복된 아이디
	 * */
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(Member m) throws Exception {
		int result = memberservice.idChk(m);
		return result;
	}
	
	//회원정보수정
	/*
	 */
	@RequestMapping(value = "/edit.do", method=RequestMethod.GET)
	public String edit() {
		
		return "edit";
	}
	@RequestMapping(value="/updateAction.do", method = RequestMethod.POST)
	public String updateMember(Member m,HttpServletRequest r) throws Exception {
	
		HttpSession session = r.getSession();
		memberservice.updateMembers(m);
		session.invalidate();
		return "redirect:main.do";
	}
	// 회원탈퇴
	@RequestMapping(value = "/deleteAction.do", method=RequestMethod.POST)
	public String deleteMember(Member m, HttpSession session, HttpServletRequest r) throws Exception {
		Member member = (Member) session.getAttribute("member");
		String sessionPass = member.getUserpw();
		String memberPass = m.getUserpw();
		if(!(sessionPass.equals(memberPass))) {
			return "redirect:delete.do";
		}
		memberservice.deleteMemebers(m);
		session.invalidate();
		return "redirect:/login.do";
	}
	//비밀번호 체크
	@ResponseBody
	@RequestMapping (value = "/passChk", method=RequestMethod.POST)
	public int passChk(Member m) throws Exception {
		int result = memberservice.passChk(m);
		return result;
	}
	//아이디 찾기
	@ResponseBody
	@RequestMapping(value="/findIdAction", method =RequestMethod.POST)
	public Member findId(Member m ) throws Exception {
		Member member = memberservice.findId(m);
		System.out.println("*****************"+member+"*******************");
		return member;
	}
	//비밀번호 초기화
	@ResponseBody
	@RequestMapping(value="/findPwAction", method =RequestMethod.POST)
	public int findPw(Member m) throws Exception {
		
		int member = memberservice.findPw(m);
		return member;
	}

	
}