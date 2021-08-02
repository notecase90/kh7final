package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityOptionDto;

public interface AllTypeDao {
	
	void insert(AllTypeDto allTypeDto);
	List<AllTypeDto> list();
	void insertOption(FacilityOptionDto facilityOptionDto);
	List<FacilityOptionDto> listOption();

}
