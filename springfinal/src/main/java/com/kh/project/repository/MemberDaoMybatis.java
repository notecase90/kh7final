package com.kh.project.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.MemberDto;

@Repository
public class MemberDaoMybatis implements MemberDao{
	
	@Autowired 
	private SqlSession sqlSession;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	//회원가입
	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("member.regist", memberDto);
	}
	
	//로그인
	@Override
	public MemberDto login(MemberDto memberDto) {
		return sqlSession.selectOne("member.login", memberDto);
	}
	//개인정보 확인
	@Override
	public MemberDto get(int memberNo) {
		return sqlSession.selectOne("member.get",memberNo);
	}

	//회원탈퇴
	@Override
	public boolean delete(int memberNo) {
		sqlSession.delete("member.exit",memberNo);
		return true;
	}

	@Override
	public boolean changePw(	String newPw,int memberNo,String curPw) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("newPw", newPw);
		map.put("memberNo", memberNo); //순서는 중요함! sql 구문에 맞춰서 순서 작성할 것!
		map.put("curPw", curPw); //jsp에서 보여줄 이름-속성
		//update 를 실행하면 int 가 튀어나옴
		int count = sqlSession.update("member.changePw", map);

		
		return count > 0;
	}

	//개인정보 변경
	@Override
	public boolean changeInformation(MemberDto memberDto) {
		int count = sqlSession.update("member.changeInfo", memberDto);
		return count > 0;
		
	}

	//회원가입시 아이디 중복 확인
	@Override
	public MemberDto idCheck(String memberId) {
		return sqlSession.selectOne("member.idCheck", memberId);
	}

	//회원가입시 아이디 중복 확인
	@Override
	public boolean exits(String memberId) {
		return sqlSession.selectOne("member.idCheck", memberId) !=null;
	}
		
}
