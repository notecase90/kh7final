package com.kh.project.repository;

import java.util.List;

import com.kh.project.entity.WishDto;
import com.kh.project.vo.WishVo;

public interface WishDao {
	void insert(WishDto wishDto);
	void delete(WishDto wishDto);
	boolean check(WishDto wishDto);
	List<WishVo> mywish(int memberNo);
}
