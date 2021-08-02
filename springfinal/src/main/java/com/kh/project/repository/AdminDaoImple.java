package com.kh.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.AdminDto;
import com.kh.project.entity.GongjiDto;
import com.kh.project.vo.GongjiVo;
import com.kh.project.vo.HostVo;

@Repository
public class AdminDaoImple implements AdminDao{
	@Autowired
	private SqlSession sqlSession =null;
	@Override
	public AdminDto login(AdminDto adminDto) {
		return sqlSession.selectOne("admin.login",adminDto);
	}
	@Override
	public void insertGongji(GongjiDto gongjiDto) {	
		sqlSession.insert("admin.gongjiInsert",gongjiDto);
	}
	@Override
	public List<GongjiVo> list() {
		return sqlSession.selectList("admin.gongjiList");
	}
	
	@Override
	public List<HostVo> hostList() {
		return sqlSession.selectList("admin.hostList");
	}
}
