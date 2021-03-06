package kr.co.smartpayapp.menu.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.MenuMapper;
import kr.co.smartpayapp.repository.vo.MenuVO;
import kr.co.smartpayapp.repository.vo.StoreFileVO;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper dao;
	
	@Override
	public Map<String, Object> list(int sellerNo) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("menu",dao.getStoreByStoreNo(sellerNo));
		result.put("menuFile",dao.selectStoreFileByNo(sellerNo));
		return result;
	}

	@Override
	public void write(Map<String, Object> param) throws Exception {
		MenuVO menu = (MenuVO)param.get("menu");
		dao.insertMenu(menu);
		StoreFileVO menuFile = (StoreFileVO)param.get("menuFile");
		if (menuFile != null) {
			menuFile.setMenuNo(menu.getMenuNo());
			dao.insertMenuFile(menuFile);
		}
	}
}
