package com.example.trakker.service.faq;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.trakker.model.faq.dao.FaqDAO;
import com.example.trakker.model.faq.dto.FaqDTO;



@Service
public class FaqServiceImpl implements FaqService {
	
	@Inject
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
