package com.kh.project.hostentity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class HostDto {
	private int hostNo;
	private int hostMemberNo;
	private String hostIntro;
	private Date hostJoin;
}
