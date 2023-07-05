package com.example.trakker.model.planner.dao;

import com.example.trakker.model.planner.dto.PlannerDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface PlannerDAO {
    void insert(PlannerDTO planner);
    Long getNum();

    Long count(Map param);
    List<PlannerDTO> list(Map param);

    Integer updateHit(Long planNum);
    HashMap<String, Object> detail(Map param);
    Long prevNum(Long planNum);
    Long nextNum(Long planNum);

    void update(PlannerDTO planner);

    void delete(Long planNum);
}
