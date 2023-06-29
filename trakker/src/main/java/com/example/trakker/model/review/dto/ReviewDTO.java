package com.example.trakker.model.review.dto;

import com.example.trakker.item.LocalDTO;
import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.member.dto.MemberDTO;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ReviewDTO {
    private Integer review_num;
    private Integer mem_num;
    private Integer l_num;
    private String title;
    private String content;
    private Date review_date;
    private int readcount;
    private Date edit_date;

    private LocalDTO local;
    private MemberDTO member;
    private RatingDTO rating;

}
