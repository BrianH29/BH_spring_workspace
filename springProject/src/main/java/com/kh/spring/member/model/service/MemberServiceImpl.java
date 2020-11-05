package com.kh.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;

//@Component  //@Component 는 단순한 빈으로 등록하기 위한 어노테이션
@Service    // @Service는 보다 구체화된 즉, Service의 의미를 가지는 클래스라는 빈으로 등록
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate ss;  // --> 우리가 건들수 없기 때문에 XML 로 작성 
	
	@Autowired
	private MemberDao mDao; // --> 우리가 건들수 있기 때문에 어노테이션 방식으로 사용
	
	@Override
	public Member loginMember(Member m) {
		//SqlSession sqlSession = getSqlSession(); --> 기입 이제 안해도됨 이미 스프링에 빈으로(root-context.xml) 되어져 있음. 
		//Member loginUser = mDao.loginMember(ss, m); 
		//return loginUser;
		return mDao.loginMember(ss, m);
	}

	@Override
	public int insertMember(Member m) {
		
		int result = mDao.insertMember(ss, m);
		return result;
	}

	@Override
	public int updateMember(Member m) {
		
		return mDao.updateMember(ss,m);
	}

	@Override
	public int deleteMember(String userId) {
		int result = mDao.deleteMember(ss, userId); 
		return result;
	}

	@Override
	public int idCheck(String userId) {
		int count = mDao.idCheck(ss, userId);
		return count;
	}

}
