package com.kh.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GongjiDto {
	private int gongjiNo;
	private String gongjiContent;
	private Date gongjiTime;
	private int adminNo;
}
