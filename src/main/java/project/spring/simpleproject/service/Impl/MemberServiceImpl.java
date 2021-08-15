package project.spring.simpleproject.service.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.spring.simpleproject.model.Member;
import project.spring.simpleproject.service.MemberService;
@Slf4j
@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    SqlSession sqlSession;
	@Override
	public int addMembers(Member input) throws Exception {
	// TODO Auto-generated method stub
		int result = 0;

        try {
            result = sqlSession.insert("MemberMapper.memberAdd", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없음.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장 실패");
        }

        return result;
    }
	@Override
	public int idChk(Member input) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("MemberMapper.memberidChk", input);
		return result;
	}
	@Override
	public Member login(Member input) throws Exception {
		// TODO Auto-generated method stub
		Member result = sqlSession.selectOne("MemberMapper.memberLogin",input);
		return result;
	}
	@Override
	public int updateMembers(Member input) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.update("MemberMapper.memberEdit", input);
		return result;
	}
	@Override
	public int deleteMemebers(Member input) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("MemberMapper.memberDelete", input);
		return result;
	}
	@Override
	public int passChk(Member input) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("MemberMapper.memberPwch",input);
		return result;
	}

	@Override
	public int findPw(Member input) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.update("MemberMapper.member_FindPw", input);
		return result;
	}
	@Override
	public Member findId(Member input) throws Exception {
		// TODO Auto-generated method stub
		Member result = sqlSession.selectOne("MemberMapper.member_Findid", input);

		return result;
	}




}
