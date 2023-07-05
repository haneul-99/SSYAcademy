package com.test.academy.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

@Controller
public class AdminController {

		@Autowired
		private AdminService service;
		
		/**
		 * @author 박민수
		 * 관리자 페이지
		 * @param model
		 * @param req
		 * @return c.admin.adminmypage
		 */
		@GetMapping(value="/admin/adminmypage")
		public String adminmypage(Model model,HttpServletRequest req) {
			
			String adseq = req.getParameter("adseq");
			
			AdminDTO dto = service.get(adseq);
			
			model.addAttribute("dto",dto);
			
			return "c.admin.adminmypage";
			
		}
		
		/**
		 * @author 박민수
		 * 학생리스트 페이지
		 * @param model
		 * @param req
		 * @return c.admin.studentlist
		 */
		@GetMapping(value="/admin/studentlist")
		public String studentlist(Model model,HttpServletRequest req) {
			
			List<StudentDTO>list =service.student();
			
			model.addAttribute("list",list);
			
			return "c.admin.studentlist";
			
		}
		/**
		 * @author 박민수
		 * 학원리스트 페이지
		 * @param model
		 * @param req
		 * @return c.admin.academylist
		 */
		@GetMapping(value="/admin/academylist")
public String academylist(Model model,HttpServletRequest req) {
			
			List<AcademyDTO>list =service.academy();
			
			model.addAttribute("list",list);
			
			return "c.admin.academylist";
			
		}	
		
}
