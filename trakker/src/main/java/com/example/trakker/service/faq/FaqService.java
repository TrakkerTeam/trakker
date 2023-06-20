// FaqService는 컨트롤러와 DAO 사이의 중개자 역할을 하며
//  FAQ에서 CRUD 작업을 위한 메서드를 제공합니다.

package com.example.trakker.service.faq;


import java.util.List;
import java.util.Map;

import com.example.trakker.model.faq.dto.FaqDTO;
import com.example.trakker.utils.PagingInfoVO;
import com.example.trakker.utils.ResponseResultList;
import javax.servlet.http.HttpSession;


public interface FaqService {
	List<FaqDTO> list() throws Exception;
	void insert(FaqDTO dto) throws Exception;
	void update(FaqDTO dto) throws Exception;
	void delete(int faq_num) throws Exception;
	void increaseViewcnt(int faq_num, HttpSession session) throws Exception;
	FaqDTO view(int faq_num) throws Exception;
	ResponseResultList listPage(PagingInfoVO vo);
}