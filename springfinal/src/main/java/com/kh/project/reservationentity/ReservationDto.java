package com.kh.project.reservationentity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReservationDto {
	private int reservationNo;
	private int reservationMemberNo;
	private int reservationRoomNo;
	private String reservationState;	
	private Date reservationDate;
	private Date reservationCheckIn;
	private Date reservationCheckOut;
	private boolean checkPayment;

	
	
}
