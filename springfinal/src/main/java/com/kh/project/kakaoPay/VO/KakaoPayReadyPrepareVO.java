package com.kh.project.kakaoPay.VO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//카카오 결제 준비 요청에 필요한 데이터
@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class KakaoPayReadyPrepareVO {
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private int quantity;
	private int total_amount;
	private int tax_free_amount;
}
