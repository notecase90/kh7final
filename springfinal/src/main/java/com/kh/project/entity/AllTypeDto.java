package com.kh.project.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AllTypeDto {
	private int allTypeNo;
	private String allTypeName,allTypeIcon;
}
