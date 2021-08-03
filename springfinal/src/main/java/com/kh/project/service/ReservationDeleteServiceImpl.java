package com.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.project.repository.ReservationDao;

@Service
public class ReservationDeleteServiceImpl implements ReservationDeleteService {

	@Autowired
	private ReservationDao reservationDao;
	
	@Scheduled(cron = "0 0 12 * * *")  //매일 12시정각.
	@Override
	public void reservationDelete() {
		reservationDao.autoDelete();
	}

	
}
