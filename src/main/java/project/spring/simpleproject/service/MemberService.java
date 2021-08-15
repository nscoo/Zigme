package project.spring.simpleproject.service;


import project.spring.simpleproject.model.Member;

public interface MemberService  {
	public int addMembers(Member input) throws Exception;
    public int idChk(Member input) throws Exception;
    public Member login(Member input) throws Exception;
    public int updateMembers(Member input) throws Exception;
    public int deleteMemebers(Member input) throws Exception;
    public int passChk(Member input) throws Exception;
    public Member findId(Member input) throws Exception;
    public int findPw (Member input) throws Exception;
  
}

