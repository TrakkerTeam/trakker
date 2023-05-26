package com.example.trakker.service.faq;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.trakker.model.faq.dao.FaqDAO;
import com.example.trakker.model.faq.dto.FaqDTO;



@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	FaqDAO faqDao;

	@Override
	public List<FaqDTO> list() {
		return faqDao.list();
	}

	@Transactional
	@Override
	public void write(FaqDTO dto) throws Exception {
		faqDao.write(dto);
		
	}

}
