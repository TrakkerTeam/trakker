package com.example.trakker.model.trip.dao;

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
    public void increaseViewcnt(int t_num, HttpSession session) throws Exception {
        sqlSession.update("trip.increaseViewcnt", t_num);
    }

    @Override
    public TripDTO view(int t_num) throws Exception {
        return sqlSession.selectOne("trip.view", t_num);
    }


    //    @Override
//    public List<TripDTO> listPage(int displayPost, int postNum) throws Exception{
//        HashMap<String, Integer> data = new HashMap<String, Integer>();
//
//        data.put("displayPost", displayPost);
//        data.put("postNum", postNum);
//
//        return sqlSession.selectList("trip.listPage", data);
//    }
    @Override
    public ResponseResultList listPage(ItemSearchVO vo) {
        HashMap<String, Object> data = new HashMap<String, Object>();

        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());
        List<TripDTO> resultdata = sqlSession.selectList("trip.listPage", data);
        Integer cnt = (Integer) sqlSession.selectOne("trip.listPageCount", data);
        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), cnt, vo.getPageRowCount());
        ResponseResultList responseResultList = new ResponseResultList();
        responseResultList.setPagingInfo(pagingInfoVO);
        responseResultList.setBody(resultdata);
        return responseResultList;
    }
}
