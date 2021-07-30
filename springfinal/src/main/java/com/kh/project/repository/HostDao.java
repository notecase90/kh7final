package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.RoomDto;
import com.kh.project.hostentity.HostDto;

public interface HostDao {
	void registHost(HostDto hostDto);
	HostDto login(HostDto hostDto); 
	List<RoomDto> hostRoomList(int hostNo);
}
