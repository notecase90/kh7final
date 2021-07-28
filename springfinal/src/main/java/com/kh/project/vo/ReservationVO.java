package com.kh.project.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor
@Data @Builder
public class ReservationVO {  //reservationDetail view 전용
	private int reservationNo;
	private int reservationMemberNo;
	private Date reservationDate;
	private Date reservationCheckin;
	private Date reservationCheckout;
	private int reservationGuest;
	private int reservationTotalAmount;
	private int roomHostNo; //호스트 정보 불러올때 DB조회용으로 남겨둠
	private String roomName;
	private String roomIntro;
	private String roomAdd;
	private int roomCapa;
	private String roomIn;
	private String roomOut;
}
