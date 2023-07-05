package com.test.academy.student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.academy.dto.ApplyProjectDTO;
import com.test.academy.dto.ClassDTO;
import com.test.academy.dto.ClassReviewDTO;
import com.test.academy.dto.CommunityDTO;
import com.test.academy.dto.CompleteReviewDTO;
import com.test.academy.dto.ProjectDTO;
import com.test.academy.dto.ProjectMemberDTO;
import com.test.academy.dto.ResumeDTO;
import com.test.academy.dto.StudentDTO;
import com.test.academy.dto.TeacherReviewDTO;

@Controller
public class StudentController {
	
	
	@Autowired
	private StudentService service;
	
	/**
	 * @author 김하늘
	 * 학생마이페이지에서 학생정보를 보여주는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */

	@GetMapping(value="/member/studentmypage")
	public String mypage(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		System.out.println("학생번호(mypage): " + stuseq); 
		
		StudentDTO dto = service.get(stuseq);
		
		model.addAttribute("dto", dto);
		
		return "b.member.studentmypage";
	}
	
	/**
	 * @author 김하늘
	 * 내가 작성한 게시판에서 강좌후기 목록을 볼 수 있는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/crboard")
	public String stuboard(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		List<ClassReviewDTO> list = service.crboard(stuseq);
		
		model.addAttribute("list", list);
		
		
		return "b.member.crboard";
		
	}
	
	/**
	 * @author 김하늘
	 * 학생정보를 수정하는 메소입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/studentedit")
	public String studentedit(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		System.out.println("학생번호(studentedit): " + stuseq); 
		
		StudentDTO dto = service.get(stuseq);
		
		model.addAttribute("dto", dto);
		
		return "b.member.studentedit";
		
	}
	
	/**
	 * @author 김하늘
	 * 학생정보를 데이터베이스에 적용하는 메소드입니다.
	 * @param dto
	 * @param req
	 * @param stuseq
	 * @return
	 */
	
	@PostMapping(value="/member/studenteditok")
	public String studenteditok(StudentDTO dto, HttpServletRequest req, String stuseq) {
		
		int result = service.edit(dto);
		
		System.out.println("editok(result): " +  result);
		
		if (result == 1) {
			return "redirect:/member/studentmypage?stuseq=" + stuseq;
		} else {
			return "redirect:/member/studentedit?stuseq=" + stuseq;
		}
		
	}
	
	/**
	 * @author 김하늘
	 * 내가 작성한 게시글에서 강좌 후기 목록을 볼 수 있는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/trboard")
	public String trboard(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		List<TeacherReviewDTO> list = service.trboard(stuseq);
		
		model.addAttribute("list", list);
		
		return "b.member.trboard";
		
	}
	
	/**
	 * 
	 * @author 김하늘
	 * 내가 작성한 게시글에서 문의글을 볼 수 있는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/completeboard")
	public String completeboard(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		List<CompleteReviewDTO> list = service.completeboard(stuseq);
		
		model.addAttribute("list", list);
		
		return "b.member.completeboard";
		
	}
	
	/**
	 * @author 김하늘
	 * 내가 작성한 게시글에서 개발자 커뮤니티 게시판 목록을 볼 수 있는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/cmboard")
	public String cmboard(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		List<CommunityDTO> list = service.cmboard(stuseq);
		
		System.out.println("cmboard: " + list);
		
		model.addAttribute("list", list);
		
		
		return "b.member.cmboard";
		
	}
	
	/**
	 * @author 김하늘
	 * 학생이 작성한 이력서 정보를 보여주는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	//이력서 정보
	@GetMapping(value="/member/studentresume")
	public String sturesume(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		//System.out.println("학생번호: " + stuseq); 
		
		
		StudentDTO dto = service.get(stuseq);
	
		ResumeDTO rdto = service.sturesume(stuseq);
		
		System.out.println("rdto: " + rdto);
		
		model.addAttribute("rdto", rdto);
		
		model.addAttribute("dto", dto);
		
		return "b.member.studentresume";
		
	}
	
	/**
	 * @author 김하늘
	 * 이력서 정보가 없는 학생일 경우 이력서를 추가해주는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	//이력서 추가
	@GetMapping(value="/member/addresume")
	public String addresume(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		System.out.println("학생번호1: " + stuseq); 
		
		StudentDTO dto = service.get(stuseq);
		
		model.addAttribute("dto", dto);
		
		return "b.member.addresume";
				
	}
	
	/**
	 * @author 김하늘
	 * 추가된 이력서 정보를 데이터 베이스에 반영하는 메소드입니다.
	 * @param req
	 * @param stuseq
	 * @return
	 */
	
	@PostMapping(value="/member/addresumeok")
	public String addresumeok(HttpServletRequest req, String stuseq) {
		
//		String stuseq = req.getParameter("stuseq");
//		
//		System.out.println("학생번호2: " + stuseq); 
		
		int result = service.addresume(req);
		
		System.out.println(result);
		
		if (result == 1) {
			return "redirect:/member/studentresume?stuseq=" + stuseq;
		} else {
			return "redirect:/member/addresume?stuseq=" + stuseq;
		}
		
	}
	
	/**
	 * @author 김하늘
	 * 이력서가 있던 학생은 정보를 수정할 수 있도록 하는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/editresume")
	public String editresume(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		StudentDTO dto = service.get(stuseq);
		
		ResumeDTO rdto = service.sturesume(stuseq);
		
		model.addAttribute("rdto", rdto);
		
		model.addAttribute("dto", dto);
		
		return "b.member.editresume";

	}
	
	/**
	 * @author 김하늘
	 * 변경된 이력서 정보를 데이터베이스에 반영하는 메소드입니다.
	 * @param session
	 * @param req
	 * @return
	 */
	
	@PostMapping(value="/member/editresumeok") 
	public String editresumeok(HttpSession session, HttpServletRequest req) {
		
		StudentDTO dto = (StudentDTO)session.getAttribute("stuinfo");
		
		String stuseq = dto.getStuseq();
		
		int result = service.editresume(stuseq, req);
		
		if (result == 1) {
			return "redirect:/member/studentresume?stuseq=" + stuseq;
		} else {
			return "redirect:/member/editresume?stuseq=" + stuseq;
		}
		
	}
	
	/**
	 * @author 김하늘
	 * 자신이 신청한 과정들의 목록을 보여주는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/studentclass")
	public String studentclass(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		List<ClassDTO> list = service.studentclass(stuseq);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "b.member.studentclass";
		
	
	}
	
	/**
	 * @author 김하늘
	 * 학생이 신청한 프로젝트의 정보가 3가지로 나눠 보여주는 메소드입니다.
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/studentproject") 
	public String studentproject(Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		List<ProjectDTO> plist = service.studentproject(stuseq);
		
		List<ProjectMemberDTO> mlist = service.projectmember(stuseq);
		
		List<ApplyProjectDTO> aplist = service.projectapply(stuseq);
		
		System.out.println(plist);
		System.out.println(mlist);
		System.out.println(aplist);
		
		model.addAttribute("plist", plist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("aplist", aplist);
		
		return "b.member.studentproject";
		
	}
	
	/**
	 * @author 김하늘
	 * 자신이 신청한 과정 중 신청 취소를 눌러 삭제할 수 있는 메소드입니다.
	 * @param mcsseq
	 * @param session
	 * @return
	 */
	
	@GetMapping(value="/member/classdeleteok")
	public String classdeleteok(String mcsseq, HttpSession session) {
		
		StudentDTO dto = (StudentDTO)session.getAttribute("stuinfo");
		
		String stuseq = dto.getStuseq();
		
		System.out.println(mcsseq);
		
		int result = service.classdelete(mcsseq);
		
		//System.out.println("classdel: " + dto.getStuseq()); 
		
		//System.out.println("과정 관리 삭제: " + result);
		
		if (result == 1) {
			return "redirect:/member/studentclass?stuseq=" + stuseq;
		} else {
			return "redirect:/member/studentmypage?stuseq=" + stuseq;
		}
		
		
	}
	
	/**
	 * 
	 * @author 김하늘
	 * 학생 자신이 프로젝트 팀장으로써 프로젝트 참여할 팀원들을 관리하고 모집하며, 픞로젝트도 삭제할 수 있는 메소드입니다.
	 * @param prseq
	 * @param session
	 * @return
	 */
	
	@GetMapping(value="/member/projectdelok")
	public String projectdelok(String prseq, HttpSession session) {
		
		StudentDTO dto = (StudentDTO)session.getAttribute("stuinfo");
		
		String stuseq = dto.getStuseq();
		
		int result = service.projectdelete(prseq);
		
		System.out.println("프로젝트 삭제: " + result);
		
		if (result == 1) {
			return "redirect:/member/studentproject?stuseq=" + stuseq;
		} else {
			return "redirect:/member/studentmypage?stuseq=" + stuseq;
		}
		
	}
	
	/** 
	 * @author 김하늘
	 * 자신이 팀원으로써 신청한 프로젝트 중 신청 취소를 눌러 삭제할 수 있는 메소드입니다.
	 * @param apseq
	 * @param session
	 * @return
	 */
	
	@GetMapping(value="/member/projapplydelok")
	public String projapplydelok(String apseq, HttpSession session) {
		
		StudentDTO dto = (StudentDTO)session.getAttribute("stuinfo");
		
		String stuseq = dto.getStuseq();
		
		System.out.println(stuseq);
		System.out.println(apseq);
		
		int result = service.projapplydel(apseq);
		
		System.out.println("프로젝트 삭제: " + result);
		
		if (result == 1) {
			return "redirect:/member/studentproject?stuseq=" + stuseq;
		} else {
			return "redirect:/member/studentmypage?stuseq=" + stuseq;
		}
		
	}
	
	/**
	 * @author 김하늘
	 * 학생이 참여증인 프로젝트로 진행중인 프로젝트에서 나올 수 있는 메소드입니다.
	 * @param pmseq
	 * @param session
	 * @return
	 */
	
	@GetMapping(value="/member/participatedelok")
	public String participatedelok(String pmseq, HttpSession session) {
		
		StudentDTO dto = (StudentDTO)session.getAttribute("stuinfo");
		
		String stuseq = dto.getStuseq();
		
		System.out.println(stuseq);
		System.out.println(pmseq);
		
		int result = service.participatedelok(pmseq);
		
		System.out.println("참여프로젝트 삭제: " + result);
		
		if (result == 1) {
			return "redirect:/member/studentproject?stuseq=" + stuseq;
		} else {
			return "redirect:/member/studentmypage?stuseq=" + stuseq;
		}
		
	}
	
	/**
	 * @author 김하늘
	 * 학생이 작성한 이력서 정보를 삭제할 수 있는 메소드입니다.
	 * @param session
	 * @return
	 */
	
	@PostMapping(value="/member/delresumeok")
	public String delresumeok(HttpSession session) {
		
		StudentDTO dto = (StudentDTO)session.getAttribute("stuinfo");
		
		String stuseq = dto.getStuseq();
		
		System.out.println(stuseq);
		
		int result = service.delresumeok(stuseq);
		
		System.out.println("프로젝트 삭제: " + result);
		
		if (result == 1) {
			return "redirect:/member/studentresume?stuseq=" + stuseq;
		} else {
			return "redirect:/member/studentmypage?stuseq=" + stuseq;
		}
		
	}
	
	/**
	 * @author 김하늘
	 * 프로젝트 관리에서 관리버튼을 누르면 프로젝트를 신청한 사람과 팀원인 사람의 이름을 보여주는 메소드입니다.
	 * @param prseq
	 * @param model
	 * @param req
	 * @return
	 */
	
	@GetMapping(value="/member/studentmanage")
	public String stumanage(String prseq, Model model, HttpServletRequest req) {
		
		String stuseq = req.getParameter("stuseq");
		
		System.out.println("stu: " + stuseq);
		System.out.println("pr: " + prseq);
		
		List<ProjectMemberDTO> mlist = service.membermanage(stuseq);
		
		List<ApplyProjectDTO> aplist = service.applymanage(stuseq);	
		
		System.out.println(mlist); // 팀원
		System.out.println(aplist); // 신청자
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("aplist", aplist);
	
		return "b.member.studentmanage";
		
	}
	
	/**
	 * @author 김하늘
	 * 관리창에서 새로운 신청 중 거절하는 메소드입니다.
	 * @param prseq
	 * @param session
	 * @return
	 */
	
	@GetMapping(value="/member/rejectdelok")
	public String rejectdelok(String prseq, HttpSession session) {
		
		StudentDTO dto = (StudentDTO)session.getAttribute("stuinfo");
		
		String stuseq = dto.getStuseq();
		
		System.out.println(prseq);
		
		int result = service.rejectdelok(stuseq);
		
		if (result == 1) {
			return "redirect:/member/studentmanage?stuseq=" + stuseq + "&prseq=" + prseq;
		} else {
			return "redirect:/member/studentmanage?stuseq=" + stuseq;
		}	
		
	}
	
	/**
	 * @author 김하늘
	 * 관리창에서 새로운 신청 중 승인하는 메소드입니다.
	 * @param stuseq
	 * @param prseq
	 * @param session
	 * @return
	 */
	
	@GetMapping(value="/member/approvaladdok")
	public String approvaladdok(String stuseq, String prseq, HttpSession session) {
		
	
		System.out.println(stuseq);
		System.out.println(prseq);
		
		int result = service.approvaladdok(stuseq);
		
		if (result == 1) {
			return "redirect:/member/studentmanage?stuseq=" + stuseq + "&prseq=" + prseq;
		} else {
			return "redirect:/member/studentmanage?stuseq=" + stuseq;
		}	
		
	}
	
	
}
