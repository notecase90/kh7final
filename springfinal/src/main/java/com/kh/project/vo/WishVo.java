package com.kh.project.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class WishVo {
	private int memberNo;
	private String roomName;
	private String roomPicNo;
}
