package com.example.trakker.model.review.dao;

import com.example.trakker.model.item.RatingDTO;
import com.example.trakker.model.review.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<ReviewDTO> list(Map data) {

        return sqlSession.selectList("review.list", data);
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
        return sqlSession.selectOne("rating.ratingAvg", review_num);
    }

    @Override
    public void ratingInsert(RatingDTO dto) {

        sqlSession.insert("rating.ratingInsert", dto);
    }

    @Override
    public List<ReviewDTO> main_list() {
        return sqlSession.selectList("review.main_list");
    }

    @Override
    public int total(Map data) {
        return sqlSession.selectOne("review.total", data);
    }

    @Override
    public List<ReviewDTO> r_list(Map data) {
        return sqlSession.selectList("review.r_list", data);
    }

}
