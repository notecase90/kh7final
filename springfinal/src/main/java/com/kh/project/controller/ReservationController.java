package com.kh.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.project.repository.ReservationDao;
import com.kh.project.repository.RoomDao;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	
	@Autowired
	private ReservationDao reservationDao;
		
	@GetMapping("/reservation")
	public String reservation(
			@RequestParam int reservationNo,
			Model model)	 {							
		model.addAttribute("ReservationVO",reservationDao.get(reservationNo));
		return "reservation/reservation";
	}
	
}
