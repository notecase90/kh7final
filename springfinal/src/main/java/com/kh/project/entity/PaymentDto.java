package com.kh.project.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor
@Data @Builder
public class PaymentDto {
	private int paymentReservationNo;
	private String paymentTid;
	private int paymentMemberNo;
	private String paymentStatus;
	private Date paymentTime;
}
