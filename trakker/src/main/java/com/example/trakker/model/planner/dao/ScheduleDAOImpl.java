package com.example.trakker.model.planner.dao;

import com.example.trakker.model.planner.dto.ScheduleDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
    @Autowired
    SqlSession sqlSession;

    @Override
    public void insert(ScheduleDTO schedule) {
        sqlSession.insert("schedule.insert", schedule);
    }

    @Override
    public List<ScheduleDTO> detail(Long planNum) {
        return sqlSession.selectList("schedule.select", planNum);
    }

    @Override
    public void delete(Long planNum) {
        sqlSession.delete("schedule.delete", planNum);
    }
}
