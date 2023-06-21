package com.example.trakker.item;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HeartDAOImpl implements HeartDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public Integer getCount(Integer memNum) {
        return null;
    }

    @Override
    public List<HeartDTO> getList(Integer memNum) {
        return null;
    }

    @Override
    public void insert(Integer memNum, Integer planNum) {

    }

    @Override
    public void delete(Integer memNum, Integer planNum) {

    }
}
