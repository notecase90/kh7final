package com.kh.project;

import static org.junit.Assert.assertNotNull;

import javax.mail.MessagingException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.project.entity.MemberDto;
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
public class Test02 {
	
	@Autowired
	private FindService findIdService;
	
	@Test
	public void test() throws MessagingException {
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberId("jun4451");
		memberDto.setMemberEmail("jun44151@naver.com");
		
		findIdService.findPw(memberDto);
		
	}
}
