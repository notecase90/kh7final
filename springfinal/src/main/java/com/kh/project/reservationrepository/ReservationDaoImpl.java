package com.kh.project.reservationrepository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.reservationentity.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	@Autowired
	private SqlSession sqlSession = null;
	@Override
	public void insert(ReservationDto reservationDto) {
		sqlSession.insert("reservation.insert",reservationDto);
	}

}
