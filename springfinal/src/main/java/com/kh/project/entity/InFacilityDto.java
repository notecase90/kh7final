package com.kh.project.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor
@Builder @Data
public class InFacilityDto {
	private int inFacilityRoomNo;
	private int bedCount;
	private int bathCount;
	private int balconyCount;
}
