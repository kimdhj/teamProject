package com.romance.admin.icon.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.romance.admin.icon.BannerVO;
import com.romance.admin.icon.IconService;
import com.romance.admin.icon.IconVO;
import com.romance.server.AwsS3;

@Service("IconService")
public class IconServiceImpl implements IconService {

	@Autowired
	private IconDAO iconDAO;

	@Override
	public IconVO getIcon() {
		return iconDAO.getIcon();
	}

	@Override
	public List<BannerVO> getBanner() {
		return iconDAO.getBanner();
	}

	@Override
	public void deleteIcon(IconVO vo) throws FileNotFoundException, IOException {
		AwsS3 awsS3 = AwsS3.getInstance();
		String key = null;
		if (vo.getIcon_file() != null) {
			key = vo.getIcon_file();
			key = key.replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", "");
		}
		iconDAO.deleteIcon();
		if (key != null) {
			awsS3.delete(key);
		}
	}

	@Override
	public void insertIcon(@RequestParam(name = "iconFile") MultipartFile iconFile, IconVO vo) throws IOException {
		if (!iconFile.isEmpty()) {
			String filename = iconFile.getOriginalFilename();
			String expand = filename.substring(filename.indexOf("."));
			String key = UUID.randomUUID().toString() + expand;
			System.out.println(key + " :key");
			InputStream is = iconFile.getInputStream();
			String contentType = iconFile.getContentType();
			long contentLength = iconFile.getSize();
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.upload(is, key, contentType, contentLength);
			String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
			vo.setIcon_file(uploadFolder + key);
		}
		iconDAO.insertIcon(vo);
	}

	@Override
	public void deleteBanner() throws FileNotFoundException, IOException {
		AwsS3 awsS3 = AwsS3.getInstance();
		String key = null;
		List<String> vo = new ArrayList<>();
		vo = iconDAO.getFileAddress();
		for (int j = 0; j < vo.size(); j++) {
			if (vo.get(j) != null) {
				key = vo.get(j);
				key = key.replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", "");
			}
			if (key != null) {
				awsS3.delete(key);
			}
			iconDAO.deleteBanner();
		}
	}

	@Override
	public void insertBanner(List<String> banner_name, List<MultipartFile> bannerFile, BannerVO vo) throws IOException {
		for (int k = 0; k < bannerFile.size(); k++) {
			if (!bannerFile.get(k).isEmpty()) {
				String filename = bannerFile.get(k).getOriginalFilename();
				String expand = filename.substring(filename.indexOf("."));
				String key = UUID.randomUUID().toString() + expand;
				System.out.println(key + " :key");
				InputStream is = bannerFile.get(k).getInputStream();
				String contentType = bannerFile.get(k).getContentType();
				long contentLength = bannerFile.get(k).getSize();
				AwsS3 awsS3 = AwsS3.getInstance();
				awsS3.upload(is, key, contentType, contentLength);
				String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
				vo.setBanner_file(uploadFolder + key);
				vo.setBanner_name(banner_name.get(k));
			}
			iconDAO.insertBanner(vo);
		}

	}

}
