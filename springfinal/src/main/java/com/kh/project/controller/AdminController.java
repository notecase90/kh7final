package com.kh.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.project.entity.AdminDto;
import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityDto;
import com.kh.project.entity.FacilityOptionDto;
import com.kh.project.entity.GongjiDto;
import com.kh.project.repository.AdminDao;
import com.kh.project.repository.AllTypeDao;
import com.kh.project.repository.HostDao;
import com.kh.project.vo.GongjiVo;

@Controller
public class AdminController {
	@Autowired
	private AdminDao adminDao = null;
	@Autowired 
	private AllTypeDao allTypeDao = null;
	@Autowired
	private HostDao hostDao = null;
	
	@GetMapping("admin")
	public String admin(HttpSession session) {
		Integer adminNo = (Integer)session.getAttribute("adminNo");
		if(adminNo != null) {
			return "admin/admin";
		}
		else {
			return "redirect:admin-login";
		}
		
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
			return "redirect:admin";
		}
		else {
			return "admin-login?error";
		}		
	}
	@GetMapping("admin-logout")
	public String logout(HttpSession session) {
		session.removeAttribute("adminNo");
		return "redirect:admin";
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
	@GetMapping("option-insert")
	public String insertOptionPage() {
		return "admin/option-insert";
	}
	@PostMapping("option-insert")
	public String insertOption(@ModelAttribute FacilityOptionDto facilityOptionDto) {
		allTypeDao.insertOption(facilityOptionDto);
		return "redirect:admin";
	}
	

	//공지 목록
	@GetMapping("gongji")
	public String gongji(Model model,HttpSession session) {
		Integer adminNo = (Integer)session.getAttribute("adminNo");
		model.addAttribute("gongjiList",adminDao.list());
		if(adminNo != null) {
			return "admin/gongji";
		}
		else {
			return "redirect:admin-login";
		}
	}	
	//공지 등록	
	@PostMapping("gongji")
	public String gongjiInsert(@ModelAttribute GongjiDto gongjiDto,HttpSession session) {
		int adminNo = (int)session.getAttribute("adminNo");
		gongjiDto.setAdminNo(adminNo);
		adminDao.insertGongji(gongjiDto);

		return "redirect:gongji";			
	}
	//호스트목록
	@GetMapping("host-list")
	public String hostListPage(Model model) {
		model.addAttribute("hostList",adminDao.hostList());
		return "admin/host-list";
	}
	//호스트 자격 박탈
	@GetMapping("host-delete")
	public String hostDelete(@RequestParam int hostNo) {
		hostDao.delete(hostNo);
		return "redirect:host-list";
	}


	
}
