package com.kh.project.service;

import javax.mail.MessagingException;

import com.kh.project.entity.EmailDto;

public interface EmailService {
	// 인증번호 발송 기능
	// 준비물 : 수신자 이메일
	void sendEmail(String email) throws MessagingException;

	// 인증번호 검사 기능
	// 준비물 : CertDto
	boolean checkEmail(EmailDto emailDto);
}
