package com.example.trakker.model.item;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HeartDAOImpl implements HeartDAO {

    @Autowired
    SqlSession sqlSession;


    @Override
    public void insert(HeartDTO dto) {
        sqlSession.insert("heart.insert", dto);
    }
    @Override
    public void delete(HeartDTO dto) {
        sqlSession.delete("heart.delete", dto);
    }


    public void deletePlanner(Long planNum) {
        sqlSession.delete("heart.deletePlanner", planNum);
    }

    public void deleteMember(Long memNum){
        sqlSession.delete("heart.deleteMember", memNum);
    }
}
