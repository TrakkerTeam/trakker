package com.example.trakker.service.planner;

import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.planner.dto.ScheduleDTO;

import java.util.List;

public interface ScheduleService {
    List<ScheduleDTO> selectPlans(PlannerDTO planner);
    List<ScheduleDTO> insertPlans(List<PlannerDTO> planners);
    List<ScheduleDTO> selectPlan(Integer plannerNo);
    void deletePlans(Integer plannerNo);
}
