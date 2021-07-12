package com.kh.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/") //전체 요청. 첫페이지를 의미함("/")
	public String home() { //메소드 이름
		//return "/WEB-INF/views/index.jsp"; 
		return "home"; //주소
	}
	
}