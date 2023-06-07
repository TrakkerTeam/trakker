//ReviewDAO로 데이터베이스에 접근하고 ReviewDTO에서 값을 받아서 처리함

package com.example.trakker.service.review;

import com.example.trakker.model.review.dao.ReviewDAO;
import com.example.trakker.model.review.dto.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewDAO reviewDao;

    public List<ReviewDTO> getReviewList() {
        return reviewDao.getReviewList();
    }

    public void insert(ReviewDTO review) {
        reviewDao.insert(review);
    }

    public ReviewDTO detail(Integer review_num) {
        return reviewDao.detail(review_num);
    }

    public void count(Integer review_num, HttpSession session) {
        reviewDao.count(review_num);
    }

}
