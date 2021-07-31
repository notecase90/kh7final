package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.ReviewDto;
import com.kh.project.entity.RoomDto;
import com.kh.project.vo.ReviewVo;

public interface ReviewDao {
	// 리뷰 등록 
	void insertReview(ReviewDto reviewDto);
	// 모든 리뷰 목록
	List<ReviewDto> list();
	// 상세보기
	ReviewVo detail(int reviewNo);
	// 리뷰 수정
	void edit(ReviewDto reviewDto);
	// 한숙소에 대한 리뷰목록
	List<ReviewVo> onelist(int roomNo);
	// 리뷰 삭제
	void delete(int reviewNo);
}
