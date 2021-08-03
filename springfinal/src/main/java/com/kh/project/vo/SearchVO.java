package com.kh.project.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor
@Data @Builder
public class SearchVO {
	private int roomNo;
	private String keyword;
	private Date checkIn;
	private Date checkOut;
}
