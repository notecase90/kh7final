package com.kh.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.entity.MemberDto;
import com.kh.project.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	

	//회원가입 
	@GetMapping("/regist")
	public String regist() {
		return "/member/regist"; //WEB-INF/views/member/regist.jsp
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute MemberDto memberDto) {
		memberDao.insert(memberDto);
		
		return "redirect:regist_success";
	}
	@GetMapping("/regist_success")
		public String registSuccess() {
		return "/member/registSuccess";
	}
	
	//로그인
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	@PostMapping("/login")
		public String login(@ModelAttribute MemberDto memberDto,HttpSession session) {
		MemberDto find = memberDao.login(memberDto);
		if(find !=null) { //성공
			session.setAttribute("memberNo", find.getMemberNo());
			return "redirect:login_success";
		}
		
		else { //실패
			return "redirect:login?error";
		}
	}
	@GetMapping("/login_success")
	public String loginSuccess() {
	return "/member/loginSuccess";
}
	//로그아웃
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.removeAttribute("memberNo");
			//session.invalidate();//세션 만료(사라짐)
			return "redirect:/";
		}
	//내 정보 변경(단일조회)
		@RequestMapping("/myinfo")
		public String myinfo(HttpSession session, Model model) {
			int memberNo = (int)session.getAttribute("memberNo");
			MemberDto memberDto = memberDao.get(memberNo);
			
			model.addAttribute("memberDto", memberDto);
			return "/member/myinfo";
			
		}
	
		//회원탈퇴(데이터를 받는게 없으니 get, request 둘 다 가능)
		@RequestMapping("/exit")
		public String exit(HttpSession session) {
			int memberNo = (int)session.getAttribute("memberNo");
			
			memberDao.delete(memberNo);
			session.removeAttribute("memberNo");
			
			return "redirect:/";
		}
		
		
}
