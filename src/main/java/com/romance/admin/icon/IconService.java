package com.romance.admin.icon;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IconService {

	IconVO getIcon();
	List<BannerVO> getBanner();
	void deleteIcon(IconVO vo);
	void insertIcon(MultipartFile iconFile, IconVO vo) throws IOException;
	void deleteBanner();
	void insertBanner(List<String> banner_name, List<MultipartFile> bannerFile, BannerVO vo) throws IOException;
	
	
}
