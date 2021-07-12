package com.kh.project.repository;

import com.kh.project.entity.MemberDto;

public interface MemberDao {
	void insert(MemberDto memberDto); //회원가입
	MemberDto login(MemberDto memberDto); //회원 로그인
	MemberDto get(int memberNo); //개인정보 상세보기
	boolean delete(int memberNo);

}
