package com.romance.admin.icon;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class IconVO {

	private int icon_seq;
	private String icon_name;
	private String icon_file;
	private MultipartFile iconFile;
	
	
}
