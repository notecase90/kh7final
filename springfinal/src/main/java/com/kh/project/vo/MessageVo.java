package com.kh.project.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MessageVo {
	private int messageNo;
	private int memberNo;
	private String memberName;
	private String sendTime;
	private String message;
	
	private String chatName;

	
}
