package com.kh.project.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.project.entity.EmailDto;
import com.kh.project.hostentity.HostDto;
import com.kh.project.repository.HostDao;
import com.kh.project.service.EmailService;


@Controller
@RequestMapping("/email")
public class EmailController {
	
	@Autowired
	private EmailService emailService;

	@Autowired
	private HostDao hostDao;
	
	// 이메일 입력
	@GetMapping("/certEmail")
	public String certEmail() {
		return "email/certEmail";
	}
	
	@PostMapping("/certEmail")
	public String certEmail(@RequestParam String email, RedirectAttributes attr) throws MessagingException {
		emailService.sendEmail(email);
		attr.addAttribute("email", email);
		return "redirect:certNo";
	}
	
	// 인증번호 입력 페이지
	@GetMapping("/certNo")
	public String certNo() {
		return "email/certNo";
	}
	
	@PostMapping("/certNo")
	public String certNo(@ModelAttribute EmailDto emailDto, RedirectAttributes attr) {
		boolean result = emailService.checkEmail(emailDto);
		if(result) {
			return "redirect:certSuccess";
		}
		else {
			// 인증실패 오류임을 알리고 이메일을 다시 전달
			attr.addAttribute("error", "");
			attr.addAttribute("email", emailDto.getEmail());
			return "redirect:certNo";
		}
	}
	
	// 인증성공 페이지
	@GetMapping("/certSuccess")
	public String certSuccess() {
		return "email/certSuccess";
	}
	
	@PostMapping("/certSuccess")
	public String certSuccess(@ModelAttribute HostDto hostDto) {
		hostDao.registHost(hostDto);
		return "redirect:/";
	}
	
}
