package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.RoomDto;
import com.kh.project.hostentity.HostDto;
import com.kh.project.vo.HostRoomVO;
import com.kh.project.vo.HostVo;

public interface HostDao {
	void registHost(HostDto hostDto);
	HostDto login(HostDto hostDto); 

	List<HostRoomVO> hostRoomList(int hostNo);

	HostVo check(HostVo hostVo);
	
	int reservationCount(RoomDto roomDto);

}
