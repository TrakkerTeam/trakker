package com.example.trakker.model.planner.dao;

import com.example.trakker.model.planner.dto.ScheduleDTO;

import java.util.List;

public interface ScheduleDAO {

    void insert(List<ScheduleDTO> schedules);

    List<ScheduleDTO> detail(Integer planNum);

    void delete(Integer planNum);
}
