package com.example.trakker.model.faq.dto;

import lombok.Data;
import java.util.Date;

@Data
public class FaqDTO {

    private long faq_num;
    private String faq_subject;
    private String content;
    private int readcount;
    private Date faq_reg_date;
    private Integer next;
    private Integer prev;
}