package com.example.trakker.controller;

import com.example.trakker.model.review.dto.R_commentDTO;
import com.example.trakker.service.review.R_commentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
public class R_commentController {

    @Autowired
    private R_commentService rcommentService;

    @PostMapping("/comment/insert")
    public void insert(R_commentDTO dto) {

        rcommentService.insert(dto);

    }

    @GetMapping("/comment/list")
    public ModelAndView list(Integer review_num, ModelAndView mav) {
        List<R_commentDTO> list=rcommentService.commentList(review_num);
        mav.setViewName("/review/commentList"); //포워딩 뷰
        mav.addObject("list", list); //뷰에 전달할 데이터
        return mav;
    }


}
