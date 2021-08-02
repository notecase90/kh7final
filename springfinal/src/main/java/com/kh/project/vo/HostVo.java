package com.kh.project.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HostVo {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private Date memberBirth;
	private String memberEmail;
	private String memberPhone;
	private Date memberJoin;
	
	private int hostNo;
}
