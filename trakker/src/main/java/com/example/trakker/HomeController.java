package com.example.trakker;

import java.util.List;

import com.example.trakker.model.item.LocalDTO;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.service.admin.AdminService;
import com.example.trakker.service.item.LocalService;
import com.example.trakker.service.review.ReviewService;

import com.example.trakker.service.trip.TripService;
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

	@Autowired
	TripService tripService;

	@GetMapping("/")
	public String home(Model model) throws Exception {
		int memberTotalCount = adminService.memberCount();
		int localTotalCount = localService.localCount();

		List<ReviewDTO> review = reviewService.main_list();
		List<LocalDTO> local = localService.localList();
		List<TripDTO> trip = tripService.list();

		model.addAttribute("memberTotalCount" , memberTotalCount);
		model.addAttribute("localTotalCount" , localTotalCount);
		model.addAttribute("review", review);
		model.addAttribute("local", local);
		model.addAttribute("trip",trip);

		return "home";
	}

	@ResponseBody
	@PostMapping("/modal")
	public LocalDTO plannerModal(Integer lnum) {
		LocalDTO dto = localService.selectLocal(lnum);
		return dto;
	}

	@ResponseBody
	@PostMapping("/modal_trip")
	public TripDTO tripModal(Long t_num) {
		TripDTO tripdto = tripService.selectTrip(t_num);
		return tripdto;
	}
}
