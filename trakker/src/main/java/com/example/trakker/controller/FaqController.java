package com.example.trakker.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.service.faq.FaqService;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;
		
	@GetMapping("/faq/list.do")
	public ModelAndView list(ModelAndView mav) {
		List<FaqDTO> items=faqService.list();
		mav.setViewName("faq/faq_list"); 
		mav.addObject("list", items); 
		return mav; 
	}
	
	@GetMapping("/faq/write.do")
	public String write() {
		return "/faq/faq_write";
	}
	
	@PostMapping("/faq/insert.do")
	public String insert(@ModelAttribute FaqDTO dto) 
			throws Exception{
		faqService.write(dto);
		return "redirect:/faq/list.do";
	}
}
