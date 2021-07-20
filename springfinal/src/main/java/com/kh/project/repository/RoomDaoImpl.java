package com.kh.project.repository;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityDto;
import com.kh.project.entity.FacilityOptionDto;
import com.kh.project.entity.FacilityVO;
import com.kh.project.entity.InFacilityDto;
import com.kh.project.entity.RoomDto;
import com.kh.project.entity.RoomPriceDto;
import com.kh.project.entity.RoomPicDto;
import com.kh.project.entity.RoomTypeDto;
import com.kh.project.entity.RoomTypeVO;

@Repository
public class RoomDaoImpl implements RoomDao {

	@Autowired 
	private SqlSession sqlSession;
	
	private final File baseDir = new File("D:/upload/room");
	
	@Override
	public void insert(RoomDto roomDto) {
		sqlSession.insert("room.insert", roomDto);
	}

	@Override
	public List<RoomDto> list() {
		return sqlSession.selectList("room.list");
	}

	@Override
	public RoomDto detail(int roomNo) {
		return sqlSession.selectOne("room.detail", roomNo);
	}
	
	@Override
	public void edit(RoomDto roomDto) {
		sqlSession.update("room.edit", roomDto);
	}

	@Override
	public void delete(int roomNo) {
		sqlSession.delete("room.delete", roomNo);
	}

	@Override
	public List<FacilityOptionDto> facility() {
		return sqlSession.selectList("room.facility");
	}

	@Override
	public void insert2(FacilityDto facilityDto) {
		sqlSession.insert("room.insert2",facilityDto);	
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("room.sequence");
	}

	@Override
	public List<FacilityVO> facility(int roomNo) {
		return sqlSession.selectList("room.facilityDetail", roomNo);
	}

	@Override
	public void insert3(InFacilityDto inFacilityDto) {
		sqlSession.insert("room.insert3",inFacilityDto);	
	}

	@Override
	public InFacilityDto infacility(int inFacilityRoomNo) {
		return sqlSession.selectOne("room.infacilityDetail",inFacilityRoomNo);
	}

	@Override
	public List<AllTypeDto> allType() {
		return sqlSession.selectList("room.allType");
	}

	@Override
	public void insert4(RoomTypeDto roomTypeDto) {
		sqlSession.insert("room.insert4",roomTypeDto);
	}

	@Override
	public RoomTypeVO roomType(int roomNo) {
		return sqlSession.selectOne("room.roomTypeDetail",roomNo);
	}

	@Override
	public void insert5(RoomPriceDto roomPriceDto) {
		sqlSession.insert("room.insert5", roomPriceDto);
	}

	@Override
	public RoomPriceDto price(int roomOrigin) {
		return sqlSession.selectOne("room.roomPriceDetail", roomOrigin);
	}

	public RoomPicDto addPic(RoomPicDto roomPicDto) {
		int roomPicNo = sqlSession.selectOne("room.picSequence");
		roomPicDto.setRoomPicNo(roomPicNo);
		roomPicDto.setRoomPicSaveName(String.valueOf(roomPicNo));
		sqlSession.insert("room.addPic",roomPicDto);
		return roomPicDto;
	}

	@Override
	public void save(String fileName, MultipartFile file) throws IllegalStateException, IOException {
		File target = new File(baseDir,fileName);
		file.transferTo(target);
	}

	@Override
	public RoomPicDto get(int roomPicNo) {
		return sqlSession.selectOne("room.getPic",roomPicNo);
	}

	@Override
	public ByteArrayResource getPic(String fileName) throws IOException {
		File target = new File(baseDir,fileName);
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		return resource;
	}

}
