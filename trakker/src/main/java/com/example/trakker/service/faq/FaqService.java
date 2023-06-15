// FaqService는 컨트롤러와 DAO 사이의 중개자 역할을 하며
//  FAQ에서 CRUD 작업을 위한 메서드를 제공합니다.

package com.example.trakker.service.faq;

import java.util.List;
import com.example.trakker.model.faq.dao.FaqDAO;
import com.example.trakker.model.faq.dto.FaqDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
public class FaqService {

	@Autowired
	FaqDAO faqDao;

	public List<FaqDTO> list() throws Exception {
		return faqDao.list();
	}

	public void insert(FaqDTO dto) throws Exception {
		faqDao.insert(dto);
	}

	public void update(FaqDTO dto) throws Exception {
		faqDao.update(dto);
	}

	public void delete(int faq_num) throws Exception {
		faqDao.delete(faq_num);
	}

	public void increaseViewcnt(int faq_num, HttpSession session) throws Exception {
		faqDao.increaseViewcnt(faq_num, session);
		long update_time=0;
		if(session.getAttribute("update_time_"+faq_num)!=null) {
			update_time=(long)session.getAttribute("update_time_"+faq_num);
		}
		long current_time=System.currentTimeMillis();
		if(current_time - update_time > 5*1000) {
			faqDao.increaseViewcnt(faq_num, session);
			session.setAttribute("update_time_"+faq_num, current_time);
		}
	}


	public FaqDTO view(int faq_num) throws Exception {
		return faqDao.view(faq_num);
	}

	public int count() throws Exception{
		return faqDao.count();
	}

	public List<FaqDTO> listPage(int displayPost, int postNum) throws Exception {
		return faqDao.listPage(displayPost, postNum);
	}

}