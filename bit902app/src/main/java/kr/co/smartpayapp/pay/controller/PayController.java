package kr.co.smartpayapp.pay.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.smartpayapp.pay.service.PayService;
import kr.co.smartpayapp.repository.vo.BuyerVO;

@RestController
@RequestMapping("/book")
public class PayController {
	@Autowired
	PayService payService;


	@RequestMapping("/timeCheck.do")
	public List<BuyerVO> bookTimeCheck() {
		System.out.println("체크");
		List<BuyerVO> list = payService.checkBuyer();
		for(BuyerVO l : list) {
			System.out.println(l.getName());
		}
		return list;
	}
	
}