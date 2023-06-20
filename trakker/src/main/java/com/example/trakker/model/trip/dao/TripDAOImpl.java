package com.example.trakker.model.trip.dao;

import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.model.trip.dto.TripDTO;
import com.example.trakker.utils.ItemSearchVO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
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
    public void delete(int t_num) throws Exception {
        sqlSession.delete("trip.delete", t_num);
    }


    @Override
    public TripDTO view(int t_num) throws Exception {
        return sqlSession.selectOne("trip.view", t_num);
    }

    @Override
    public Integer count(Map data) {
      return sqlSession.selectOne("trip.listPageCount", data);
    }

    @Override
    public List<TripDTO> listPage(Map data) {
        return sqlSession.selectList("trip.listPage", data);
    }
}
