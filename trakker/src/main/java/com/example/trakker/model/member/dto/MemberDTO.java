package com.example.trakker.model.member.dto;

import java.util.Date;

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

	public Integer getMem_num() {
		return mem_num;
	}

	public void setMem_num(Integer mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_pass() {
		return mem_pass;
	}

	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(int mem_birth) {
		this.mem_birth = mem_birth;
	}

	public int getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(int mem_gender) {
		this.mem_gender = mem_gender;
	}

	public Date getMem_join() {
		return mem_join;
	}

	public void setMem_join(Date mem_join) {
		this.mem_join = mem_join;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public int getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(int mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_address1() {
		return mem_address1;
	}

	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}

	public String getMem_address2() {
		return mem_address2;
	}

	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}

	public Date getMem_edit_date() {
		return mem_edit_date;
	}

	public void setMem_edit_date(Date mem_edit_date) {
		this.mem_edit_date = mem_edit_date;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getAdmin_ck() {
		return admin_ck;
	}

	public void setAdmin_ck(String admin_ck) {
		this.admin_ck = admin_ck;
	}

	@Override
	public String toString() {
		return "MemberDTO{" +
				"mem_num=" + mem_num +
				", mem_email='" + mem_email + '\'' +
				", mem_pass='" + mem_pass + '\'' +
				", mem_name='" + mem_name + '\'' +
				", mem_birth=" + mem_birth +
				", mem_gender=" + mem_gender +
				", mem_join=" + mem_join +
				", mem_phone='" + mem_phone + '\'' +
				", mem_zipcode=" + mem_zipcode +
				", mem_address1='" + mem_address1 + '\'' +
				", mem_address2='" + mem_address2 + '\'' +
				", mem_edit_date=" + mem_edit_date +
				", mem_nickname='" + mem_nickname + '\'' +
				", admin_ck='" + admin_ck + '\'' +
				'}';
	}
}