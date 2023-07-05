package com.example.trakker.model.planner.dao;

import com.example.trakker.model.planner.dto.PlannerDTO;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class PlannerDAOImpl implements PlannerDAO {
    @Autowired
    SqlSession sqlSession;

    @Override
    public void insert(PlannerDTO planner) {
        sqlSession.insert("planner.insert", planner);
    }
    @Override
    public Long getNum() {
        return sqlSession.selectOne("planner.selectNum");
    }

    @Override
    public Long count(Map param) {
        return sqlSession.selectOne("planner.count", param);
    }
    @Override
    public List<PlannerDTO> list(Map param) {
        return sqlSession.selectList("planner.list", param);
    }

    @Override
    public Integer updateHit(Long planNum) {
        return sqlSession.update("planner.updateHit", planNum);
    }
    @Override
    public HashMap<String, Object> detail(Map param) {
        PlannerDTO plan = sqlSession.selectOne("planner.detail", param);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String stringRegdate = simpleDateFormat.format(plan.getRegdate());

        ObjectMapper objectMapper = new ObjectMapper();
        HashMap<String, Object> planner = (HashMap<String, Object>) objectMapper.convertValue(plan, Map.class);
        planner.put("regdate", stringRegdate);
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

    @Override
    public void update(PlannerDTO planner) {
        sqlSession.update("planner.update", planner);
    }

    @Override
    public void delete(Long planNum) {
        sqlSession.delete("planner.delete", planNum);
    }
}
