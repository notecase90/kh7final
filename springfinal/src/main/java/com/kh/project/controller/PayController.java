package com.kh.project.controller;

import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.project.kakaoPay.VO.KakaoPayApprovePrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayCancelPrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayReadyPrepareVO;
import com.kh.project.kakaoPay.VO.KakaoPayReadyVO;
import com.kh.project.kakaoPay.service.PayService;
import com.kh.project.repository.PaymentDao;
import com.kh.project.repository.ReservationDao;
import com.kh.project.vo.PaymentVO;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private PaymentDao paymentDao;
	
	
	@PostMapping("/confirm")
	public String confirm(
			@ModelAttribute KakaoPayReadyPrepareVO prepareVO,
			HttpSession session
			) throws URISyntaxException {
		KakaoPayReadyVO readyVO = payService.ready(prepareVO);
		
		session.setAttribute("partner_order_id", readyVO.getPartner_order_id());
		session.setAttribute("partner_user_id", readyVO.getPartner_user_id());
		session.setAttribute("tid", readyVO.getTid());
		
		return "redirect:"+readyVO.getNext_redirect_pc_url();
	}
	
	@GetMapping("/success")
	public String success(
			HttpSession session,
			@ModelAttribute KakaoPayApprovePrepareVO prepareVO
			) throws URISyntaxException {
		prepareVO.setPartner_order_id((String)session.getAttribute("partner_order_id"));
		prepareVO.setPartner_user_id((String)session.getAttribute("partner_user_id"));
		prepareVO.setTid((String)session.getAttribute("tid"));
		
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("tid");
		
		payService.approve(prepareVO);
		reservationDao.reservation(Integer.parseInt(prepareVO.getPartner_order_id()));
		
		return "redirect:paymentDetail?paymentNo="+prepareVO.getPartner_order_id();
	}
	
	@GetMapping("/paymentDetail")
	public String paymentDetail(
			@RequestParam int paymentNo,
			Model model
			) {
		PaymentVO paymentVO = paymentDao.detail(paymentNo);
		
		model.addAttribute("paymentVO",paymentVO);
		return "pay/paymentDetail";
	}
	
	@GetMapping("/paymentRefund")
	public String refund(
			@ModelAttribute KakaoPayCancelPrepareVO prepareVO,
			Model model
			) throws URISyntaxException {
			
		payService.cancel(prepareVO);
		
		PaymentVO paymentVO = paymentDao.detail(prepareVO.getPaymentNo());
		reservationDao.reservationCancel(paymentVO.getPaymentReservationNo());
		
		model.addAttribute("paymentVO",paymentVO);
		
		
		return "pay/paymentRefund";
	}
	
	@GetMapping("/paymentList")
	public String paymentList(
			HttpSession session,
			Model model
			) {
		
		int memberNo = (int)session.getAttribute("memberNo");
		
		List<PaymentVO> paymentVO = paymentDao.list(memberNo);
		model.addAttribute("paymentList",paymentVO);
		
		return "pay/paymentList";
	}
}
