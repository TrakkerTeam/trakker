package com.example.trakker.service.planner;

import com.example.trakker.model.planner.dto.PlannerDTO;

import java.text.ParseException;
import java.util.List;

public interface PlannerService {
    PlannerDTO insertPlanner(PlannerDTO planner) throws ParseException;
    List<PlannerDTO> selectPlanners(String memNum);
    PlannerDTO selectPlanner(Integer planNum);
    void deletePlanner(Integer planNum);

}
