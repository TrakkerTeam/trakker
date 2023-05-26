package com.example.trakker.model.faq.dto;

import java.sql.Clob;
import java.util.Date;

public class FaqDTO {

	private int faq_num;
	private String faq_subject;
	private Clob content;
	private int readcount;
	private Date faq_reg_date;

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getFaq_reg_date() {
		return faq_reg_date;
	}

	public void setFaq_reg_date(Date faq_reg_date) {
		this.faq_reg_date = faq_reg_date;
	}

	@Override
	public String toString() {
		return "FaqDTO{" +
				"faq_num=" + faq_num +
				", faq_subject='" + faq_subject + '\'' +
				", content='" + content + '\'' +
				", readcount=" + readcount +
				", faq_reg_date=" + faq_reg_date +
				'}';
	}

	public FaqDTO(int faq_num, String faq_subject, Clob content, int readcount, Date faq_reg_date) {
		this.faq_num = faq_num;
		this.faq_subject = faq_subject;
		this.content = content;
		this.readcount = readcount;
		this.faq_reg_date = faq_reg_date;
	}

	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public Clob getContent() {
		return content;
	}
	public void setContent(Clob content) {
		this.content = content;
	}

	public FaqDTO() {
		
	}
}
