package com.kh.project.repository;

import com.kh.project.entity.ReservationDto;
import com.kh.project.vo.ReservationVO;

public interface ReservationDao {
	void insert(ReservationDto reservationDto);
	int sequence();
	
	ReservationVO get(int reservationNo);
	void reservation(int reservationNo);
	
}
