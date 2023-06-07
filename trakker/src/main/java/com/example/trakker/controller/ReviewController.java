//요청을 받아서 ReviewService로 전달하고, ReviewService로 처리된 결과를 받아 View에 전달함

package com.example.trakker.controller;

import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("/review/list")
    public String list(Model model) {
        return "review/list";
    }

    @GetMapping("/review/review_list")
    public String getReviewList(Model model) {
        List<ReviewDTO> reviewList = reviewService.getReviewList();
        model.addAttribute("reviewList", reviewList);
        return "review/review_list";
    }

    @GetMapping("/review/write")
    public String write(Model model) {
        model.addAttribute("reviewVO", new ReviewDTO());
        return "review/insert";
    }


    @PostMapping("/review/insert")
    public String insert(@ModelAttribute("reviewVO") ReviewDTO review) {
        reviewService.insert(review);
        return "review/list";
    }

    @RequestMapping("/review/edit")
    public String edit(Model model) {
        return "review/edit";
    }

    @GetMapping("/review/detail")
    public ModelAndView detail(Integer review_num, HttpSession session) {
        ReviewDTO review = reviewService.detail(review_num);
        reviewService.count(review_num, session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("review/detail");
        mav.addObject("review", review);
        return mav;
    }

}
