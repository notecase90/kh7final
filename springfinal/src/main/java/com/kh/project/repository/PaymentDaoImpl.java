package com.kh.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.PaymentDto;
import com.kh.project.vo.PaymentVO;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void ready(PaymentDto paymentDto) {
		sqlSession.insert("payment.ready",paymentDto);
	}

	@Override
	public void approve(int paymentReservationNo) {
		sqlSession.update("payment.approve",paymentReservationNo);
	}

	@Override
	public PaymentVO detail(int paymentNo) {
		return sqlSession.selectOne("payment.detail",paymentNo);
	}

	@Override
	public void cancel(int paymentNo) {
		sqlSession.update("payment.cancel",paymentNo);
	}

	@Override
	public PaymentDto get(int paymentNo) {
		return sqlSession.selectOne("payment.get",paymentNo);
	}

	@Override
	public List<PaymentVO> list(int memberNo) {
		return sqlSession.selectList("payment.list",memberNo);
	}

}
