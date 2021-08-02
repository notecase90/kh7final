package com.kh.project.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GongjiVo {
	private int gongjiNo;
	private String gongjiContent;
	private Date gongjiTime;
	private String adminName;
}
