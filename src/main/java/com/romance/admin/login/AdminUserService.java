package com.romance.admin.login;

public interface AdminUserService {
	public AdminUserVO getUser(AdminUserVO vo);
	public void loginDay(String user_id);
}
