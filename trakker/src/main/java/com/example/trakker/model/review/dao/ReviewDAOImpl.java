package com.example.trakker.model.review.dao;

import com.example.trakker.model.review.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<ReviewDTO> list() {
        return sqlSession.selectList("review.list");
    }

    @Override
    public void insert(ReviewDTO review) {
        sqlSession.insert("review.insert",review);

    }

    @Override
    public void count(Integer review_num, HttpSession session) {
        sqlSession.update("review.count", review_num);
    }

    @Override
    public ReviewDTO detail(Integer review_num) {
        return sqlSession.selectOne("review.detail",review_num);
    }

    @Override
    public void update(ReviewDTO review) {
        sqlSession.update("review.update", review);
    }

    @Override
    public void delete(Integer review_num) {
        sqlSession.delete("review.delete", review_num);
    }

}
