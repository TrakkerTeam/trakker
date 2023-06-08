//이 컨트롤러는 FAQ 관련 기능을 처리하기 위한 컨트롤러입니다.
// service에 요청하고 가져온 후에 view 단으로 반환합니다.

package com.example.trakker.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.service.faq.FaqService;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class FaqController {

	@Autowired
	FaqService faqService;

	@GetMapping("/faq/list.do")
	public ModelAndView list(ModelAndView mav) throws Exception {
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
		faqService.insert(dto);
		return "redirect:/admin/adminPage.do";
	}

	@GetMapping("/faq/view.do")
	public ModelAndView view(int faq_num, HttpSession session) throws Exception {
		faqService.increaseViewcnt(faq_num, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq/faq_modify");
		mav.addObject("dto", faqService.read(faq_num));
		return mav;
	}
}
