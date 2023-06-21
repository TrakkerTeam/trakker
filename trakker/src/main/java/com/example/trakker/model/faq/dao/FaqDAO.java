//FAQ 클래스에서 구현할 수 있는 메서드를 선언합니다

package com.example.trakker.model.faq.dao;

import java.util.List;
import java.util.Map;

import com.example.trakker.model.faq.dto.FaqDTO;
import javax.servlet.http.HttpSession;


public interface FaqDAO {
    List<FaqDTO> list() throws Exception;
    void insert(FaqDTO dto) throws Exception;
    void update(FaqDTO dto) throws Exception;
    void delete(long faq_num) throws Exception;
    void increaseViewcnt(long faq_num, HttpSession session) throws Exception;
    FaqDTO view(long faq_num) throws Exception;
    Integer count(Map data);
    List<FaqDTO> listPage(Map data);

}