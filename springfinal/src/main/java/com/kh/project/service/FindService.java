package com.kh.project.service;

import javax.mail.MessagingException;

import com.kh.project.entity.MemberDto;

public interface FindService{
	void findId(MemberDto memberDto) throws MessagingException;
	void findPw(MemberDto memberDto) throws MessagingException;
}
