package com.example.trakker.model.member.dto;

import lombok.*;

import java.util.Date;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	private Long mem_num;
	private String mem_email;
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private int mem_birth;
	private int mem_gender;
	private Date mem_join_date;
	private String mem_phone;
	private int mem_zipcode;
	private String mem_address1;
	private String mem_address2;
	private Date mem_edit_date;
	private String mem_nickname;
	private String admin_ck;
	private String picture_url;
}