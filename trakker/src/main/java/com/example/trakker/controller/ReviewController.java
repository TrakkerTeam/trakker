package com.example.trakker.controller;

import com.example.trakker.item.Page;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @GetMapping("/review/list")
    public void list(Model model, @RequestParam("num") int num,
                     @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
                     @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {
        Page page = new Page();
        page.setNum(num);
        page.setTotal(reviewService.total(searchType, keyword));
        page.setSearchType(searchType);
        page.setKeyword(keyword);
        List<ReviewDTO> list = null;
        list = reviewService.list(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("select", num);
    }

    @GetMapping("/review/write")
    public String write(Model model) {
        model.addAttribute("reviewDTO", new ReviewDTO());
        return "review/insert";
    }

    @PostMapping("/review/insert")
    public String insert(@ModelAttribute("reviewDTO") ReviewDTO review) {
        reviewService.insert(review);
        return "redirect:/review/list";
    }

    @GetMapping("/review/detail")
    public ModelAndView detail(Integer review_num, HttpSession session) {
        reviewService.count(review_num, session);
        ReviewDTO review = reviewService.detail(review_num);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("review/detail");
        mav.addObject("review", review);
        return mav;
    }

    @GetMapping("/review/edit")
    public ModelAndView edit(Integer review_num, HttpSession session) {
        reviewService.count(review_num, session);
        ReviewDTO review = reviewService.detail(review_num);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("review/edit");
        mav.addObject("review", review);
        return mav;
    }

    @PostMapping("/review/update")
    public String update(@ModelAttribute("reviewDTO") ReviewDTO review) {
        reviewService.update(review);
        return "redirect:/review/detail?review_num="+review.getReview_num();
    }

    @PostMapping("/review/delete")
    public String delete(Integer review_num) {
        reviewService.delete(review_num);
        return "redirect:/review/list";
    }



}
