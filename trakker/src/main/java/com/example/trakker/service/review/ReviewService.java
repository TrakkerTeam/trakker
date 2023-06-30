package com.example.trakker.service.review;

import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


public interface ReviewService {

    ResponseResultList list(PagingInfoVO vo);

    void insert(ReviewDTO review);

    void count(long review_num, HttpServletRequest request, HttpServletResponse response);

    ReviewDTO detail(long review_num);

    void update(ReviewDTO review);

    void delete(long review_num);

    //리뷰 총점
    Double ratingAvg(long review_num);

    void ratingInsert(RatingDTO dto);

    List<ReviewDTO> main_list();

    ResponseResultList r_list(PagingInfoVO vo , Long mem_num);
}
