package com.example.trakker.service.faq;


import java.util.List;


import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface FaqService {
    List<FaqDTO> list() throws Exception;
    void insert(FaqDTO dto) throws Exception;
    void update(FaqDTO dto) throws Exception;
    void delete(long faq_num) throws Exception;
    void increaseViewcnt(long faq_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
    FaqDTO view(long faq_num) throws Exception;
    ResponseResultList listPage(PagingInfoVO vo);
}