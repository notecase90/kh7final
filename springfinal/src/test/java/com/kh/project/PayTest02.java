package com.kh.project;

import java.net.URISyntaxException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.project.kakaoPay.VO.KakaoPayApprovePrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayApproveVO;
import com.kh.project.kakaoPay.service.PayService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class PayTest02 {
	@Autowired
	@Qualifier("kakaoPayService")
	private PayService payService;
	
	@Test
	public void test() throws URISyntaxException {
		//카카오 결제 승인 요청
		KakaoPayApprovePrepareVO prepareVO = KakaoPayApprovePrepareVO.builder()
																	.tid("T2922187386592748541")
																	.partner_order_id("testOrderId")
																	.partner_user_id("testUserId")
																	.pg_token("1b269f32ec0b09005036")
																.build();
		KakaoPayApproveVO approveVO = payService.approve(prepareVO);
		log.debug("approveVO = {}", approveVO);
	}
}
