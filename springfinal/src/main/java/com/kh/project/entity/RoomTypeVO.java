package com.kh.project.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class RoomTypeVO {
	private int allTypeRoomNo;   //숙소종류 번호
	private int roomTypeRoomNo;  //숙소번호
	private String allTypeName;  //숙소종류 이름
	private String allTypeIcon;  //숙소종류 아이콘명
}
