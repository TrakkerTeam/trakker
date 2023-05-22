package com.example.trakker.service.faq;


import java.util.List;

import com.example.trakker.model.faq.dto.FaqDTO;


public interface FaqService {
	public List<FaqDTO> list();
	public void write(FaqDTO dto) throws Exception;
	
}
