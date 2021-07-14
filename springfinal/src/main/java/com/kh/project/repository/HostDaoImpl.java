package com.kh.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.hostentity.HostDto;

@Repository
public class HostDaoImpl implements HostDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void registHost(HostDto hostDto) {
		sqlSession.insert("host.regist", hostDto);
	}

}
