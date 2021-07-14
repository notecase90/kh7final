package com.kh.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.EmailDto;

@Repository
public class EmailDaoImpl implements EmailDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(EmailDto emailDto) {
		sqlSession.insert("email.insert2", emailDto);
	}

	@Override
	public boolean check(EmailDto emailDto) {
		EmailDto find = sqlSession.selectOne("email.check", emailDto);
		return find != null;
	}

	@Override
	public void deleteByEmail(String email) {
		sqlSession.delete("email.deleteByEmail", email);
	}
	
}
