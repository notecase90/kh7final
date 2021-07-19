package com.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.project.entity.ReviewDto;
import com.kh.project.repository.ReviewDao;
import com.kh.project.vo.ReviewVo;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	// 리뷰등록
	@GetMapping("/insert")
	public String insert() {
		return "review/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.insertReview(reviewDto);
		return "redirect:review_success";
	}
	
	@GetMapping("/review_success")
	public String reviewSuccess() {
		return "review/reviewSuccess";
	}
	
	// 전체리뷰
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", reviewDao.list());
		return "review/reviewList";
	}
	
	
	// 한 숙소에 대한 리뷰목록보기
	@GetMapping("/onelist/{roomNo}")
	public String onelist(@PathVariable int roomNo, Model model) {
		model.addAttribute("list", reviewDao.onelist(roomNo));
		return "review/roomReviewList";
	}
	
	// 상세보기
	@GetMapping("/detail/{reviewNo}")
	public String detail(@PathVariable int reviewNo, Model model) {
		model.addAttribute("reviewDto", reviewDao.detail(reviewNo));
		return "review/detail";
	}
	
	// 리뷰 수정
	@GetMapping("/edit")
	public String edit(@RequestParam int reviewNo, Model model) {
		model.addAttribute("reviewDto", reviewDao.detail(reviewNo));
		return "review/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.edit(reviewDto);
		return "redirect:edit_success";
	}
	
	@GetMapping("/edit_success")
	public String editSuccess() {
		return "review/editSuccess";
	}
	
	// 삭제
	@GetMapping("/delete")
	public String delete(int reviewNo) {
		reviewDao.delete(reviewNo);
		return "redirect:list";
	}
	
	
	
}
