package kr.co.smartpayweb.menu.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayweb.repository.mapper.MenuMapper;
import kr.co.smartpayweb.repository.vo.MenuVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper dao;
	
	//메뉴 조회
	@Override
	public Map<String, Object> list(int sellerNo) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("menu",dao.getStoreByStoreNo(sellerNo));
		result.put("menuFile",dao.selectStoreFileByNo(sellerNo));
	
		System.out.println("임플까지");
		return result;
	}
	//메뉴 등록
	@Override
	public void write(Map<String, Object> param) throws Exception {
		MenuVO menu = (MenuVO)param.get("menu");
		dao.insertMenu(menu);
		StoreFileVO menuFile = (StoreFileVO)param.get("menuFile");
		System.out.println("메뉴이동결로 저장:" + menuFile.getFilePath());
		if (menuFile != null) {
			System.out.println("파일옴");
			menuFile.setMenuNo(menu.getMenuNo());
			dao.insertMenuFile(menuFile);
			System.out.println("저장됨");
		}
	}
	//메뉴 삭제(활성화, 비활성화 상태변경)-db저장
	public void delete(int menuNo) throws Exception {
		dao.delete(menuNo);
	}
	//메뉴 변경form으로 이동
	@Override
	public Map<String, Object> updateForm(int menuNo) throws Exception{
		System.out.println("컨트롤러2");
		Map<String, Object> result = new HashMap<>();
		result.put("menu", dao.updateForm(menuNo));
		result.put("menufile", dao.updateFormStoreFileByNo(menuNo));
		
		return result;
	}
	//메뉴 변경
	public void menuUpdate(MenuVO menu) throws Exception {
		dao.menuUpdate(menu);
		
	}

}

