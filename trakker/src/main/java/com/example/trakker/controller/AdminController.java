package com.example.trakker.controller;

import java.util.List;

import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.service.faq.FaqService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.trakker.service.AdminService;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;
	@Autowired
	FaqService faqService;

	@RequestMapping("/memberList")
	public String memberList(Model model) {
		List<MemberDTO> list = adminService.memberList();
		model.addAttribute("list", list);
		long result = System.currentTimeMillis();
		logger.info("유저 목록 페이지 : " + result + " ms" );

		return "admin/admin_memberList";
	}
	@RequestMapping("/adminPage.do")
	public ModelAndView adminPage(ModelAndView mav) throws Exception{
		List<FaqDTO> items = faqService.list();
		mav.setViewName("admin/admin_test_category");
		mav.addObject("list", items);
		return mav;
	}
	@RequestMapping("/view.do")
	public String view(Model model) {
//		model.addAttribute("dto", adminService.viewMember(mem_num));

		return "admin/admin_memberView";

	}

}
