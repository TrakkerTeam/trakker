package com.example.trakker.service.planner;

import com.example.trakker.item.ResponseResultList;
import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;

import java.util.List;
import java.util.Map;

public interface PlannerService {

    void insert(PlannerDTO planner, List<ScheduleDTO> schedules);

    ResponseResultList list(Map param);

    ResponseResultList detail(Integer planNum);

    void update(Integer planNum, PlannerDTO planner, List<ScheduleDTO> schedules);

    void delete(Integer planNum);

    void insertHeart(Integer memNum, Integer planNum);
    void deleteHeart(Integer memNum);
}
