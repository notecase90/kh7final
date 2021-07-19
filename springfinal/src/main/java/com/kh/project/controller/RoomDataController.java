package com.kh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityOptionDto;
import com.kh.project.repository.RoomDao;

@RestController//@Controller + @ResponseBody
@RequestMapping("/data/room")
public class RoomDataController {

	@Autowired
	private RoomDao roomDao;
	
	@GetMapping("/facility")
	public List<FacilityOptionDto> facility() {
		return roomDao.facility();
	}
	
	@GetMapping("/allType")
	public List<AllTypeDto> allType() {
		return roomDao.allType();
	}
}
