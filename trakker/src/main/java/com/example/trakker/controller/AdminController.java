package com.example.trakker.controller;

import java.util.List;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/memberList")
	public String memberList(Model model) {
		List<MemberDTO> list = adminService.memberList();
		String abc = "abc";
		model.addAttribute("abc", abc);
		model.addAttribute("list", list);
		
		return "admin/admin_memberList";
	}
	@RequestMapping("/adminPage.do")
	public String adminPage(Model model) {
		
		return "admin/admin_test_category";
	}
	@RequestMapping("/view.do")
	public String view(Model model, @RequestParam int mem_num) {
		model.addAttribute("dto", adminService.viewMember(mem_num));
		
		return "admin/admin_memberView";
		
	}
	

}
