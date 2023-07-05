package com.example.trakker;

import java.util.List;

import com.example.trakker.model.item.LocalDTO;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.service.admin.AdminService;
import com.example.trakker.service.item.LocalService;
import com.example.trakker.service.review.ReviewService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {
	@Autowired
	AdminService adminService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	LocalService localService;

	@GetMapping("/")
	public String home(Model model) throws Exception {
		int memberTotalCount = adminService.memberCount();
		int localTotalCount = localService.localCount();

		List<ReviewDTO> review = reviewService.main_list();
		List<LocalDTO> local = localService.localList();

		model.addAttribute("memberTotalCount" , memberTotalCount);
		model.addAttribute("localTotalCount" , localTotalCount);
		model.addAttribute("review", review);
		model.addAttribute("local", local);

		return "home";
	}

	@ResponseBody
	@PostMapping("/modal")
	public LocalDTO plannerModal(Integer lnum) {
		LocalDTO dto = localService.selectLocal(lnum);
		return dto;
	}

}
