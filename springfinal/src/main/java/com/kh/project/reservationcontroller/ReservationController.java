package com.kh.project.reservationcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.project.reservationentity.ReservationDto;
import com.kh.project.reservationrepository.ReservationDao;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationDao reservationDao = null;
	
	@GetMapping("reservation")
	public String reservationPage() {
		return "reservation/reservation";
	}
	@PostMapping("reservation")
	public String reservation(@ModelAttribute ReservationDto reservationDto,HttpSession session) {
		int memberNo = (int)session.getAttribute("memberNo");
		reservationDto.setReservationMemberNo(memberNo);
		reservationDao.insert(reservationDto);
		return "redirect:reservation-list";
	}
	
}
