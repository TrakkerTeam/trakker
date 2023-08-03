package com.example.trakker.service.restReview;

import com.example.trakker.model.restReview.RestReviewDAO;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class RestReviewServiceImpl implements RestReviewService{

    @Autowired
    private RestReviewDAO reviewDAO;
    private static final List<ReviewDTO> reviews = new ArrayList<>();
    @Override
    public ResponseResultList list(PagingInfoVO vo, Long memNum, String urlCheck) {

        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("area", vo.getArea());
        data.put("sort", vo.getSort());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());

        Long count = reviewDAO.count(data);
        List<ReviewDTO> review = reviewDAO.list(data);

        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), count, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(review);
        resultList.setPagingInfo(pagingInfoVO);

        return resultList;

    }

    @Override
    public void count(Long review_num, HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        boolean visited = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("visit_cookie")) {
                    if (cookie.getValue().contains("_" + request.getParameter("review_num") + "_")) {
                        visited = true;
                        break;
                    } else {
                        cookie.setValue(cookie.getValue() + "_" + request.getParameter("review_num") + "_");
                        cookie.setMaxAge(60 * 60);
                        response.addCookie(cookie);
                        visited = true;
                        reviewDAO.updateREAD(review_num);
                        break;
                    }
                }
            }
        }
    }

    @Override
    public ReviewDTO detail(Long reviewNum) {
        return reviewDAO.detail(reviewNum);
    }


    @Override
    public Double ratingAvg(Long review_num) {
        return reviewDAO.ratingAvg(review_num);
    }

    @Override
    public void insert(ReviewDTO review) {
        reviewDAO.insert(review);
    }

    @Override
    public void update(Long review_Num,ReviewDTO review) {
        reviews.stream().
                forEach(reviewID ->{
                if (reviewID.getReview_num() == review_Num){
                    reviewDAO.update(review);
                }
        });

    }

    @Override
    public void delete(Long reviewNum) {
        reviewDAO.delete(reviewNum);
    }
}
