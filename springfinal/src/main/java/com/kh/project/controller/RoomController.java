package com.kh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.project.entity.RoomDto;
import com.kh.project.repository.RoomDao;

@Controller
@RequestMapping("room")
public class RoomController {
	
	@Autowired
	private RoomDao roomDao;
	
	// 숙소등록
	@GetMapping("/insert")
	public String insert() {
		return "room/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute RoomDto roomDto) {
		roomDao.insert(roomDto);
		return "redirect:insert_success";
	}
	
	@GetMapping("/insert_success")
	public String insertSuccess() {
		return "room/insertSuccess";
	}
	
	// 숙소명 리스트
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", roomDao.list());
		return "room/roomList2";
	}
	
	// 모든숙소 정보 
	@GetMapping("/list2")
	public String list2(Model model) {
		model.addAttribute("list", roomDao.list());
		return "room/roomList";
	}
	
	// 상세보기
	@GetMapping("/detail/{roomNo}")
	public String detail(@PathVariable int roomNo, Model model) {
		model.addAttribute("roomDto", roomDao.detail(roomNo));
		return "room/detail";// "/WEB-INF/views/room/detail.jsp";
	}
	
	// 삭제 후 목록
	@GetMapping("/delete")
	public String delete(int roomNo) {
		roomDao.delete(roomNo);
		return "redirect:list";
	}
	@GetMapping("/edit")
	public String edit(@RequestParam int roomNo, Model model) {
		model.addAttribute("roomDto",roomDao.detail(roomNo));
		return "room/edit";
	}
	
	// 수정
	@PostMapping("/edit")
	public String edit(@ModelAttribute RoomDto roomDto) {
		roomDao.edit(roomDto);
		return "redirect:edit_success";
	}
	
	@GetMapping("/edit_success")
	public String editSuccess() {
		return "room/editSuccess";
	}
	
}
