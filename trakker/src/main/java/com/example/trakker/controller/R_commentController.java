package com.example.trakker.controller;

import com.example.trakker.model.review.dto.R_commentDTO;
import com.example.trakker.service.review.R_commentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
public class R_commentController {

    @Autowired
    private R_commentService rcommentService;

    @PostMapping("/comment/insert")
    public void insert(R_commentDTO dto, HttpSession session) {
        long mem_num =(long)session.getAttribute("mem_num");
        dto.setMem_num(mem_num);

        rcommentService.insert(dto);

    }

    @GetMapping("/comment/list")
    public ModelAndView list(R_commentDTO dto, ModelAndView mav) {
        List<R_commentDTO> list=rcommentService.commentList(dto);
        mav.setViewName("/review/commentList"); //포워딩 뷰
        mav.addObject("list", list); //뷰에 전달할 데이터
        return mav;
    }

    @PostMapping("/comment/edit")
    public void update(long comment_num, String editContent) {
        rcommentService.update(comment_num,editContent);
    }

    @PostMapping("/comment/delete")
    public long delete(long comment_num) {
        return rcommentService.delete(comment_num);
    }

    @PostMapping("/comment/addInsert")
    public void insert(long mem_num, long review_num, long comment_num, Integer l_num, String addContent) {

        rcommentService.addInsert(mem_num,review_num,comment_num,l_num,addContent);

    }

}
