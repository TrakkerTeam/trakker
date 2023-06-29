package com.example.trakker.model.planner.dto;

import com.example.trakker.item.LocalDTO;
import com.example.trakker.model.member.dto.MemberDTO;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class PlannerDTO {
    private Integer planNum; //플래너번호
    private Integer memNum; //작성자
    private Integer lNum; //지역
    private String title; //제목
    private String memo; //메모
    private Integer days; //일정 수
    private Date regdate; //등록일자
    private Integer hit; //조회수

    private MemberDTO member;
    private LocalDTO local;
}
