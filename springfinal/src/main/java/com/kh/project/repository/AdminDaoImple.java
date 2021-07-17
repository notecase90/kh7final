package com.kh.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.AdminDto;

@Repository
public class AdminDaoImple implements AdminDao{
	@Autowired
	private SqlSession sqlSession =null;
	@Override
	public AdminDto login(AdminDto adminDto) {
		return sqlSession.selectOne("admin.login",adminDto);
	}

}
