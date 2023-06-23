package com.example.trakker.model.review.dto;

import com.example.trakker.model.member.dto.MemberDTO;
import lombok.Data;

import java.util.Date;

@Data
public class R_commentDTO {
    private long comment_num;
    private long review_num;
    private long mem_num;
    private Integer l_num;
    private long comment_p;
    private String content;
    private Date com_date;
    private String com_delete;
    private String com_update;
    private String parent_comment_nickname;

    private MemberDTO member;
}
