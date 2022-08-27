package com.romance.socket;

import java.util.Date;

public class chatVO {
	int num;
	String real_chat_session;
	String real_chat_name;
	Date real_chat_date;
	String real_chat_content;
	String real_chat_state;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getReal_chat_session() {
		return real_chat_session;
	}
	public void setReal_chat_session(String real_chat_session) {
		this.real_chat_session = real_chat_session;
	}
	public String getReal_chat_name() {
		return real_chat_name;
	}
	public void setReal_chat_name(String real_chat_name) {
		this.real_chat_name = real_chat_name;
	}
	public Date getReal_chat_date() {
		return real_chat_date;
	}
	public void setReal_chat_date(Date real_chat_date) {
		this.real_chat_date = real_chat_date;
	}
	public String getReal_chat_content() {
		return real_chat_content;
	}
	public void setReal_chat_content(String real_chat_content) {
		this.real_chat_content = real_chat_content;
	}
	public String getReal_chat_state() {
		return real_chat_state;
	}
	public void setReal_chat_state(String real_chat_state) {
		this.real_chat_state = real_chat_state;
	}
	@Override
	public String toString() {
		return "chatVO [num=" + num + ", real_chat_session=" + real_chat_session + ", real_chat_name=" + real_chat_name
				+ ", real_chat_date=" + real_chat_date + ", real_chat_content=" + real_chat_content
				+ ", real_chat_state=" + real_chat_state + "]";
	}
	
}
