package com.example.trakker.model.admin.dto;

public class AdminDTO {

	private Long manager_num;
	private String manager_id;
	private String manager_pass;
	public Long getManager_num() {
		return manager_num;
	}
	public void setManager_num(Long manager_num) {
		this.manager_num = manager_num;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pass() {
		return manager_pass;
	}
	public void setManager_pass(String manager_pass) {
		this.manager_pass = manager_pass;
	}
	@Override
	public String toString() {
		return "AdminDTO [manager_num=" + manager_num + ", manager_id=" + manager_id + ", manager_pass=" + manager_pass
				+ "]";
	}
	
}
