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
    @Override
    public Long getNum() {
        return sqlSession.selectOne("planner.selectNum");
    }

    //플래너 목록
    @Override
    public Long count(Map param) {
        return sqlSession.selectOne("planner.count", param);
    }
    @Override
    public List<PlannerDTO> list(Map param) {
        return sqlSession.selectList("planner.list", param);
    }

    //플래너 상세
    @Override
    public Integer updateHit(Map param) {
        return sqlSession.update("planner.updateHit", param);
    }
    @Override
    public HashMap<String, Object> detail(Map param) {
        PlannerDTO plan = sqlSession.selectOne("planner.detail", param);
        ObjectMapper objectMapper = new ObjectMapper();
        HashMap<String, Object> planner = (HashMap<String, Object>) objectMapper.convertValue(plan, Map.class);
        return planner;
    }
    @Override
    public Long prevNum(Long planNum){
        return sqlSession.selectOne("planner.prev", planNum);
    }
    @Override
    public Long nextNum(Long planNum){
        return sqlSession.selectOne("planner.next", planNum);
    }

    //플래너 수정
    @Override
    public void update(PlannerDTO planner) {
        sqlSession.update("planner.update", planner);
    }

    //플래너 삭제
    @Override
    public void delete(Long planNum) {
        sqlSession.delete("planner.delete", planNum);
    }
}
