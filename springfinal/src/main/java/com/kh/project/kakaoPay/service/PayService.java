package com.kh.project.kakaoPay.service;

import java.net.URISyntaxException;

import com.kh.project.kakaoPay.VO.KakaoPayApprovePrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayApproveVO;
import com.kh.project.kakaoPay.VO.KakaoPayCancelPrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayCancelVO;
import com.kh.project.kakaoPay.VO.KakaoPayReadyPrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayReadyVO;



public interface PayService {
	//결제 준비 요청
	KakaoPayReadyVO ready(KakaoPayReadyPrepareVO kakaoPayReadyPrepareVO) throws URISyntaxException;
	//결제 승인 요청
	KakaoPayApproveVO approve(KakaoPayApprovePrepareVO kakaoPayApprovePrepareVO) throws URISyntaxException;
	//결제 취소 기능
	KakaoPayCancelVO cancel(KakaoPayCancelPrepareVO prepareVO) throws URISyntaxException;
}
