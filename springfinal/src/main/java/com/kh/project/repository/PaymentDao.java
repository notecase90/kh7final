package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.PaymentDto;
import com.kh.project.vo.PaymentVO;

public interface PaymentDao {
	
	void ready(PaymentDto paymentDto); //결제 준비단계
	void approve(int paymentReservationNo); //결제 승인
	PaymentVO detail(int paymentNo); //결제정보 확인
	void cancel(int paymentNo);
	PaymentDto get(int paymentNo);
	List<PaymentVO> list(int memberNo);
}
