package com.example.trakker.controller;

import java.util.List;

import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.model.member.dto.MemberDTO;
import com.example.trakker.service.faq.FaqService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.trakker.service.admin.AdminService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;
	@Autowired
	private FaqService faqService;

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
		List<MemberDTO> memberList = adminService.memberList();

		//레코드 개수
		int memberCount = adminService.memberCount();

		mav.setViewName("admin/admin_main");
		mav.addObject("memberList", memberList);
		mav.addObject("list", items);
		// View 단에 전송
		mav.addObject("memberCount", memberCount);
		return mav;
	}
	@RequestMapping("/view.do")
	public String view(Model model, @RequestParam int mem_num) {
		model.addAttribute("dto", adminService.adminViewMember(mem_num));

		return "admin/admin_memberView";

	}
	@RequestMapping("/userUpdate")
	public String UpdateUser(MemberDTO dto) throws Exception{
		//회원 정보가 null이 들어오면 작동 안함.
		if (dto != null){
			adminService.updateMember(dto);
		}
		return "redirect:/admin/memberList";
	}


}