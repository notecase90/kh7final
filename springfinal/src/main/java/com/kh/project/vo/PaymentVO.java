package com.kh.project.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor
@Data @Builder
public class PaymentVO {

	private int paymentReservationNo;
	private String paymentStatus;
	private Date paymentTime;
	private int memberNo;
	private String memberId;
	private String memberName;
	private Date reservationCheckin;
	private Date reservationCheckout;
	private int reservationGuest;
	private int reservationTotalAmount;
	private String roomName;
	private int roomHostNo; //호스트정보 조회용
	
}
