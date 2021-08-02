package com.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.project.repository.MessageDao;
import com.kh.project.vo.ChatVo;
import com.kh.project.vo.MessageVo;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ChatController {
	@Autowired
	private MessageDao messageDao;
	@GetMapping("chat/main")
	public String chatMain(@ModelAttribute MessageVo messageVo, Model model) {			
		model.addAttribute("messageVo",messageVo.getChatName());
		return "chat/main";
	}
	@GetMapping("chat/{chatName}")
	public String chat(@PathVariable String chatName, Model model) {
		
		model.addAttribute("chatName",chatName);		
				
		return "chat/chat";
	}
	

}
