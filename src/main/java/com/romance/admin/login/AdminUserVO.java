package com.romance.admin.login;

public class AdminUserVO {
	private String user_id;
	private String user_password;
	private String user_role;
	private String user_name;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Override
	public String toString() {
		return "AdminUserVO [user_id=" + user_id + ", user_password=" + user_password + ", user_role=" + user_role
				+ ", user_name=" + user_name + "]";
	}
	
	
}
