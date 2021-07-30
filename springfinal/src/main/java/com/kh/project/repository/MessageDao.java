package com.kh.project.repository;

import java.util.List;

import com.kh.project.vo.ChatVo;
import com.kh.project.vo.MessageVo;

public interface MessageDao {
	void insert(MessageVo messageVo);
	List<MessageVo> list(String chatName);
	boolean delete(String chatName);
}
