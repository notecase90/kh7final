package com.kh.project.repository;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.web.multipart.MultipartFile;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityDto;
import com.kh.project.entity.FacilityOptionDto;
import com.kh.project.entity.FacilityVO;
import com.kh.project.entity.InFacilityDto;
import com.kh.project.entity.ReservationDto;
import com.kh.project.entity.RoomDto;
import com.kh.project.entity.RoomPriceDto;
import com.kh.project.entity.RoomPicDto;
import com.kh.project.entity.RoomTypeDto;
import com.kh.project.entity.RoomTypeVO;
import com.kh.project.vo.AlltypeSearchVo;
import com.kh.project.vo.DateVo;
import com.kh.project.vo.HostVo;
import com.kh.project.vo.PagingVo;
import com.kh.project.vo.ReviewVo;
import com.kh.project.vo.RoomVo;

public interface RoomDao {
	void insert(RoomDto roomDto);


	List<RoomDto> list(int hostNo); //호스트페이지에서 불러오기
	List<RoomVo> list();

	RoomDto detail(int roomNo);
	void edit(RoomDto roomDto);
	void delete(int roomNo);
	int sequence(); //roomNo 시퀀스 알아내기
	int count();
	
	List<FacilityOptionDto> facility(); //DB 저장되어있는 편의시설 리스트
	List<AllTypeDto> allType(); //DB에 저장되어있는 전체숙소종류 리스트
	
	void insert2(FacilityDto facilityDto); //편의시설 등록
	void insert3(InFacilityDto inFacilityDto); //내부시설 등록
	void insert4(RoomTypeDto roomTypeDto); //숙소종류 등록
	void insert5(RoomPriceDto roomPriceDto); //숙소가격 등록
	void insertComplete(RoomDto roomDto); //숙소등록 완료구분컬럼
	
	List<FacilityVO> facility(int roomNo); // 편의시설 불러오기(디테일페이지)
	InFacilityDto infacility(int inFacilityRoomNo); //내부시설 불러오기(디테일페이지)
	RoomTypeVO roomType(int roomNo);
	RoomPriceDto price(int roomOrigin); // 가격 불러오기
	List<ReviewVo> onelist(int roomNo); // 한숙소에 대한 리뷰목록 불러오기
	HostVo hostInfo(int roomNo); // 호스트정보 불러오기
	List<RoomVo> selectRoom(PagingVo vo);
	ReservationDto getReservation(int roomNo);
	
	RoomPicDto addPic(RoomPicDto roomPicDto);//
	void save(String fileName, MultipartFile file) throws IllegalStateException, IOException;
	
	RoomPicDto get(int roomPicNo);
	ByteArrayResource getPic(String fileName) throws IOException;
	List<RoomPicDto> preview(int roomNo);
	
	int getRoomPicNo(int roomNo); //roomNo로 업로드한 사진의 pk를 DB에서 조회해서 얻어옴
	List<RoomVo> searchAdd(String roomAdd);
	List<AlltypeSearchVo> searchList(String alltypeName);
	List<DateVo> searchDate(Date start, Date end);
}