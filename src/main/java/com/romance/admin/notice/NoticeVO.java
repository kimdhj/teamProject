package com.romance.admin.notice;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int notice_seq;
	private String notice_title;
	private String notice_writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date notice_date;
	private String notice_content;
	private MultipartFile notice_file;
	private String notice_fileName;
	private String notice_location;
	private String notice_passwd;
	private int notice_cnt;
	
	public String getNotice_fileName() {
		return notice_fileName;
	}
	public void setNotice_fileName(String notice_fileName) {
		this.notice_fileName = notice_fileName;
	}
	public int getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public MultipartFile getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(MultipartFile notice_file) {
		this.notice_file = notice_file;
	}
	public String getNotice_location() {
		return notice_location;
	}
	public void setNotice_location(String notice_location) {
		this.notice_location = notice_location;
	}
	public String getNotice_passwd() {
		return notice_passwd;
	}
	public void setNotice_passwd(String notice_passwd) {
		this.notice_passwd = notice_passwd;
	}
	public int getNotice_cnt() {
		return notice_cnt;
	}
	public void setNotice_cnt(int notice_cnt) {
		this.notice_cnt = notice_cnt;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_seq=" + notice_seq + ", notice_title=" + notice_title + ", notice_writer="
				+ notice_writer + ", notice_date=" + notice_date + ", notice_content=" + notice_content
				+ ", notice_file=" + notice_file + ", notice_location=" + notice_location + ", notice_passwd="
				+ notice_passwd + ", notice_cnt=" + notice_cnt + "]";
	}
}
