package com.kh.project.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HostRoomVO {
	private int roomNo;
	private String roomName;
	private String roomAdd;
	private int count;
}
