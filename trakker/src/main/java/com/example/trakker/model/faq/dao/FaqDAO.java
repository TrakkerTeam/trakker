package com.example.trakker.model.faq.dao;

import java.util.List;


import com.example.trakker.model.faq.dto.FaqDTO;


public interface FaqDAO {
	public List<FaqDTO> list();
	public void write(FaqDTO dto) throws Exception;

}
