package com.kh.project.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class RoomDto {
	private int roomNo;
	private int roomHostNo;
	private String roomName;
	private String roomIntro; //소개
	private String roomAdd; //주소
	private int roomCapa; //수용인원
	private String roomIn;
	private String roomOut;
	private int roomInsertComplete;
}
