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
import javax.servlet.http.HttpSession;
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
        List<ReviewDTO>  list = reviewDao.list(data);
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

        if (cookies != null) { // 배열이 null이 아니면
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("visit_cookie")) { // 쿠키 이름이 "visit_cookie"인 경우에만 내부 블록 실행
                    if (cookie.getValue().contains("_" + request.getParameter("review_num") + "_")) {// 쿠키 값 == 현재 리뷰 번호
                        visited = true;
                        break;
                    } else { // 포함하지 않은 경우
                        cookie.setValue(cookie.getValue() + "_" + request.getParameter("review_num") + "_");
                        cookie.setMaxAge(60 * 60); // 1시간 설정 (초 단위)
                        response.addCookie(cookie); // 클라이언트 전송
                        visited = true;
                        reviewDao.count(review_num); // 조회수 증가
                        break;
                    }
                }
            }
        }

        if (!visited) { // visited = false 인 경우
            //review_num 파라미터 값 가져옴.
            //새로운 cookie 생성
            Cookie newCookie = new Cookie("visit_cookie", "_" + request.getParameter("review_num") + "_");
            newCookie.setMaxAge(60 * 60); // 1시간 설정 (초 단위)
            response.addCookie(newCookie);// 새로운 쿠키 응답 추가
            reviewDao.count(review_num); // 조회수 증가
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
        data.put("mem_num",mem_num);
        int total = reviewDao.total(data);
        List<ReviewDTO>  list = reviewDao.r_list(data);
        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), total, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(list);
        resultList.setPagingInfo(pagingInfoVO);
        return resultList;
    }


}

