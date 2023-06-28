package com.example.trakker.model.trip.dao;


import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.HashMap;
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
    public void insert(TripDTO dto) throws Exception {
        sqlSession.insert("trip.insert", dto);
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
    public void deleteFile(String fullName) {
        sqlSession.delete("trip.deleteFile", fullName);
    }

    @Override
    public List<String> getAttach(long t_num) {
        return sqlSession.selectList("trip.getAttach", t_num);
    }

    @Override
    public void addAttach(String fullName) {
        sqlSession.insert("trip.addAttach", fullName);
    }

    @Override
    public void updateAttach(String fullName, long t_num) {
        Map<String,Object> map=new HashMap<>();
        map.put("fullName", fullName);//첨부파일 이름
        map.put("t_num", t_num); //게시물 번호
        sqlSession.insert("trip.updateAttach", map);

    }

    @Override
    public Double ratingAvg(long t_num) {
        return sqlSession.selectOne("rating.ratingAvg_trip",t_num);
    }

    @Override
    public void ratingInsert(RatingDTO dto) {
        sqlSession.insert("rating.ratingInsert_trip",dto);
    }
}

