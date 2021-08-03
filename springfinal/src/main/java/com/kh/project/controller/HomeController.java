package com.kh.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.repository.AdminDao;
import com.kh.project.repository.AllTypeDao;
import com.kh.project.repository.RoomDao;
import com.kh.project.vo.RoomVo;
import com.kh.project.vo.SearchVO;


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
	

	@Autowired
	private RoomDao roomDao;
	
	@PostMapping("/search")
	public String search(
			@ModelAttribute SearchVO searchVO,
			HttpSession session
			) {
		List<RoomVo> roomList = roomDao.list();
		System.out.println(roomList.size());
		for(int i=0;i<roomList.size();i++) {
			searchVO.setRoomNo(roomList.get(i).getRoomNo());
			if(roomDao.searchCheck(searchVO)) {
				roomList.remove(i);
			}
		}
		session.setAttribute("checkedRoom", roomList);
		return "redirect:room/searchList";
	}
}