package com.example.trakker.controller;

import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.service.faq.FaqService;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class FaqController {

    @Autowired
    FaqService faqService;

    @RequestMapping(value = "/faq/faq_list_user", method = RequestMethod.GET)
    public void getListPageUser(Model model, @RequestParam("num") Integer num,
                                @RequestParam(value = "searchType",required = false, defaultValue = "faq_subject") String searchType,
                                @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {
        PagingInfoVO vo = new PagingInfoVO();
        vo.setPageNum(num);
        vo.setStype(searchType);
        vo.setSdata(keyword);
        ResponseResultList responseResultList = faqService.listPage(vo);
        model.addAttribute("faq", responseResultList.getBody());
        model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
        model.addAttribute("select", num);
        model.addAttribute("search", searchType);
        model.addAttribute("keyword",keyword);
    }

    @GetMapping("/faq/write.do")
    public String write() {
        return "/faq/faq_write";
    }


    @PostMapping("/faq/insert.do")
    public String insert(@ModelAttribute FaqDTO dto)
            throws Exception {
        faqService.insert(dto);
        return "redirect:/faq/listPage?num=1";
    }

    @RequestMapping("/faq/view.do")
    public ModelAndView view(long faq_num) throws Exception {
        FaqDTO faq = faqService.view(faq_num);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("faq/faq_modify");
        mav.addObject("faq", faqService.view(faq_num));
        return mav;
    }
    @RequestMapping("/faq/user_view.do")
    public ModelAndView user_view(long faq_num, HttpServletRequest request, HttpServletResponse response) throws Exception {
        faqService.increaseViewcnt(faq_num, request,response);
        FaqDTO faq = faqService.view(faq_num);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("faq/faq_userview");
        mav.addObject("faq", faqService.view(faq_num));
        return mav;
    }
    @RequestMapping("/faq/update.do")
    public String update(FaqDTO dto) throws Exception {
        if (dto != null) {
            faqService.update(dto);
        }
        return "redirect:/faq/listPage?num=1";
    }

    @RequestMapping("/faq/delete.do")
    public String delete(long faq_num) throws Exception {
        faqService.delete(faq_num);
        return "redirect:/faq/listPage?num=1";
    }

    @RequestMapping(value = "/faq/listPage", method = RequestMethod.GET)
    public void getListPage(Model model, @RequestParam("num") Integer num,
                            @RequestParam(value = "searchType",required = false, defaultValue = "faq_subject") String searchType,
                            @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {
        PagingInfoVO vo = new PagingInfoVO();
        vo.setPageNum(num);
        vo.setStype(searchType);
        vo.setSdata(keyword);
        ResponseResultList responseResultList = faqService.listPage(vo);
        model.addAttribute("faq", responseResultList.getBody());
        model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
        model.addAttribute("select", num);
        model.addAttribute("search", searchType);
        model.addAttribute("keyword",keyword);
    }
}
