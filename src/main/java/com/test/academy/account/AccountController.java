package com.test.academy.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AccountDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

@Controller
public class AccountController {

	@Autowired
	private AccountService service;

	/**
    * @author 김동석
    * <p> 회원 가입 페이지를 불러오는 메소드입니다.</p>
    * @return String
    */
	@GetMapping(value = "/account/register")
	public String register() {

		return "a.account.register";
	}
	/**
    * @author 김동석
    * <p> 학생 회원 가입 페이지를 메소드입니다.</p>
    * @return String
    */
	@GetMapping(value = "/account/sturegister")
	public String sturegister() {

		return "a.account.sturegister";
	}

	/**
	 * @author 김동석
	 * <p> 학원 회원 가입 페이지를 메소드입니다.</p>
	 * @return String
	 */
	@GetMapping(value = "/account/acaregister")
	public String acaregister() {

		return "a.account.acaregister";

	}
	
	/**
    * @author 김동석
    * <p>  회원 가입 완료 페이지를 불러오는 메소드입니다.</p>
    * @return String
    */
	@GetMapping(value = "/account/registerok")
	public String registerok() {

		return "a.account.registerok";

	}
	
	/**
    * @author 김동석
    * <p>  학원 회원 가입을 위한 SQL문을 실행하는 메소드입니다.</p>
    * @param dto 학원 정보를 담을 DTO 객체
    * @param req HTML 태그 내의 정보를 불러오는 객체
    * @return String
    */
	@PostMapping(value = "/account/acaregisterok")
	public String acaregisterok(HttpServletRequest req, HttpServletResponse resp, AccountDTO dto) {
		dto.setActseq(Integer.parseInt(req.getParameter("actseq")));
		int result = service.acaregister(dto);
		System.out.println(dto);
		

		if (result == 1) {
			return "redirect:/account/registerok";
		} else {
			return "redirect:/account/register";
		}
	}

	/**
	 * @author 김동석
	 * <p>  학생 회원 가입을 위한 SQL문을 실행하는 메소드입니다.</p>
	 * @param dto 학생 정보를 담을 DTO 객체
	 * @param req HTML 태그 내의 정보를 불러오는 객체
	 * @return String
	 */
	@PostMapping(value = "/account/sturegisterok")
	public String sturegisterok(HttpServletRequest req, HttpServletResponse resp, AccountDTO dto) {

		dto.setStubirth(req.getParameter("yy") + req.getParameter("mm") + req.getParameter("dd"));
		
		int result = service.sturegister(dto);

		if (result == 1) {
		
			return "redirect:/account/registerok";
		} else {
		
			return "redirect:/account/register";
		}
	}
	
}
