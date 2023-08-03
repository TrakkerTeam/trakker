package com.example.trakker.service.restReview;

import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface RestReviewService {

    ResponseResultList list(PagingInfoVO vo, Long memNum, String urlCheck);

    void count(Long reviewNum, HttpServletRequest request, HttpServletResponse response);

    ReviewDTO detail(Long reviewNum);

    Double ratingAvg(Long reviewNum);

    void insert(ReviewDTO review);

    void update(Long review_num,ReviewDTO review);

    void delete(Long reviewNum);
}
