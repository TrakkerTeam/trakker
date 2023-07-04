package com.example.trakker.service.review;

import com.example.trakker.item.RatingDTO;
import com.example.trakker.model.review.dao.ReviewDAO;
import com.example.trakker.model.review.dto.ReviewDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDAO reviewDao;


    @Override
    public ResponseResultList list(PagingInfoVO vo) {
        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());
        data.put("area", vo.getArea());
        data.put("sort", vo.getSort());
        int total = reviewDao.total(data);
        List<ReviewDTO> list = reviewDao.list(data);
        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), total, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(list);
        resultList.setPagingInfo(pagingInfoVO);
        return resultList;
    }

    @Override
    public void insert(ReviewDTO review) {
        reviewDao.insert(review);
    }

    @Override
    public void count(long review_num, HttpServletRequest request, HttpServletResponse response) {

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
                        reviewDao.count(review_num);
                        break;
                    }
                }
            }
        }

        if (!visited) {
            Cookie newCookie = new Cookie("visit_cookie", "_" + request.getParameter("review_num") + "_");
            newCookie.setMaxAge(60 * 60);
            response.addCookie(newCookie);
            reviewDao.count(review_num);
        }
    }

    @Override
    public ReviewDTO detail(long review_num) {
        return reviewDao.detail(review_num);
    }

    @Override
    public void update(ReviewDTO review) {
        reviewDao.update(review);
    }

    @Override
    public void delete(long review_num) {
        reviewDao.delete(review_num);
    }

    @Override
    public Double ratingAvg(long review_num) {

        return reviewDao.ratingAvg(review_num);
    }

    @Override
    public void ratingInsert(RatingDTO dto) {
        reviewDao.ratingInsert(dto);

    }

    @Override
    public List<ReviewDTO> main_list() {
        return reviewDao.main_list();
    }

    @Override
    public ResponseResultList r_list(PagingInfoVO vo, Long mem_num) {
        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());
        data.put("area", vo.getArea());
        data.put("sort", vo.getSort());
        data.put("mem_num", mem_num);
        int total = reviewDao.total(data);
        List<ReviewDTO> list = reviewDao.r_list(data);
        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), total, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(list);
        resultList.setPagingInfo(pagingInfoVO);
        return resultList;
    }


}
