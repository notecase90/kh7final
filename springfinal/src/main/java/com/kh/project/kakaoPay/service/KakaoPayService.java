package com.kh.project.kakaoPay.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.project.entity.PaymentDto;
import com.kh.project.kakaoPay.VO.KakaoPayApprovePrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayApproveVO;
import com.kh.project.kakaoPay.VO.KakaoPayCancelPrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayCancelVO;
import com.kh.project.kakaoPay.VO.KakaoPayReadyPrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayReadyVO;
import com.kh.project.repository.PaymentDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayService implements PayService{

	@Autowired
	private PaymentDao paymentDao;
	
	//사업자 번호, Admin Key는 절대로 변하지 않는다
	public static final String cid = "TC0ONETIME";
	public static final String adminKey = "1cdcc23bdca405bd9514f6cef18e9acf";
	public static final String kakaoAk = "KakaoAK " + adminKey;
	public static final String contentType = "application/x-www-form-urlencoded;charset=utf-8";

	@Override
	public KakaoPayReadyVO ready(KakaoPayReadyPrepareVO kakaoPayReadyPrepareVO) throws URISyntaxException {
	
	
		RestTemplate template = new RestTemplate();
		
	
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", kakaoAk);
		headers.add("Content-type", contentType);
		
	
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", cid);//가맹점ID(사업자 제휴 시 발급, 테스트용 ID 사용)
		body.add("partner_order_id", kakaoPayReadyPrepareVO.getPartner_order_id());//판매자 구분 ID
		body.add("partner_user_id", kakaoPayReadyPrepareVO.getPartner_user_id());//구매자 구분 ID
		body.add("item_name", kakaoPayReadyPrepareVO.getItem_name());//명세서에 표시될 구매 내역(다건 구매일 경우 ???외 ?건 형식)
		body.add("quantity", String.valueOf(kakaoPayReadyPrepareVO.getQuantity()));//구매수량
		body.add("total_amount", String.valueOf(kakaoPayReadyPrepareVO.getTotal_amount()));//총 구매금액
		body.add("tax_free_amount", String.valueOf(kakaoPayReadyPrepareVO.getTax_free_amount()));//면세금액(없으면 0)
		
		//ServletUriComponentsBuilder 계산
		//String path = "http://localhost:8080/컨텍스트패스";
		String path = ServletUriComponentsBuilder.fromCurrentContextPath().port(8080).toUriString();
//		System.out.println("path = " + path);

		body.add("approval_url", path +"/pay/success");//사용자 결제 성공시 신호를 받을 주소
		body.add("cancel_url", path + "/pay/cancel");//사용자 결제 취소시 신호를 받을 주소
		body.add("fail_url", path + "/pay/fail");//사용자 결제 실패시 신호를 받을 주소
		
		
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
	
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		
	
		KakaoPayReadyVO readyVO = template.postForObject(uri, entity, KakaoPayReadyVO.class);
		
		
		PaymentDto paymentDto = PaymentDto.builder()
										.paymentReservationNo(Integer.parseInt(kakaoPayReadyPrepareVO.getPartner_order_id()))
										.paymentTid(readyVO.getTid())
										.paymentMemberNo(Integer.parseInt(kakaoPayReadyPrepareVO.getPartner_user_id()))										
									.build();
		paymentDao.ready(paymentDto);
		
		readyVO.setPartner_order_id(kakaoPayReadyPrepareVO.getPartner_order_id());
		readyVO.setPartner_user_id(kakaoPayReadyPrepareVO.getPartner_user_id());
		return readyVO;
	}

	@Override
	public KakaoPayApproveVO approve(KakaoPayApprovePrepareVO kakaoPayApprovePrepareVO) throws URISyntaxException {

		RestTemplate template = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", kakaoAk);
		headers.add("Content-type", contentType);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", cid);
		body.add("tid", kakaoPayApprovePrepareVO.getTid());//결제준비 응답정보에 포함된 TID 항목 값
		body.add("partner_order_id", kakaoPayApprovePrepareVO.getPartner_order_id());//결제준비 요청정보에 포함된 PARTNER_ORDER_ID 항목 값
		body.add("partner_user_id", kakaoPayApprovePrepareVO.getPartner_user_id());//결제준비 요청정보에 포함된 PARTNER_USER_ID 항목 값
		body.add("pg_token", kakaoPayApprovePrepareVO.getPg_token());//결제 성공 시 파라미터로 전달되는 PG_TOKEN 항목 값
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");
		
		KakaoPayApproveVO approveVO = 
				template.postForObject(uri, entity, KakaoPayApproveVO.class);
		
		paymentDao.approve(Integer.parseInt(kakaoPayApprovePrepareVO.getPartner_order_id()));
		
		return approveVO;
	}
	
	@Override
	public KakaoPayCancelVO cancel(KakaoPayCancelPrepareVO prepareVO) throws URISyntaxException {
		
		PaymentDto paymentDto = paymentDao.get(prepareVO.getPaymentNo());
		prepareVO.setTid(paymentDto.getPaymentTid());
		
		//[1] 요청 도구 생성
		RestTemplate template = new RestTemplate();
		
		//[2] Http Header 생성(ex : 편지봉투)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", kakaoAk);
		headers.add("Content-type", contentType);
		
		//[3] Http Body 생성(ex : 편지내용)
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", cid);
		body.add("tid", prepareVO.getTid());
		body.add("cancel_amount", String.valueOf(prepareVO.getCancel_amount()));
		body.add("cancel_tax_free_amount", String.valueOf(prepareVO.getCancel_tax_free_amount()));
		
		//[4] Http Header / Body 합성
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		//[5] 목적지 주소 작성
		URI uri = new URI("https://kapi.kakao.com/v1/payment/cancel");
		
		//[6] 전송
		KakaoPayCancelVO cancelVO = 
				template.postForObject(uri, entity, KakaoPayCancelVO.class);
		
		//데이터베이스 상태를 취소로 변경하는 코드
		paymentDao.cancel(prepareVO.getPaymentNo());
		
		return cancelVO;
	}
	
}
