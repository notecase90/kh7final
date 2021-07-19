package com.kh.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.ReviewDto;
import com.kh.project.entity.RoomDto;
import com.kh.project.vo.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertReview(ReviewDto reviewDto) {
		sqlSession.insert("review.insert", reviewDto);
	}

	@Override
	public ReviewVo detail(int reviewRoomNo) {		
		return sqlSession.selectOne("review.detail", reviewRoomNo);
	}

	@Override
	public void edit(ReviewDto reviewDto) {
		sqlSession.update("review.edit", reviewDto);
	}

	@Override
	public List<ReviewDto> onelist(int roomNo) {
		return sqlSession.selectList("review.onelist", roomNo);
	}

	@Override
	public List<ReviewDto> list() {
		return sqlSession.selectList("review.list");
	}

	@Override
	public void delete(int reviewNo) {
		sqlSession.delete("review.delete", reviewNo);
	}
	

}
