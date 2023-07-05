package com.test.academy.codingtest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.academy.dto.CodingTestDTO;

@Controller
public class CodingTestController {

	@Autowired
	private CodingTestService service;
	
	/**
	 * 코딩테스트 문제들을 데이터베이스에서 받아 list로 나타낸 메소드
	 * @author 김유진
	 * @param model
	 * @return
	 */
	@GetMapping(value="/codingtest/codingtestlist")
	public String codingtestlist(Model model) {
		
		List<CodingTestDTO> codingtestlist = service.codingtestlist();
		
		model.addAttribute("codingtestlist", codingtestlist);
		
		return "a.codingtest.codingtestlist";
	}
	
	/**
	 * 코딩테스트 문제를 클릭시 해당 문제의 사진을 나타내는 페이지로 이동하는 메소드
	 * @author 김유진
	 * @param model
	 * @param ctseq
	 * @param req
	 * @return
	 */
	@GetMapping(value="/codingtest/codingtestview")
	public String codingtestview(Model model, String ctseq, HttpServletRequest req) {
		
		String seq = req.getParameter("ctseq");
		
		CodingTestDTO codedto = service.codingtestview(ctseq);
		
		codedto.setCtseq(seq);
		
		
		model.addAttribute("codedto", codedto);
		
		return "a.codingtest.codingtestview";
	}
	
}
