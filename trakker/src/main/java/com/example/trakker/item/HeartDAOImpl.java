package com.example.trakker.item;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class HeartDAOImpl implements HeartDAO {

    @Autowired
    SqlSession sqlSession;

    //마이페이지 좋아요 목록
    @Override
    public Integer getCount(Map param) {
        return sqlSession.selectOne("heart.count", param);
    }
    @Override
    public List<HeartDTO> getList(Map param) {
        return sqlSession.selectOne("heart.list", param);
    }

    //좋아요 추가
    @Override
    public void insert(Integer memNum, Integer planNum) {
        sqlSession.insert("heart.insert", planNum);
    }

    //좋아요 취소
    @Override
    public void delete(Integer memNum, Integer planNum) {
        sqlSession.delete("heart.delete", planNum);
    }

    //플래너 삭제
    public void deletePlanner(Integer planNum) {
        sqlSession.delete("heart.deletePlanner", planNum);
    }
}
