package com.kh.project.hostcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.hostentity.HostDto;
import com.kh.project.repository.HostDao;


@Controller
@RequestMapping("host")
public class HostController {
	
	//호스트 메인페이지
	@GetMapping("/host-home")
	public String hostHomePage() {
		return "host/host-home";
	}		

	//달력 페이지
	@GetMapping("/host-calendar")
	public String calendarPage() {
		return "host/host-calendar";
	}
	
	//예약내역 페이지
	//
	
	//메세지 페이지
	
	//결제내역페이지
	
	//금액설정
	
	//일정등록
	
	
}
