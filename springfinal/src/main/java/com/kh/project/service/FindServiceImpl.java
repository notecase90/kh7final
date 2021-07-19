package com.kh.project.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.project.entity.MemberDto;
import com.kh.project.repository.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FindServiceImpl implements FindService{
	@Autowired
	private JavaMailSender sender = null;
	
	@Autowired
	private MemberDao memberDao = null;
	
	@Override
	public void findId(MemberDto memberDto) throws MessagingException {
	MemberDto memberId = memberDao.findId(memberDto);
			
	MimeMessage message = sender.createMimeMessage();
	MimeMessageHelper helper = new MimeMessageHelper(message,false,"UTF-8");
	

		helper.setTo(memberDto.getMemberEmail());
		helper.setSubject("찾으시는아이디");
		helper.setText(memberId.getMemberId());
		
		sender.send(message);
	
	}
		


	@Override
	public void findPw(MemberDto memberDto) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message,false,"UTF-8");
		MemberDto checkId = memberDao.checkId(memberDto);
		MemberDto checkEmail = memberDao.checkEmail(memberDto);
			
			if(checkId == null) {
				log.info("아이디가틀렸음");
			}
			else if(checkEmail == null) {
				log.info("이메일이틀렸음");
			}
			else {
				String pw ="";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				memberDto.setMemberPw(pw);
				memberDao.findPw(memberDto);
				log.info("메일전송");
			}
			
			
			
		
		helper.setTo(memberDto.getMemberEmail());
		helper.setSubject("비밀번호");
		helper.setText(memberDto.getMemberPw());
		
		sender.send(message);
		}
	}

