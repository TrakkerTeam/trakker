package com.example.trakker.model.trip.dao;


import com.example.trakker.model.item.RatingDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class TripDAOImpl implements TripDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<TripDTO> list() throws Exception {
        return sqlSession.selectList("trip.list");
    }

    @Override
    public void update(TripDTO dto) throws Exception {
        sqlSession.update("trip.update", dto);
    }

    @Override
    public void delete(long t_num) throws Exception {
        sqlSession.delete("trip.delete", t_num);
    }

    @Override
    public TripDTO view(long t_num) throws Exception {
        return sqlSession.selectOne("trip.view", t_num);
    }

    @Override
    public int count(Map data) {
        return sqlSession.selectOne("trip.listPageCount", data);
    }

    @Override
    public List<TripDTO> listPage(Map data) {
        return sqlSession.selectList("trip.listPage", data);
    }

    @Override
    public Double ratingAvg(long t_num) {
        return sqlSession.selectOne("rating.ratingAvg_trip",t_num);
    }

    @Override
    public void ratingInsert(RatingDTO dto) {
        sqlSession.insert("rating.ratingInsert_trip",dto);
    }

    @Override
    public TripDTO getTrip(Long t_num) {
        return sqlSession.selectOne("trip.select", t_num);
    }
}

