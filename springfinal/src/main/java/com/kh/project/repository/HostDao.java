package com.kh.project.repository;

import com.kh.project.hostentity.HostDto;
import com.kh.project.vo.HostVo;

public interface HostDao {
	void registHost(HostDto hostDto);
	HostDto login(HostDto hostDto); 
	HostVo check(HostVo hostVo);
}
