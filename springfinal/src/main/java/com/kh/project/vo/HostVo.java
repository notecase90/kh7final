package com.kh.project.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class HostVo {
	private int hostNo;
	private int hostMemberNo;
	private String hostIntro;
	private Date hostJoin;
	private int memberNo;
	private String memberName;
	private String memberId;	

}