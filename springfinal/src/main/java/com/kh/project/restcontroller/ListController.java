package com.kh.project.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityOptionDto;
import com.kh.project.entity.WishDto;
import com.kh.project.repository.AllTypeDao;
import com.kh.project.repository.MessageDao;
import com.kh.project.repository.WishDao;
import com.kh.project.vo.MessageVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ListController {
	@Autowired
	private AllTypeDao allTypeDao = null;
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private WishDao wishDao = null;
	
	@GetMapping("type-list")
	public List<AllTypeDto> typeList() {
		return allTypeDao.list();
	}
	@GetMapping("option-list")
	public List<FacilityOptionDto> listOption(){
		return allTypeDao.listOption();
	}
	
	
	@GetMapping("wish-insert")
	public void wishInsert(@RequestParam int roomNo, HttpSession session) {
		WishDto wishDto = WishDto.builder().memberNo((int)session.getAttribute("memberNo"))
										   .roomNo(roomNo).build();
		
		wishDao.insert(wishDto);
	}
	@GetMapping("wish-delete")
	public void wishDelete(@RequestParam int roomNo, HttpSession session) {
		WishDto wishDto = WishDto.builder().memberNo((int)session.getAttribute("memberNo"))
										   .roomNo(roomNo).build();
		log.info("삭제");	
		wishDao.delete(wishDto);
	
		
	}
	
	@GetMapping("wish-check")
	public boolean wishCheck(@RequestParam int roomNo, HttpSession session) {
		WishDto wishDto = WishDto.builder().memberNo((int)session.getAttribute("memberNo"))
				   						   .roomNo(roomNo).build();

		return wishDao.check(wishDto);
	
	}
	@GetMapping("message-list")
	public List<MessageVo> list(@RequestParam String chatName){
		
		return messageDao.list(chatName);
	}
}
