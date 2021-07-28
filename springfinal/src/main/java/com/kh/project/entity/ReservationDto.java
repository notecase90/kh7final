package com.kh.project.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor
@Data @Builder
public class ReservationDto {
	private int reservationNo;
	private int reservationMemberNo;
	private int reservationRoomNo;
	private String reservationState;
	private Date reservationDate;
	private Date reservationCheckin;
	private Date reservationCheckout;
	private int reservationGuest;
	private int reservationTotalAmount;
}
