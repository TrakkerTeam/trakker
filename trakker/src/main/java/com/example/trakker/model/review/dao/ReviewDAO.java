package com.example.trakker.model.review.dao;


import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface ReviewDAO {

    List<ReviewDTO> list(Map data);

    void insert(ReviewDTO review);

    void count(long review_num);

    ReviewDTO detail(long review_num);

    void update(ReviewDTO review);

    void delete(long review_num);

    Double ratingAvg(long review_num);

    void ratingInsert(RatingDTO dto);

    List<ReviewDTO> main_list();

    int total(Map data);

    List<ReviewDTO> r_list(Map data);
}
