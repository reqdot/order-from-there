package kr.co.smartpayapp.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.smartpayapp.repository.mapper.LoginMapper;
import kr.co.smartpayapp.repository.vo.BuyerVO;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginMapper mapper;
	public List<BuyerVO> checkBuyer() {
		return mapper.selectBuyer();
	}
	public int registBuyer(BuyerVO buyerVO) {
		return mapper.insertBuyer(buyerVO);
	}
}