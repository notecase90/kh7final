package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityDto;
import com.kh.project.entity.FacilityOptionDto;
import com.kh.project.entity.FacilityVO;
import com.kh.project.entity.InFacilityDto;
import com.kh.project.entity.RoomDto;
import com.kh.project.entity.RoomPriceDto;
import com.kh.project.entity.RoomTypeDto;
import com.kh.project.entity.RoomTypeVO;

public interface RoomDao {
	void insert(RoomDto roomDto);
	List<RoomDto> list();
	RoomDto detail(int roomNo);
	void edit(RoomDto roomDto);
	void delete(int roomNo);
	int sequence(); //roomNo 시퀀스 알아내기
	
	List<FacilityOptionDto> facility(); //DB 저장되어있는 편의시설 리스트
	List<AllTypeDto> allType(); //DB에 저장되어있는 전체숙소종류 리스트
	
	void insert2(FacilityDto facilityDto); //편의시설 등록
	void insert3(InFacilityDto inFacilityDto); //내부시설 등록
	void insert4(RoomTypeDto roomTypeDto); //숙소종류 등록
	void insert5(RoomPriceDto roomPriceDto); //숙소가격 등록
	
	
	List<FacilityVO> facility(int roomNo); // 편의시설 불러오기(디테일페이지)
	InFacilityDto infacility(int inFacilityRoomNo); //내부시설 불러오기(디테일페이지)
	RoomTypeVO roomType(int roomNo);
	RoomPriceDto price(int roomOrigin); // 가격 불러오기
}
