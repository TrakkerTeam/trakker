package com.example.trakker.model.restReview;
import com.example.trakker.model.review.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class RestReviewDAOImpl implements RestReviewDAO{

    @Autowired
    private SqlSession session;

    @Override
    public Long count(Map param) {
        return session.selectOne("Restreview.count", param);
    }
    @Override
    public List<ReviewDTO> list(Map param) {
        return session.selectList("Restreview.list", param);
    }

    @Override
    public void updateREAD(Long reviewNum) {
         session.update("Restreview.updateREAD", reviewNum);
    }

    @Override
    public ReviewDTO detail(Long reviewNum) {
        return session.selectOne("Restreview.detail", reviewNum);
    }

    @Override
    public Double ratingAvg(Long review_Num) {
        return session.selectOne("rating.ratingAvg", review_Num);
    }

    @Override
    public void insert(ReviewDTO review) {
        session.insert("Restreview.insert",review);

    }
}
