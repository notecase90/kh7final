package com.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.repository.AdminDao;
import com.kh.project.repository.AllTypeDao;

@Controller
public class HomeController {
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private AllTypeDao allTypeDao;
	@GetMapping("/")
	public String gongji(Model model) {
		if(adminDao.list().size()!=0) {
			model.addAttribute("gongji",adminDao.list().get(0));
		}
		return "home";
	}
	@RequestMapping("/template/header") //전체 요청. 첫페이지를 의미함("/")
	public String header() { //메소드 이름
		//return "/WEB-INF/views/index.jsp"; 
		return "/template/header"; //주소
	}
	

	
}