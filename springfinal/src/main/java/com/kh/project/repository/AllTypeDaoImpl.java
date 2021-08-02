package com.kh.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityOptionDto;

@Repository
public class AllTypeDaoImpl implements AllTypeDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(AllTypeDto allTypeDto) {
		
		sqlSession.insert("alltype.insert",allTypeDto);
	}


	@Override
	public List<AllTypeDto> list() {
		return sqlSession.selectList("alltype.list");
	}
	@Override
	public void insertOption(FacilityOptionDto facilityOptionDto) {
		sqlSession.insert("facilityOption.insert",facilityOptionDto);		
	}

	@Override
	public List<FacilityOptionDto> listOption() {
		return sqlSession.selectList("facilityOption.list");
	}
	
}
