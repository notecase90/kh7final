package com.kh.project.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.project.entity.EmailDto;
import com.kh.project.repository.EmailDao;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private EmailDao emailDao;

	@Autowired
	private RandomService randomService;
	
	@Override
	public void sendEmail(String email) throws MessagingException {
		// 인증번호
		String email_no = randomService.newCertification(6); 
		
		// 이메일 발송
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");
		
		helper.setTo(email);
		helper.setSubject("인증번호를 확인해주세요.");
		helper.setText("안녕하세요! 인증번호는 ["+email_no +"]입니다");
		
		// DB등록
		emailDao.insert(EmailDto.builder()
												.email(email)
												.emailNo(email_no)
											.build());
		sender.send(message);
	}

	@Override
	@Transactional
	public boolean checkEmail(EmailDto emailDto) {
		boolean result = emailDao.check(emailDto);
		if(result) {
			emailDao.deleteByEmail(emailDto.getEmail());
		}
		return result;
	}
	
	
	
}
