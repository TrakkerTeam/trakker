package com.example.trakker.model.planner.dao;

import com.example.trakker.model.planner.dto.PlannerDTO;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class PlannerDAOImpl implements PlannerDAO {

    @Autowired
    SqlSession sqlSession;

    //플래너 작성
    @Override
    public void insert(PlannerDTO planner) {
        sqlSession.insert("planner.insert", planner);
    }

    //플래너 목록
    @Override
    public Integer count(Map param) {
        return sqlSession.selectOne("planner.count", param);
    }
    @Override
    public List<PlannerDTO> list(Map param) {
        return sqlSession.selectList("planner.list", param);
    }

    //플래너 상세
    @Override
    public Integer updateHit(Integer planNum) {
        return sqlSession.update("planner.updateHit", planNum);
    }
    @Override
    public HashMap<String, Object> detail(Integer planNum) {
        PlannerDTO plan = sqlSession.selectOne("planner.detail", planNum);

        ObjectMapper objectMapper = new ObjectMapper();
        HashMap<String, Object> planner = (HashMap<String, Object>) objectMapper.convertValue(plan, Map.class);
        return planner;
    }

    //플래너 수정
    @Override
    public void update(PlannerDTO planner) {
        sqlSession.update("planner.update", planner);
    }

    //플래너 삭제
    @Override
    public void delete(Integer planNum) {
        sqlSession.delete("planner.delete", planNum);
    }
}
