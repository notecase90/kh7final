package com.kh.project;

import static org.junit.Assert.assertNotNull;

import javax.mail.MessagingException;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.project.entity.MemberDto;
import com.kh.project.entity.WishDto;
import com.kh.project.repository.WishDao;
import com.kh.project.service.FindService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
}
)
@WebAppConfiguration
@Slf4j
public class Test3 {
	
	@Autowired
	private SqlSession sqlSeesion;
	@Autowired
	private WishDao wishDao;
	
//	@Test
//	public void test()  {
//		WishDto wishDto = WishDto.builder().memberNo(43).roomNo(61).build();
//			
//		wishDao.insert(wishDto);
//		
//	}
	@Test
	public void test1() {
		WishDto wishDto = WishDto.builder().memberNo(43).roomNo(61).build();
		
		wishDao.delete(wishDto);
	}
}
