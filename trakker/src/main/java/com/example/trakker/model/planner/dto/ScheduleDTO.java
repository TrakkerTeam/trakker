package com.example.trakker.model.planner.dto;

import lombok.Data;

@Data
public class ScheduleDTO {
    private Integer planNum; //플래너번호
    private Integer sDay; //날짜
    private Integer sNum; //날짜별 일정번호
    private String sPoint; //장소명
    private String sMemo; //장소 메모
    private Integer x;
    private Integer y;
}
