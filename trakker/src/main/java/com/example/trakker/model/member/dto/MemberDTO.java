package com.example.trakker.model.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

//DB 의 member용 memberDTO 입니다.
@Getter
@Setter
@ToString
public class MemberDTO {
	private Integer mem_num; //MEM_NUM
	private String mem_email;  //MEM_EMAIL
	private String mem_pass;//MEM_PASS	varchar2(40)	not null,
	private String mem_name;//MEM_NAME	varchar2(40)	not null,
	private int mem_birth;//MEM_BIRTH	number	NOT NULL,
	private int mem_gender;//MEM_GENDER	number	NOT NULL,
	private Date mem_join;//MEM_JOIN_DATE date default sysdate,
	private String mem_phone;//MEM_PHONE	varchar2(40),
	private int mem_zipcode;//MEM_ZIPCODE	number	NOT NULL,
	private String mem_address1;//MEM_ADDRESS1	varchar2(60)	not null,
	private String mem_address2;//MEM_ADDRESS2	varchar2(40),
	private Date mem_edit_date;//MEM_EDIT_DATE	date,
	private String mem_nickname;//MEM_NICKNAME	varchar2(40)	not null,
	private String admin_ck;//ADMIN_CK varchar2(1) DEFAULT'0'
}