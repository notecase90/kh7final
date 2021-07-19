package com.kh.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			session.invalidate();//세션 만료(사라짐)
			return "redirect:/";
		}
	//내 정보 조회(단일조회)
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
		//비밀번호 변경
		@GetMapping("change_pw")
		public String change_pw() {
			return "member/change_pw"; //WEB-INF/views/member/change_pw.jsp
		}
		
		
		@PostMapping("change_pw")
		public String change_pw(
						HttpSession session,
						@RequestParam String curPw,
						@RequestParam String newPw
							) {
			
			int memberNo = (int)session.getAttribute("memberNo"); 
			boolean result = memberDao.changePw(curPw,memberNo,newPw);
			if(result) {
				return "redirect:/member/myinfo";
					
			}
			else {
				return "redirect:change_pw?error";
				
			}
			
		}
		//개인정보 변경
				@GetMapping("/change_info")
				public String change_info(HttpSession session, Model model) {
					int memberNo = (int)session.getAttribute("memberNo");
					MemberDto memberDto = memberDao.get(memberNo);
					
					model.addAttribute("memberDto", memberDto);
					
					return "member/changeInfo"; //WEB-INF/views/member/changeInfo.jsp
				}
				
				@PostMapping("/change_info")
				public String change_info(@ModelAttribute MemberDto memberDto,
						HttpSession session) {
					int memberNo = (int)session.getAttribute("memberNo");
					memberDto.setMemberNo(memberNo);
					
					boolean result=memberDao.changeInformation(memberDto);
					if(result) {
						return "redirect:/member/myinfo";
					}
					else {
						return "redirect:change_info?error";
					}
				}
		
				//아이디 중복검사
				@ResponseBody
				@PostMapping("/test3")
				public String test3(
						@RequestParam String memberId) {
					
//					테스트실행
//					if(memberId.equals("admin1234")) return "N";
//					else return "Y";
					
//					실제 파라미터값 적용
//					데이터베이스에 존재하면 사용 중, 아니면 가능
//					boolean이라서 if/else 로 적용
//					그럼 일반 Dto에 get은 뭘로 적용??
					if(memberDao.exits(memberId)) return "N";
					else return "Y";
					
				}
				
				
				
				
}
