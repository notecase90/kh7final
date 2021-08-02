package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.AdminDto;
import com.kh.project.entity.GongjiDto;
import com.kh.project.vo.GongjiVo;
import com.kh.project.vo.HostVo;

public interface AdminDao {
	AdminDto login(AdminDto adminDto);
	void insertGongji(GongjiDto gongjiDto);
	List<GongjiVo> list();
	List<HostVo> hostList();
}
