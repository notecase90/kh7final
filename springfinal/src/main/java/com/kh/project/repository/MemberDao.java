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
	MemberDto idCheck(String memberId); //회원가입시 아이디 중복 확인 -1
	boolean exits(String memberId); //회원가입시 아이디 중복 확인-2

	MemberDto findId(MemberDto memberDto);
	boolean findPw(MemberDto memberDto);
	int checkId(MemberDto memberDto);
	int checkEmail(MemberDto memberDto);
	int checkName(MemberDto memberDto);

	boolean emailCheck(String memberEmail); //회원가입시 이메일 중복 체크

}
