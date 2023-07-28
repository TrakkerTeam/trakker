package com.example.trakker.model.restReview;


import com.example.trakker.model.review.dto.ReviewDTO;

import java.util.List;
import java.util.Map;

public interface RestReviewDAO {

    Long count(Map param);
    List<ReviewDTO> list(Map param);


}
