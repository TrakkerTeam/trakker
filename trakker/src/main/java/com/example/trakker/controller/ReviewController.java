package com.example.trakker.controller;

import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.review.dto.ReviewDTO;

import com.example.trakker.service.review.ReviewService;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ReviewController {
    
    @Autowired
    private ReviewService reviewService;

    @GetMapping("/review/list")
    public void list(Model model, @RequestParam("num") Integer num,
                     @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
                     @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword,
                     @RequestParam(value = "area",required = false, defaultValue = "0") Integer area,
                     @RequestParam(value = "sort",required = false, defaultValue = "add") String sort){
        PagingInfoVO vo = new PagingInfoVO();
        vo.setPageNum(num);
        vo.setArea(area);
        vo.setSort(sort);
        vo.setStype(searchType);
        vo.setSdata(keyword);
        ResponseResultList responseResultList = reviewService.list(vo);
        model.addAttribute("list", responseResultList.getBody());
        model.addAttribute("page", responseResultList.getMeta().get("pagingInfo"));
        model.addAttribute("select", num);
        model.addAttribute("search", searchType);
        model.addAttribute("keyword",keyword);
        System.out.println("num"+num);
        System.out.println("area"+area);
        System.out.println("sort"+sort);
        System.out.println("num"+num);
        System.out.println("area"+area);
        System.out.println("sort"+sort);
    }

    @GetMapping("/review/write")
    public String write(Model model) {
        model.addAttribute("reviewDTO", new ReviewDTO());
        return "review/insert";
    }

    @PostMapping("/review/insert")
    public String insert(@ModelAttribute("reviewDTO") ReviewDTO review) {
        reviewService.insert(review);
        return "redirect:/review/list?num=1";
    }

    @GetMapping("/review/detail")
    public ModelAndView detail(long review_num,
                               HttpServletRequest request,
                               HttpServletResponse response) {
        reviewService.count(review_num, request,response);
        ReviewDTO review = reviewService.detail(review_num);
        /*평점 total 값 추가 */
        Double ratingavg = reviewService.ratingAvg(review_num);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("review/detail");
        mav.addObject("review", review);
        /* 뷰단에 보내주기 */
        mav.addObject("ratingAvg", ratingavg);
        return mav;
    }

    @GetMapping("/review/edit")
    public ModelAndView edit(long review_num,
                             HttpServletRequest request,
                             HttpServletResponse response) {

        reviewService.count(review_num, request,response);
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
    public String delete(long review_num) {
        reviewService.delete(review_num);
        return "redirect:/review/list?num=1";
    }

    @PostMapping("/review/ratinginsert")
    public String ratingInsert(long review_num, Double rating , Model model, HttpSession session) {
        long mem_num =(long)session.getAttribute("mem_num");
        RatingDTO dto = new RatingDTO();
        dto.setMem_num(mem_num);
        dto.setReview_num(review_num);
        dto.setRating(rating);
        reviewService.ratingInsert(dto);

        Double ratingavg = reviewService.ratingAvg(review_num);

        model.addAttribute("dto", ratingavg);

        return "/review/rating";
    }




}
