package com.example.trakker.service.impl;
//스케줄 Service 구현 클래스

import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;
import com.example.trakker.service.planner.ScheduleService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Override
    public List<ScheduleDTO> selectPlans(PlannerDTO planner) {
        return null;
    }
    @Override
    public List<ScheduleDTO> insertPlans(List<PlannerDTO> planners) {
        return null;
    }
    @Override
    public List<ScheduleDTO> selectPlan(Integer plannerNo) {
        return null;
    }
    @Override
    public void deletePlans(Integer plannerNo) {
    }
}
