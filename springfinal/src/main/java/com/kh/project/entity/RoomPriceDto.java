package com.kh.project.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class RoomPriceDto {
	private int roomPriceNo;
	private int roomOrigin;
	private int dayPrice;
}
