package com.example.trakker.model.planner.dao;

import com.example.trakker.model.planner.dto.PlannerDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface PlannerDAO {
    void insert(PlannerDTO planner);

    Integer count(Map param);
    List<PlannerDTO> list(Map param);

    Integer updateHit(Integer planNum);
    HashMap<String, Object> detail(Integer planNum);

    void update(PlannerDTO planner);

    void delete(Integer planNum);
}
