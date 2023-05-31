package com.example.trakker.service.faq;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.trakker.model.faq.dao.FaqDAO;
import com.example.trakker.model.faq.dto.FaqDTO;

import javax.servlet.http.HttpSession;


@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	FaqDAO faqDao;

	@Override
	public List<FaqDTO> list() throws Exception {
		return faqDao.list();
	}

	@Override
	public void create(FaqDTO dto) throws Exception {
		faqDao.create(dto);
		
	}
	@Override
	public void update(FaqDTO dto) throws Exception {
		faqDao.update(dto);
	}

	@Override
	public void delete(int faq_num) throws Exception {
		faqDao.delete(faq_num);
	}

	@Override
	public void increaseViewcnt(int faq_num, HttpSession session) throws Exception {
		faqDao.increaseViewcnt(faq_num);
	}

	@Override
	public FaqDTO read(int faq_num) throws Exception {
		return faqDao.read(faq_num);
	}
}
