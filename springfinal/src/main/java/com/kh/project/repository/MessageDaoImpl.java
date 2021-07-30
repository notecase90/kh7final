package com.kh.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.ChatVo;
import com.kh.project.vo.MessageVo;

@Repository
public class MessageDaoImpl implements MessageDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MessageVo messageVo) {
		sqlSession.insert("message.insert",messageVo);
		
	}
	@Override
	public List<MessageVo> list(String chatName) {
		return sqlSession.selectList("message.select",chatName);
		
	}
	@Override
	public boolean delete(String chatName) {
		int count = sqlSession.delete("message.delete",chatName);
		return count>0;
	}
	
}
