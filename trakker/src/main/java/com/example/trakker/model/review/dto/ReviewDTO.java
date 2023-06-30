package com.example.trakker.model.review.dto;

import com.example.trakker.item.LocalDTO;
import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.member.dto.MemberDTO;
import lombok.Data;

import java.util.Date;

@Data
public class ReviewDTO {
    private long review_num;
    private long mem_num;
    private Integer lnum;
    private String title;
    private String content;
    private Date review_date;
    private long readcount;
    private Integer next;
    private Integer prev;
    private Date edit_date;

    private LocalDTO local;
    private MemberDTO member;
    private RatingDTO rating;
}
