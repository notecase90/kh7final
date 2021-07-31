package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.ReservationDto;
import com.kh.project.vo.ReservationVO;

public interface ReservationDao {
	void insert(ReservationDto reservationDto);
	int sequence();
	
	ReservationVO get(int reservationNo); //단일 조회
	void reservation(int reservationNo);
	void reservationCancel(int paymentReservationNo);
	
}
