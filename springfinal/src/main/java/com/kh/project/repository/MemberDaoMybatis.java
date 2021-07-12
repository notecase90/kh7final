package com.kh.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.MemberDto;

@Repository
public class MemberDaoMybatis implements MemberDao{
	
	@Autowired 
	private SqlSession sqlSession;

	//회원가입
	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("member.regist", memberDto);
	}

	@Override
	public MemberDto login(MemberDto memberDto) {
		return sqlSession.selectOne("member.login", memberDto);
	}

	@Override
	public MemberDto get(int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int memberNo) {
		// TODO Auto-generated method stub
		return false;
	}
}
