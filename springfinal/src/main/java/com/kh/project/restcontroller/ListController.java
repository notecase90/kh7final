package com.kh.project.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.repository.AllTypeDao;

@RestController
public class ListController {
	@Autowired
	private AllTypeDao allTypeDao = null;
	
	@GetMapping("type-list")
	public List<AllTypeDto> typeList() {
		return allTypeDao.list();
	}
}
