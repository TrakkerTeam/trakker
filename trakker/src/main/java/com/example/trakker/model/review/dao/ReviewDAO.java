//ReviewMapper 와 연결된 dao, DB에 접근함

package com.example.trakker.model.review.dao;

import com.example.trakker.model.review.dto.ReviewDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewDAO {

    List<ReviewDTO> getReviewList();

    void insert(ReviewDTO review);

    ReviewDTO detail(Integer review_num);

    void count(Integer review_num);
}
