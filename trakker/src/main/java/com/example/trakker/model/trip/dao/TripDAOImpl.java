package com.example.trakker.model.trip.dao;

import com.example.trakker.model.trip.dto.TripDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TripDAOImpl implements TripDAO{

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<TripDTO> list(){
        return sqlSession.selectList("trip.list");
    }

    @Override
    public void write(TripDTO dto) throws Exception{
        sqlSession.insert("trip.insert",dto);
    }
}
