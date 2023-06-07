package com.example.trakker.model.planner.dao;

import com.example.trakker.model.planner.dto.PlannerDTO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PlannerDAO {

    Integer getPlanListCount(Map map);

    List<PlannerDTO> getPlanList(Map map);

    Integer getPlanSearchListCount(Map map);

    List<PlannerDTO> getPlanSearchList(Map map);

    void insert(PlannerDTO plan);

    PlannerDTO detail(Integer planNum);
    
}
