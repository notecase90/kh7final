package com.kh.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.entity.WishDto;
import com.kh.project.vo.WishVo;

@Repository
public class WishDaoImpl implements WishDao{
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void insert(WishDto wishDto) {
		sqlSession.insert("wish.insert",wishDto);
		
	}

	@Override
	public void delete(WishDto wishDto) {
		sqlSession.delete("wish.delete",wishDto);
	
	}

	@Override
	public boolean check(WishDto wishDto) {
		return sqlSession.selectOne("wish.check",wishDto) != null;
		
	}

	@Override
	public List<WishVo> mywish(int memberNo) {
		return sqlSession.selectList("wish.mywish",memberNo);
		
	}
}
