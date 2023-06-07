//FAQ 엔터티를 나타내는 DTO 클래스를 정의합니다.

package com.example.trakker.model.faq.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FaqDTO {

	private int faq_num;
	private String faq_subject;
	private String content;
	private int readcount;
	private Date faq_reg_date;
}
