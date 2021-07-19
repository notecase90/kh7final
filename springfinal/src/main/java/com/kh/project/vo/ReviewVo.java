package com.kh.project.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewVo {
	private int reviewNo;
	private int reviewRoomNo;
	private String reviewContent;
	private int reviewStar;
	private Date reviewDate;
	private int reviewMember;
	
	private String roomName;
	private String memberName;
}
