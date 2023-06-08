package com.example.trakker.service.review;

import com.example.trakker.model.review.dao.ReviewDAO;
import com.example.trakker.model.review.dto.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDAO reviewDao;

    public List<ReviewDTO> list() {
        return reviewDao.list();
    }

    public void insert(ReviewDTO review) {
        reviewDao.insert(review);
    }

    public void count(Integer review_num, HttpSession session) {
        reviewDao.count(review_num,session);
    }

    public ReviewDTO detail(Integer review_num) {
        return reviewDao.detail(review_num);
    }

    @Override
    public void update(ReviewDTO review) {
        reviewDao.update(review);
    }

    @Override
    public void delete(Integer review_num) {
        reviewDao.delete(review_num);
    }

}
