package kr.co.smartpayweb.Adjust.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.smartpayweb.Adjust.service.AdjustService;
import kr.co.smartpayweb.repository.vo.dayAdjustVO;

@Controller
@RequestMapping("/adjust")
public class AdjustController {
	@Autowired
	AdjustService adjustService;
	
	// ---- 일일정산 첫화면----
	@RequestMapping("/dayAdjust.do")
	public ModelAndView retrieveDayAdjust() throws ServletException, IOException {
		
		List<dayAdjustVO> retrieveDayAdjust = adjustService.retrieveDayAdjust();
		System.out.println(retrieveDayAdjust.size());
		ModelAndView mav = new ModelAndView("adjust/adjust");
		mav.addObject("retrieveDayAdjust", retrieveDayAdjust);
		return mav;
	}
	
	@RequestMapping("/dayAdjustRe.do")
	public ModelAndView retrieveDayAdjustRe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String dDay = request.getParameter("dDay");
		System.out.println(dDay);
		List<dayAdjustVO> retrieveDayAdjust = adjustService.retrieveDayAdjustRe(dDay);
		System.out.println("콘트롤러" + retrieveDayAdjust.size());
		ModelAndView mav = new ModelAndView("adjust/adjust");
		mav.addObject("retrieveDayAdjust", retrieveDayAdjust);
		return mav;
	}
}
