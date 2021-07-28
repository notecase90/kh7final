package com.kh.project.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class MemberDto {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private Date memberBirth;
	private String memberEmail;
	private String memberPhone;
	private Date memberJoin;
	
}
