package com.example.trakker.model.planner.dao;

import com.example.trakker.model.planner.dto.ScheduleDTO;

import java.util.List;

public interface ScheduleDAO {

    void insert(ScheduleDTO schedule);

    List<ScheduleDTO> detail(Long planNum);

    void delete(Long planNum);
}
