package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.AllTypeDto;

public interface AllTypeDao {
	
	void insert(AllTypeDto allTypeDto);
	List<AllTypeDto> list();
}
