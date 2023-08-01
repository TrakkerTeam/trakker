package com.example.trakker.model.restReview;


import com.example.trakker.model.review.dto.ReviewDTO;

import java.util.List;
import java.util.Map;

public interface RestReviewDAO {

    Long count(Map param);
    List<ReviewDTO> list(Map param);


    void updateREAD(Long reviewNum);

    ReviewDTO detail(Long reviewNum);

    Double ratingAvg(Long reviewNum);

    void insert(ReviewDTO review);

    void update(ReviewDTO review);

}
