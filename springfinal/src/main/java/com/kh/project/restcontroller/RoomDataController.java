package com.kh.project.restcontroller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.project.entity.AllTypeDto;
import com.kh.project.entity.FacilityOptionDto;
import com.kh.project.entity.RoomPicDto;
import com.kh.project.repository.RoomDao;

import lombok.extern.slf4j.Slf4j;

@RestController//@Controller + @ResponseBody
@RequestMapping("/data/room")
@Slf4j
public class RoomDataController {

	@Autowired
	private RoomDao roomDao;
	
	@GetMapping("/facility")
	public List<FacilityOptionDto> facility() {
		return roomDao.facility();
	}
	
	@GetMapping("/allType")
	public List<AllTypeDto> allType() {
		return roomDao.allType();
	}
	
	@PostMapping("/homePic")
	public RoomPicDto homePic(
			@RequestParam MultipartFile f,
			HttpSession session
			) throws IllegalStateException, IOException {
		int roomNo = (int)session.getAttribute("roomNo");
		RoomPicDto roomPicDto = RoomPicDto.builder()
												.roomOriginNo(roomNo)
												.roomPicUploadName(f.getOriginalFilename())
												.roomPicContentType(f.getContentType())
												.roomPicFileSize(f.getSize())
											.build();
		RoomPicDto result = roomDao.addPic(roomPicDto);
		roomDao.save(roomPicDto.getRoomPicSaveName(),f);
		return result;
	}
	
	@GetMapping("/download/{roomPicNo}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable int roomPicNo) throws IOException {
		
		RoomPicDto roomPicDto = roomDao.get(roomPicNo);
		ByteArrayResource resource = roomDao.getPic(roomPicDto.getRoomPicSaveName());
		String fileName = URLEncoder.encode(roomPicDto.getRoomPicUploadName(),"UTF-8");
		
		return ResponseEntity.ok()
								.contentType(MediaType.APPLICATION_OCTET_STREAM)
								.contentLength(resource.contentLength())
								.header(HttpHeaders.CONTENT_ENCODING,"UTF-8")
								.header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\""+fileName+"\"")								
								.body(resource);
		
	}
	
	
}
