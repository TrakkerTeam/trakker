package com.example.trakker.model.faq.dao;

import java.util.List;
import java.util.Map;

import com.example.trakker.model.faq.dto.FaqDTO;



public interface FaqDAO {
    List<FaqDTO> list() throws Exception;
    void insert(FaqDTO dto) throws Exception;
    void update(FaqDTO dto) throws Exception;
    void delete(long faq_num) throws Exception;
    void increaseViewcnt(long faq_num) throws Exception;
    FaqDTO view(long faq_num) throws Exception;
    int count(Map data);
    List<FaqDTO> listPage(Map data);

}