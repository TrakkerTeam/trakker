package com.example.trakker.model.review.dao;

import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.review.dto.ReviewDTO;
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
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public ResponseResultList list(PagingInfoVO vo) {
        HashMap<String, Object> data = new HashMap<String, Object>();

        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("area", vo.getArea());
        data.put("sort", vo.getSort());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());

        List<ReviewDTO> resultdata = sqlSession.selectList("review.list", data);
        Integer cnt = (Integer) sqlSession.selectOne("review.total", data);
        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), cnt, vo.getPageRowCount());
        ResponseResultList responseResultList = new ResponseResultList();
        responseResultList.setPagingInfo(pagingInfoVO);
        responseResultList.setBody(resultdata);

        return responseResultList;
    }

    @Override
    public void insert(ReviewDTO review) {
        sqlSession.insert("review.insert", review);

    }

    @Override
    public void count(long review_num) {
        sqlSession.update("review.count", review_num);
    }

    @Override
    public ReviewDTO detail(long review_num) {
        return sqlSession.selectOne("review.detail", review_num);
    }

    @Override
    public void update(ReviewDTO review) {
        sqlSession.update("review.update", review);
    }

    @Override
    public void delete(long review_num) {
        sqlSession.delete("review.delete", review_num);
    }

    @Override
    public Double ratingAvg(long review_num) {
        return sqlSession.selectOne("rating.ratingAvg",review_num);
    }

    @Override
    public void ratingInsert(RatingDTO dto) {

        sqlSession.insert("rating.ratingInsert",dto);
    }

    @Override
    public List<ReviewDTO> main_list() {
        return sqlSession.selectList("review.main_list");
    }


}
