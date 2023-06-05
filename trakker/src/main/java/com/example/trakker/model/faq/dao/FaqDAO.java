package com.example.trakker.model.faq.dao;

import java.util.List;


import com.example.trakker.model.faq.dto.FaqDTO;

import javax.servlet.http.HttpSession;


public interface FaqDAO {
	public List<FaqDTO> list() throws Exception;
	public void create(FaqDTO dto) throws Exception;
	public void update(FaqDTO dto) throws Exception;
	public void delete(int faq_num) throws Exception;
	public void increaseViewcnt(int faq_num) throws Exception;
	public FaqDTO read(int faq_num) throws Exception;

}
