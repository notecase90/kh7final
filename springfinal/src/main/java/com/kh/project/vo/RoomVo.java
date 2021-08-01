package com.kh.project.vo;

import com.kh.project.entity.RoomDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class RoomVo {
	private int roomNo;
	private int roomHostNo;
	private String roomName;
	private String roomIntro; //소개
	private String roomAdd; //주소
	private int roomCapa; //수용인원
	private String roomIn;
	private String roomOut;
	private int roomInsertComplete;
	private int facilityRoomNo;
	private int facilityOptionNo;
	private String optionName; //편의시설
	private int bedCount;
	private int bathCount;
	private int balconyCount;	
}
