package com.kh.project.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.project.entity.FacilityDto;
import com.kh.project.entity.InFacilityDto;
import com.kh.project.entity.ReservationDto;
import com.kh.project.entity.RoomDto;
import com.kh.project.entity.RoomPriceDto;
import com.kh.project.entity.RoomTypeDto;
import com.kh.project.repository.HostDao;
import com.kh.project.repository.ReservationDao;
import com.kh.project.repository.RoomDao;
import com.kh.project.vo.AlltypeSearchVo;
import com.kh.project.vo.DateVo;
import com.kh.project.vo.RoomVo;

@Controller
@RequestMapping("room")
public class RoomController {
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private HostDao hostDao;
	
	// 숙소등록
	@GetMapping("/insert_start")
	public String insert_start() {
		return "room/insertStart";
	}
	@GetMapping("/insert")
	public String insert() {
		return "room/insert";
	}
	@GetMapping("/insert2")
	public String insert2() {
		return "room/insert2";
	}
	@GetMapping("/insert3")
	public String insert3() {
		return "room/insert3";
	}
	@GetMapping("/insert4")
	public String insert4() {
		return "room/insert4";
	}
	@GetMapping("/insert5")
	public String insert5() {
		return "room/insert5";
	}
	@GetMapping("/insert6")
	public String insert6() {
		return "room/insert6";
	}
	

	@PostMapping("/insert")
	public String insert(
			@ModelAttribute RoomDto roomDto,
			HttpSession session
			) {
		int roomNo = roomDao.sequence();
		session.setAttribute("roomNo", roomNo);
		roomDto.setRoomNo(roomNo);
		roomDao.insert(roomDto);
		return "redirect:insert2";
	}
	@PostMapping("/insert2")
	public String insert2(
			@ModelAttribute FacilityDto facilityDto,
			HttpSession session) {
		int roomNo = (int)session.getAttribute("roomNo");
		facilityDto.setRoomNo(roomNo);
		roomDao.insert2(facilityDto);
		return "redirect:insert3";
	}
	@PostMapping("/insert3")
	public String insert3(
			@ModelAttribute InFacilityDto inFacilityDto,
			HttpSession session
			) {
		int roomNo = (int)session.getAttribute("roomNo");
		inFacilityDto.setInFacilityRoomNo(roomNo);
		roomDao.insert3(inFacilityDto);
		return "redirect:insert4";
	}
	@PostMapping("/insert4")
	public String insert4(
			@ModelAttribute RoomTypeDto roomTypeDto,
			HttpSession session) {
		int roomNo = (int)session.getAttribute("roomNo");
		roomTypeDto.setRoomTypeRoomNo(roomNo);
		roomDao.insert4(roomTypeDto);
		return "redirect:insert5";
	}
	@PostMapping("/insert5")
	public String insert5(
			@ModelAttribute RoomPriceDto roomPriceDto,
			HttpSession session) {
		int roomNo= (int)session.getAttribute("roomNo");
		roomPriceDto.setRoomOrigin(roomNo);
		roomDao.insert5(roomPriceDto);
		return "redirect:insert6";
	}
	
	
	@GetMapping("/insert_success")
	public String insertSuccess(HttpSession session) {
		int roomNo = (int)session.getAttribute("roomNo");
		RoomDto roomDto = RoomDto.builder()
								.roomNo(roomNo)
								.roomInsertComplete(1)
							.build();
		roomDao.insertComplete(roomDto);
		return "room/insertSuccess";
	}
	
	// 숙소명 리스트
	@GetMapping("/list")
	public String list(Model model) {
		
		List<RoomVo> roomList = roomDao.list();
		
		ArrayList<Integer> roomPicNo = new ArrayList<>();
		for(int i=0;i<roomList.size();i++) {
			roomPicNo.add(i,roomDao.getRoomPicNo(roomList.get(i).getRoomNo()));
		}
		model.addAttribute("list", roomList);
		model.addAttribute("roomPicNo",roomPicNo);
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
		model.addAttribute("facilityList", roomDao.facility(roomNo));
		model.addAttribute("infacilityDto",roomDao.infacility(roomNo));
		model.addAttribute("roomTypeVO",roomDao.roomType(roomNo));
		model.addAttribute("roomPriceDto",roomDao.price(roomNo));
		model.addAttribute("reviewVo",roomDao.onelist(roomNo));
		model.addAttribute("hostVo", roomDao.hostInfo(roomNo));
		model.addAttribute("roomPicDto",roomDao.preview(roomNo));
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
	
	@Autowired
	private ReservationDao reservationDao;
	
	@PostMapping("/detail")
	public String reservation(
			@ModelAttribute ReservationDto reservationDto,
			HttpSession session
			) {
		int memberNo = (int)session.getAttribute("memberNo");
		reservationDto.setReservationMemberNo(memberNo);
		
		int reservationNo = reservationDao.sequence();
		reservationDto.setReservationNo(reservationNo);
		
		reservationDao.insert(reservationDto);
		return "redirect:/reservation/reservation?reservationNo="+reservationDto.getReservationNo();
	}
	
	//지역별 목록
	@GetMapping("/list/{roomAdd}")
	public String search(@PathVariable String roomAdd,Model model) {
		
		List<RoomVo> roomList = roomDao.searchAdd(roomAdd);		
		
		ArrayList<Integer> roomPicNo = new ArrayList<>();
		for(int i=0;i<roomList.size();i++) {
			roomPicNo.add(i,roomDao.getRoomPicNo(roomList.get(i).getRoomNo()));
		}
		model.addAttribute("list", roomList);
		model.addAttribute("roomPicNo",roomPicNo);
		return "room/roomList2";
	}
	//숙소별 목록
	@GetMapping("/search-type/{alltypeName}")
	public String searchType(@PathVariable String alltypeName,Model model) {
				
		List<AlltypeSearchVo> roomList = roomDao.searchList(alltypeName);		
		
		ArrayList<Integer> roomPicNo = new ArrayList<>();
		for(int i=0;i<roomList.size();i++) {
			roomPicNo.add(i,roomDao.getRoomPicNo(roomList.get(i).getRoomNo()));
		}
		model.addAttribute("search", roomList);
		model.addAttribute("roomPicNo",roomPicNo);
		return "room/search-type";
	}
	@GetMapping("search-date")
	public String searchDate(@RequestParam Date start,@RequestParam Date end,Model model) {
//		int count = roomDao.searchDate(start, end);
		List<DateVo> roomList = roomDao.searchDate(start, end);
		
		ArrayList<Integer> roomPicNo = new ArrayList<>();
		for(int i =0;i<roomList.size(); i++) {
			if(roomList.size() == 0) {
				model.addAttribute("searchDate",roomList);
				roomPicNo.add(i,roomDao.getRoomPicNo(roomList.get(i).getRoomNo()));
			}
		}
		
		return "room/search-date";
	}
		
}
