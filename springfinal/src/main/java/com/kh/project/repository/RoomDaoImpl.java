package com.kh.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao {

	@Autowired 
	private SqlSession sqlSession;
	
	@Override
	public void insert(RoomDto roomDto) {
		sqlSession.insert("room.insert", roomDto);
	}

	@Override
	public List<RoomDto> list() {
		return sqlSession.selectList("room.list");
	}

	@Override
	public RoomDto detail(int roomNo) {
		return sqlSession.selectOne("room.detail", roomNo);
	}
	
	@Override
	public void edit(RoomDto roomDto) {
		sqlSession.update("room.edit", roomDto);
	}

	@Override
	public void delete(int roomNo) {
		sqlSession.delete("room.delete", roomNo);
	}

	

}
