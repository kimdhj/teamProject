package com.romance.admin.icon;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BannerVO {

	private int banner_seq;
	private String banner_name;
	private String banner_file;
	private MultipartFile bannerFile;
	
	
}
