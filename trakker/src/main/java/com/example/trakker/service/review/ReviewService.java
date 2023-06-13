package com.example.trakker.service.review;

import com.example.trakker.model.review.dto.ReviewDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ReviewService {

    List<ReviewDTO> list(int displayPost, int postNum, String searchType, String keyword);

    void insert(ReviewDTO review);

    void count(Integer review_num, HttpSession session);

    ReviewDTO detail(Integer review_num);

    void update(ReviewDTO review);

    void delete(Integer review_num);

    int total(String searchType, String keyword);

}
