package com.kh.project.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor
@Builder @Data
public class RoomTypeDto {
	private int roomTypeRoomNo;
	private int allTypeNo;
}
