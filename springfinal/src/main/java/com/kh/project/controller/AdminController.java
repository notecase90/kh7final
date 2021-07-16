package com.kh.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.project.entity.AdminDto;
import com.kh.project.entity.AllTypeDto;
import com.kh.project.repository.AdminDao;
import com.kh.project.repository.AllTypeDao;

@Controller
public class AdminController {
	@Autowired
	private AdminDao adminDao = null;
	@Autowired 
	private AllTypeDao allTypeDao = null;
	
	@GetMapping("admin")
	public String admin() {
		return "admin/admin";
	}
	@GetMapping("admin-login")
	public String loginPage() {
		return "admin/admin-login";
	}
	@PostMapping("admin-login")
	public String login(@ModelAttribute AdminDto adminDto,HttpSession session) {
		AdminDto isLogin = adminDao.login(adminDto);
		if(isLogin != null) {
			session.setAttribute("adminNo",isLogin.getAdminNo());
			return "redirect:alltype-insert";
		}
		else {
			return "admin-login?error";
		}		
	}
	
	@GetMapping("alltype-insert")
	public String insert() {
		return "admin/alltype-insert";							
	}
	@PostMapping("alltype-insert")
	public String insert(@ModelAttribute AllTypeDto allTypeDto) {
		allTypeDao.insert(allTypeDto);
		return "redirect:admin";
	}
	
}
