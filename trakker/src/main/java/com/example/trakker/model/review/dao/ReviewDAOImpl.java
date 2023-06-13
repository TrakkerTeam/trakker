package com.example.trakker.model.review.dao;

import com.example.trakker.model.review.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<ReviewDTO> list(int displayPost, int postNum, String searchType, String keyword) {
        HashMap<String, Object> data = new HashMap<String, Object>();

        data.put("displayPost", displayPost);
        data.put("postNum", postNum);

        data.put("searchType", searchType);
        data.put("keyword", keyword);

        return sqlSession.selectList("review.list", data);
    }

    @Override
    public void insert(ReviewDTO review) {
        sqlSession.insert("review.insert", review);

    }

    @Override
    public void count(Integer review_num, HttpSession session) {
        sqlSession.update("review.count", review_num);
    }

    @Override
    public ReviewDTO detail(Integer review_num) {
        return sqlSession.selectOne("review.detail", review_num);
    }

    @Override
    public void update(ReviewDTO review) {
        sqlSession.update("review.update", review);
    }

    @Override
    public void delete(Integer review_num) {
        sqlSession.delete("review.delete", review_num);
    }

    @Override
    public int total(String searchType, String keyword) {
        HashMap data = new HashMap();

        data.put("searchType", searchType);
        data.put("keyword", keyword);

        return sqlSession.selectOne("review.total",data);
    }

}
