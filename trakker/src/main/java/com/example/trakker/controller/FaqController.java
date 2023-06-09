//이 컨트롤러는 FAQ 관련 기능을 처리하기 위한 컨트롤러입니다.
// service에 요청하고 가져온 후에 view 단으로 반환합니다.

package com.example.trakker.controller;


import java.util.List;





import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
	@RequestMapping("/faq/view.do")
	public ModelAndView view(int faq_num, HttpSession session) throws Exception {
		faqService.increaseViewcnt(faq_num, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq/faq_modify");
		mav.addObject("faq", faqService.view(faq_num));
		return mav;
	}

	@RequestMapping ("/faq/update.do")
	public String update(FaqDTO dto) throws Exception {
		if(dto != null) {
			faqService.update(dto);
		}
		return "redirect:/admin/adminPage.do";
	}

	@RequestMapping("/faq/delete.do")
	public String delete(int faq_num) throws Exception {
		faqService.delete(faq_num);
		return "redirect:/admin/adminPage.do";
	}


}
