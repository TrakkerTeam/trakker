package com.example.trakker.model.planner.dto;

import lombok.Data;

@Data
public class ScheduleDTO {
    private Long planNum; //플래너번호
    private Integer sday; //날짜
    private Integer snum; //날짜별 일정번호
    private String spoint; //장소명
    private String smemo; //장소 메모
    private Double y;
    private Double x;
}
