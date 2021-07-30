package com.kh.project.hostcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.entity.RoomDto;
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
	
	@Autowired
	private HostDao hostDao;
	
	//숙소내역 페이지
	@GetMapping("/hostRoomList")
	public String hostRoomList(HttpSession session, Model model) {
		
		int hostNo = (int)session.getAttribute("hostNo");
		
		List<RoomDto> hostRoomList = hostDao.hostRoomList(hostNo);
		model.addAttribute("HostRoomList",hostRoomList);
		
		return "host/hostRoomList";
	}
	
	//메세지 페이지
	
	//결제내역페이지
	
	//금액설정
	
	//일정등록
	
	
}
