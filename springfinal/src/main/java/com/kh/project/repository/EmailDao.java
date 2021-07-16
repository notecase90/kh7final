package com.kh.project.repository;

import com.kh.project.entity.EmailDto;

public interface EmailDao {
	void insert(EmailDto emailDto);
	boolean check(EmailDto emailDto); //이메일과 인증번호
	void deleteByEmail(String email);
}
