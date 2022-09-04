package com.romance.admin.icons.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.icon.BannerVO;
import com.romance.admin.icon.IconService;
import com.romance.admin.icon.IconVO;

@Service("IconService")
public class IconServiceImpl implements IconService {

	@Autowired
	private IconDAO iconDAO;
	
	@Override
	public IconVO getIcon(IconVO vo) {
		return iconDAO.getIcon(vo);
	}

	@Override
	public BannerVO getBanner(BannerVO vo) {
		return iconDAO.getBanner(vo);
	}

	@Override
	public void updateIcon(IconVO vo) {
		iconDAO.updateIcon(vo);
	}

	@Override
	public void updateBanner(BannerVO vo) {
		iconDAO.updateBanner(vo);
	}

}
