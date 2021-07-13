package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.RoomDto;

public interface RoomDao {
	void insert(RoomDto roomDto);
	List<RoomDto> list();
	RoomDto detail(int roomNo);
	void edit(RoomDto roomDto);
	void delete(int roomNo);
}
