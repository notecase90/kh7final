package com.kh.project;

import java.net.URISyntaxException;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.project.kakaoPay.VO.KakaoPayReadyPrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayReadyVO;
import com.kh.project.kakaoPay.service.PayService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
}
)
@WebAppConfiguration
@Slf4j
public class PayTest01 {
	
	@Autowired
	@Qualifier("kakaoPayService")
	private PayService payService;
	
	@Test
	public void test() throws URISyntaxException {
		//카카오 결제 준비 요청
		KakaoPayReadyPrepareVO prepareVO = KakaoPayReadyPrepareVO.builder()
																.partner_order_id("testOrderId")
																.partner_user_id("testUserId")
																.item_name("카카오 결제 테스트")
																.quantity(1)
																.total_amount(500000)
																//.tax_free_amount(0)
															.build();
		KakaoPayReadyVO readyVO = payService.ready(prepareVO);
		log.debug("readyVO = {}", readyVO);
	}
}
