package com.example.trakker.model.review.dto;

import com.example.trakker.item.LocalDTO;
import lombok.Data;

import java.util.Date;

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


}
