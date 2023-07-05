package com.test.academy.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;
import com.test.academy.student.StudentDAO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	/**
	 * 로그인 페이지로 이동하는 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping(value="/account/login")
	public String Login() {
		
		
		return "a.account.login";
		
	}
	
	/**
	 * 로그인 페이지에서 데이터베이스에 있는 학생, 학원, 관리자의 정보를 가져와 로그인하는 메소드
	 * @author 김유진
	 * @param logintype
	 * @param session
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException
	 */
	@PostMapping(value="/account/loginok")
	public String loginok(String logintype, HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();

		if (logintype.equals("1")) {
			//학생일떄
			StudentDTO sdto = new StudentDTO(); 
			
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			
			sdto.setStuid(id);
			sdto.setStupw(pw);
			
			
			int result = service.studentLoginok(sdto);
			
					
			
			if (result == 1) {
				StudentDTO stuinfo = service.getStuinfo(sdto);
				
				session.setAttribute("stuid", sdto.getStuid());
				session.setAttribute("stupw", sdto.getStupw());
				session.setAttribute("alseq", sdto.getAlseq());
				session.setAttribute("stuinfo", stuinfo);
				
				
				
				return "redirect:/academy/index";
				
			} else {
				
				
				return "redirect:/account/loginfail";
			}
			
			
		} else if (logintype.equals("2")) {
			//학원일때
			
			AcademyDTO acdto = new AcademyDTO();
			
			
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			
			
			acdto.setAid(id);
			acdto.setApw(pw);
			
			int result = service.academyLoginok(acdto);

			AcademyDTO acinfo = service.getAcademyinfo(acdto);
			
			
			if (result == 1) {
				
				session.setAttribute("aid", acdto.getAid());
				session.setAttribute("apw", acdto.getApw());
				session.setAttribute("alseq", acdto.getAlseq());
				session.setAttribute("acinfo", acinfo);
				
				return "redirect:/academy/index";
				
			} else {
				
				
				return "redirect:/account/loginfail";
			
			}
		} else {
			//관리자일때
			
			AdminDTO addto = new AdminDTO();
			
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			
			addto.setAdid(id);
			addto.setAdpw(pw);
			
			int result = service.adminLoginok(addto);
			
			AdminDTO adinfo = service.getAdmininfo(addto);
			
			System.out.println(adinfo);
			
			if (result == 1) {
				
				session.setAttribute("aid", addto.getAdid());
				session.setAttribute("adpw", addto.getAdpw());
				session.setAttribute("alseq", addto.getAlseq());
				session.setAttribute("adinfo", adinfo);
				
				return "redirect:/academy/index";
				
			} else {
				
				
				return "redirect:/account/loginfail";
			
			}
			
		}
		
	}
	/**
	 * 로그인 실패시 이동하는 페이지 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping("/account/loginfail")
	   public String loginfail() {
	      return "a.account.loginfail";
	   }
	
	/**
	 * 로그아웃을 실행하는 메소드
	 * @author 김유진
	 * @param session
	 * @return
	 */
	@GetMapping(value="/account/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("stuid");
		session.removeAttribute("stupw");
		session.removeAttribute("alseq");		
		session.removeAttribute("stuinfo");	
		session.removeAttribute("aid");
		session.removeAttribute("apw");
		session.removeAttribute("acinfo");
		session.removeAttribute("adid");
		session.removeAttribute("adpw");
		session.removeAttribute("adinfo");
		
		return "redirect:/academy/index";
	}

	/**
	 * 아이디 찾기 페이지로 이동하는 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping(value="/account/findid")
	public String findid() {
		
		return "a.account.findid";
	}
	
	/**
	 * 아이디 찾기시 입력한 정보와 맞는 학원, 학생의 정보를 찾고 성공, 실패 페이지로 넘겨주는 메소드
	 * @author 김유진
	 * @param model
	 * @param logintype
	 * @param req
	 * @return
	 */
	@PostMapping(value="/account/findidok")
	public String findidok(Model model, String logintype, HttpServletRequest req) {
	
		StudentDTO sdto = new StudentDTO();
		AcademyDTO acdto = new AcademyDTO();
		

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		sdto.setStuname(name);
		sdto.setStuemail(email);
		
		
		acdto.setAname(name);
		acdto.setAemail(email);
		
		if (logintype.equals("1")) {

			int result = service.stuFindidok(sdto);
				
			
			if (result == 1) {
				
				StudentDTO stuinfo = service.getStufindid(sdto);
				
				
					model.addAttribute("stuinfo", stuinfo);	
				
					
				
				return "a.account.stufindidsuccess";

				
			} else {
				
				return "redirect:/account/findidfail";
				
			}
			
		
		
		} else {
			
			int result = service.acFindidok(acdto);
			
			
			if (result == 1) {
				
				AcademyDTO acinfo = service.getAcfindid(acdto);

				model.addAttribute("acinfo", acinfo);
				
				return "a.account.acfindidsuccess";
				
				
			} else {
				
				return "redirect:/account/findidfail";
			}
		}
		
		
		
	}
	
	/**
	 * 학생 아이디 찾기 성공 실행 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping(value="/account/stufindidsuccess")
	public String stufindidsuccess() {
		
		return "a.account.stufindidsuccess";
	}
	
	/**
	 * 학원 아이디 찾기 성공 실행 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping(value="/account/acfindidsuccess")
	public String acfindidsuccess() {
		
		return "a.account.acfindidsuccess";
	}
	
	/**
	 * 아이디 찾기 실패 실행 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping("/account/findidfail")
	public String findidfail() {
		
		return "a.account.findidfail";
	}

	
	/**
	 * 비밀번호 찾기 페이지 이동 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping(value="/account/findpw")
	public String findpw() {
		
		return "a.account.findpw";
	}
	
	/**
	 * 비밀번호 찾기 시 입력한 정보와 일치하는 회원의 정보를 가져와 학생 비밀번호 재설정 페이지와 학원 비밀번호 재설정 페이지로
	 * 이동 시켜주는 메소드
	 * @author 김유진
	 * @param model
	 * @param logintype
	 * @param req
	 * @return
	 */
	//
	@PostMapping(value="/account/findpwok")
	public String findpwok(Model model, String logintype, HttpServletRequest req) {
		
		StudentDTO sdto = new StudentDTO();
		AcademyDTO acdto = new AcademyDTO();
			
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String id = req.getParameter("id");
		
		sdto.setStuname(name);
		sdto.setStuemail(email);
		sdto.setStuid(id);
		
		acdto.setAname(name);
		acdto.setAemail(email);
		acdto.setAid(id);
		
		
		if (logintype.equals("1")) {

			
			String stuid = service.getStuid(sdto);
			
			//아이디 찾아서 비밀번호 재설정 페이지로 이동
			if (id.equals(stuid)) {
				
				
				model.addAttribute("sdto", sdto);
				
				
				return "a.account.stupwreset";
				
			} else {
				
				return "redirect:/account/findpwfail";
				
			}
			
		
		
		} else {
			
			String acid = service.getAcid(acdto);
			
			
			if (id.equals(acid)) {
				
				
				model.addAttribute("acdto", acdto);
				
				return "a.account.acpwreset";
				
				
			} else {
				
				return "redirect:/account/findpwfail";
			}
		}
		
	}
	
	
	/**
	 * 입력한 정보가 맞을 시 해당 학생의 비밀번호를 재설정하는 메소드
	 * @author 김유진
	 * @param model
	 * @param req
	 * @param logintype
	 * @return
	 */
	@PostMapping(value="/account/stupwreset")
	public String stupwreset(Model model,HttpServletRequest req, String logintype) {
		
		
		StudentDTO sdto = new StudentDTO();
		
		String id = req.getParameter("stuid");
		String pw = req.getParameter("newpw");
		
		sdto.setStuid(id);
		sdto.setStupw(pw);
		
		
		int result = service.stupwresetsuccess(sdto);
		
		if (result == 1) {
			
			return "redirect:/account/stupwresetsuccess";
	
		} else {
			
			return "redirect:/account/findpwfail";
		}
		
		
		
	}
	
	
	/**
	 * 입력한 정보가 맞을 시 해당 학원의 비밀번호를 재설정하는 메소드
	 * @param model
	 * @param logintype
	 * @param req
	 * @return
	 */
	@PostMapping(value="/account/acpwreset")
	public String acpwreset(Model model, String logintype, HttpServletRequest req) {
		
		
		AcademyDTO acdto = new AcademyDTO();
		

		String id = req.getParameter("acid");
		String pw = req.getParameter("newpw");
		
		
		acdto.setAid(id);
		acdto.setApw(pw);
		
		
		int result = service.acpwresetsuccess(acdto);
		
		if (result == 1) {
			
			return "redirect:/account/acpwresetsuccess";
		} else {
			
			return "redirect:/account/findpwfail";
		}
		
		
		
	}
	
	/**
	 * 비밀번호 찾기에서 입력한 정보가 아닐 시 이동하는 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping(value="/account/findpwfail")
	public String findpwfail() {
		
		return "a.account.findpwfail";
	}
	
	/**
	 * 학생 비밀번호 재설정 성공시 이동하는 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping(value="/account/stupwresetsuccess")
	public String stupwresetsuccess() {
		
		return "a.account.stupwresetsuccess";
	}
	
	/**
	 * 학원 비밀번호 재설정 성공시 이동하는 메소드
	 * @author 김유진
	 * @return
	 */
	@GetMapping(value="/account/acpwresetsuccess")
	public String acpwresetsuccess() {
		
		return "a.account.acpwresetsuccess";
	}
}
