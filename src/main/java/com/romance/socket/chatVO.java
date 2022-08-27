package com.romance.socket;

import java.util.Date;

public class chatVO {
	int num;
	String sessionid;
	String name;
	Date regdate;
	String content;
	String state;
	@Override
	public String toString() {
		return "chatVO [num=" + num + ", sessionid=" + sessionid + ", name=" + name + ", regdate=" + regdate
				+ ", content=" + content + ", state=" + state + "]";
	}
	
	
	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getSessionid() {
		return sessionid;
	}
	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
