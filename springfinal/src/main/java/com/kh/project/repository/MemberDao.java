package com.kh.project.repository;

import java.util.Map;

import com.kh.project.entity.MemberDto;

public interface MemberDao {
	void insert(MemberDto memberDto); //회원가입
	MemberDto login(MemberDto memberDto); //회원 로그인
	MemberDto get(int memberNo); //개인정보 상세보기
	boolean delete(int memberNo);
	boolean changePw (String curPw,int memberNo,String newPw);
	boolean changeInformation(MemberDto memberDto); //개인정보변경
}
