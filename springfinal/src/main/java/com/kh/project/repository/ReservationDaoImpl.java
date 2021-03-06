package com.kh.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.ReservationDto;
import com.kh.project.vo.ReservationVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ReservationDto reservationDto) {
		sqlSession.insert("reservation.insert",reservationDto);
	}

	@Override
	public ReservationVO get(int reservationNo) {
		return sqlSession.selectOne("reservation.get",reservationNo);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("reservation.sequence");
	}

	@Override
	public void reservation(int reservationNo) {
		sqlSession.update("reservation.reservation",reservationNo);	
	}

	@Override
	public void reservationCancel(int paymentReservationNo) {
		sqlSession.update("reservation.reservationCancel",paymentReservationNo);
		
	}

	@Override
	public void autoDelete() {
		sqlSession.delete("reservation.autoDelete");
	}

	@Override
	public List<ReservationDto> getDate(int reservationRoomNo) {
		return sqlSession.selectList("reservation.reservationDate",reservationRoomNo);
	}

	

}
