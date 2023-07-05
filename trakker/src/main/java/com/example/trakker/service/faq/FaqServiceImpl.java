package com.example.trakker.service.faq;

import java.util.HashMap;
import java.util.List;

import com.example.trakker.model.faq.dao.FaqDAO;
import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Service
public class FaqServiceImpl implements FaqService {

    @Autowired
    private FaqDAO faqDao;

    @Override
    public List<FaqDTO> list() throws Exception {
        return faqDao.list();
    }
    @Override
    public void insert(FaqDTO dto) throws Exception {
        faqDao.insert(dto);
    }
    @Override
    public void update(FaqDTO dto) throws Exception {
        faqDao.update(dto);
    }
    @Override
    public void delete(long faq_num) throws Exception {
        faqDao.delete(faq_num);
    }
    @Override
    public void increaseViewcnt(long faq_num, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Cookie[] cookies = request.getCookies();
        boolean visited = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("visit_cookie")) {
                    if (cookie.getValue().contains("_" + request.getParameter("faq_num") + "_")) {
                        visited = true;
                        break;
                    } else {
                        cookie.setValue(cookie.getValue() + "_" + request.getParameter("faq_num") + "_");
                        cookie.setMaxAge(60 * 60);
                        response.addCookie(cookie);
                        visited = true;
                        faqDao.increaseViewcnt(faq_num);
                        break;
                    }
                }
            }
        }

        if (!visited) {
            Cookie newCookie = new Cookie("visit_cookie", "_" + request.getParameter("faq_num") + "_");
            newCookie.setMaxAge(60 * 60);
            response.addCookie(newCookie);
            faqDao.increaseViewcnt(faq_num);
        }
    }
    @Override
    public FaqDTO view(long faq_num) throws Exception {
        return faqDao.view(faq_num);
    }
    @Override
    public ResponseResultList listPage(PagingInfoVO vo){
        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("pageNum", vo.getPageNum());
        data.put("pageRowCount", vo.getPageRowCount());
        data.put("searchType", vo.getStype());
        data.put("keyword", vo.getSdata());
        int count = faqDao.count(data);
        List<FaqDTO>  list = faqDao.listPage(data);

        PagingInfoVO pagingInfoVO = new PagingInfoVO(vo.getPageNum(), count, vo.getPageRowCount());
        ResponseResultList resultList = new ResponseResultList();
        resultList.setBody(list);
        resultList.setPagingInfo(pagingInfoVO);
        return resultList;
    }

}