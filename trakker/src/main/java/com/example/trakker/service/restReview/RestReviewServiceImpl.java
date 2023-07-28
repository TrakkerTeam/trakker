package com.example.trakker.service.restReview;

import com.example.trakker.model.planner.dto.PlannerDTO;
import com.example.trakker.model.restReview.RestReviewDAO;
import com.example.trakker.model.review.dao.ReviewDAO;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class RestReviewServiceImpl implements RestReviewService{

    @Autowired
    private RestReviewDAO reviewDAO;
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
}
