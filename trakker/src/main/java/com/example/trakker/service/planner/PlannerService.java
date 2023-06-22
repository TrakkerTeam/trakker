package com.example.trakker.service.planner;

import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;

import java.util.List;

public interface PlannerService {

    String selectLocal(Integer lNum);
    void insert(PlannerDTO planner, List<ScheduleDTO> schedules);

    ResponseResultList list(PagingInfoVO vo);

    ResponseResultList detail(Integer planNum);

    void update(Integer planNum, PlannerDTO planner, List<ScheduleDTO> schedules);

    void delete(Integer planNum);

    void insertHeart(Integer memNum, Integer planNum);
    void deleteHeart(Integer memNum);
}
