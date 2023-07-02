//FAQ 클래스에서 구현할 수 있는 메서드를 선언합니다

package com.example.trakker.model.faq.dao;

import java.util.List;
import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;


@Repository
public interface FaqDAO {
    List<FaqDTO> list() throws Exception;
    void insert(FaqDTO dto) throws Exception;
    void update(FaqDTO dto) throws Exception;
    void delete(int faq_num) throws Exception;
    void increaseViewcnt(int faq_num, HttpSession session) throws Exception;
    FaqDTO view(int faq_num) throws Exception;
    ResponseResultList listPage(PagingInfoVO vo);
}