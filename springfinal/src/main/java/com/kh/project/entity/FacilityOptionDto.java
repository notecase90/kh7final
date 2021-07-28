package com.kh.project.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor
@Builder @Data
public class FacilityOptionDto {
	private int optionNo;
	private String optionName;
	private String optionIcon;
}
