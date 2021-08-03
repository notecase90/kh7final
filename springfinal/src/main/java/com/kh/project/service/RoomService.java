package com.kh.project.service;

import java.util.List;

import com.kh.project.vo.PagingVo;
import com.kh.project.vo.RoomVo;

public interface RoomService {
	public int count();
	public List<RoomVo> selectBoard(PagingVo vo);
}
