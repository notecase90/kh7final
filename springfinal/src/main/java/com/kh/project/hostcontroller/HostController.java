package com.kh.project.hostcontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.project.entity.RoomDto;
import com.kh.project.entity.RoomPicDto;
import com.kh.project.repository.HostDao;
import com.kh.project.repository.PaymentDao;
import com.kh.project.repository.RoomDao;
import com.kh.project.vo.HostRoomVO;
import com.kh.project.vo.PaymentVO;


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
	
	@Autowired
	private RoomDao roomDao;
	
	//숙소내역 페이지
	@GetMapping("/hostRoomList")
	public String hostRoomList(HttpSession session, Model model) {
		
		int hostNo = (int)session.getAttribute("hostNo");

		List<HostRoomVO> hostReservationList = hostDao.hostRoomList(hostNo);
		List<RoomDto> hostRoomList = roomDao.list(hostNo);
		
		ArrayList<Integer> hostRoomPicNo = new ArrayList<>();
		for(int i=0;i<hostRoomList.size(); i++) {		
			hostRoomPicNo.add(i, roomDao.getRoomPicNo(hostRoomList.get(i).getRoomNo()));
		}
		model.addAttribute("HostRoomPicNo",hostRoomPicNo);
		model.addAttribute("HostRoomList",hostRoomList);
		model.addAttribute("HostReservationList",hostReservationList);
		
		return "host/hostRoomList";
	}
	
	@Autowired
	private PaymentDao paymentDao;
	
	//예약내역 페이지
	@GetMapping("/hostReservationDetail")
	public String hostReservationDetail(
			@RequestParam int roomNo,
			Model model
			) {
		
		List<PaymentVO> reservationList = paymentDao.list2(roomNo);
		
		model.addAttribute("ReservationList",reservationList);
		
		return "host/hostReservationDetail";
	}
	
	//메세지 페이지
	
	//결제내역페이지
	
	//금액설정
	
	//일정등록
	
	
}
