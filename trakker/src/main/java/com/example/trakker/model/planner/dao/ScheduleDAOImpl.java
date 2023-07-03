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

    //세부일정 작성&수정
    @Override
    public void insert(ScheduleDTO schedule) {
        sqlSession.insert("schedule.insert", schedule);
    }

    //세부일정 상세
    @Override
    public List<ScheduleDTO> detail(Long planNum) {
        return sqlSession.selectList("schedule.select", planNum);
    }

    //세부일정 수정&삭제
    @Override
    public void delete(Long planNum) {
        sqlSession.delete("schedule.delete", planNum);
    }
}
