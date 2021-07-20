package com.kh.project.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor @Data @Builder
public class RoomPicDto {
	private int roomPicNo;
	private int roomNo;
	private String roomPicUploadName;
	private String roomPicSaveName;
	private String roomPicContentType;
	private long roomPicFileSize;
}
