package com.kh.project.restcontroller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/data")
public class DataController {

	@PostMapping("/test3")
	public String test3(
			@RequestParam String memberId
			) {
			if(memberId.equals("admin1234")) return "N";
			else return "Y";
	}
}
