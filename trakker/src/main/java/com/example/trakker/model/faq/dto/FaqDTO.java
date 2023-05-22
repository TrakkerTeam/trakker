package com.example.trakker.model.faq.dto;

public class FaqDTO {

	private int faq_num;
	private String faq_writer;
	private String faq_subject;
	private String content;
	
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_writer() {
		return faq_writer;
	}
	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "FaqDTO [faq_num=" + faq_num + ", faq_writer=" + faq_writer + ", faq_subject=" + faq_subject
				+ ", content=" + content + "]";
	}
	public FaqDTO() {
		
	}
}
