package com.test.academy.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.academy.dto.ProjectCommentDTO;
import com.test.academy.dto.ProjectDTO;
import com.test.academy.dto.StudentDTO;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService service;
	
	@Autowired
	private ProjectDAOImpl dao;
	
	/**
	 * @author 구대현
	 * 모집중인 프로젝트 최신 9개를 출력하는 리스트입니다.
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/project/projectlist")
	public String projectList(Model model) {

		List<ProjectDTO> list = dao.list();
		
		model.addAttribute("list", list);

		return "a.project.projectlist";
	}
	
	/**
	 * @author 구대현
	 * 모집중인 프로젝트 전체를 출력하는 메소드입니다.
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/project/projectalllist")
	public String projectAllList(Model model) {

		List<ProjectDTO> allList = dao.allList();
		
		model.addAttribute("alllist", allList);

		return "a.project.projectalllist";
	}
		
	/**
	 * @author 구대현
	 * 프로젝트의 상세정보를 출력하는 메소드입니다.
	 * @param prseq
	 * @param stuseq
	 * @param model
	 * @return
	 */
	 @GetMapping(value="/project/projectdetail") 
	 public String projectDetail(String prseq, String stuseq, Model model) {
		 
		 //prseq == 프로젝트 번호
		 ProjectDTO dto = dao.getDetail(prseq);
		 
		 int result = service.checkMember(prseq);
		 
		 result = result + 1;
		 
		 List<ProjectDTO> mlist = service.getMemberName(prseq);
		 
		 List<ProjectCommentDTO> pclist = service.getComment(prseq); 
		 
		 int commentCount = service.getcommentCount(prseq);
		 
		 int check = 0;
				 
		 
		 if(stuseq != null || stuseq != "") {
			 check = service.checkApply(dto);
		 }
			 
		 model.addAttribute("check", check);
		 
		 model.addAttribute("dto", dto);
		 model.addAttribute("result", result);
		 model.addAttribute("mlist", mlist);
		 model.addAttribute("pclist" , pclist);
		 model.addAttribute("commentcount", commentCount);
		 
		 return "a.project.projectdetail"; 
	 }
	 
	 
	 /**
	  * @author 구대현
	  * 새 프로젝트를 등록하는 메소드입니다.
	  * @param seq
	  * @param model
	  * @return
	  */
	 @GetMapping(value="/project/registerproject")
	 public String registerProject(String seq, Model model) {
		 
		 String stuname = service.getName(seq);
		 
		 model.addAttribute("stuname", stuname);
		 
		 return "a.project.registerproject";
	 }
	
	 /**
	  * @author 구대현
	  * 등록한 프로젝트를 DB에 저장하는 메소드입니다.
	  * @param pdto
	  * @param req
	  * @return
	  */
	 @PostMapping(value="/project/registerprojectok")
	 public String registerProjectok(ProjectDTO pdto, HttpServletRequest req) {
		 
		 String seq = req.getParameter("seq");
		 
		 pdto.setStuseq(seq);
		
		 String period = req.getParameter("start_date");
		 period += "~";
		 period += req.getParameter("end_date");
		 
		 pdto.setPrperiod(period);
		
		 
		 
		 int result = service.addProject(pdto);
		 
			if (result == 1) {
				return "redirect:/project/projectlist";
			} else {
				return "redirect:/project/registerproject";
			}
		 
	 }
	 
	/**
	 * @author 구대현
	 * 프로젝트 상세정보에서 댓글을 작성하는 메소드입니다.
	 * @param req
	 * @return
	 */
	 @PostMapping(value="/project/addcomment")
	 public String addComment(HttpServletRequest req) {
		 
		 String prseq = req.getParameter("prseq");
		 String comment = req.getParameter("comment");
		 String seq = req.getParameter("seq");
		 
		 int result = service.addComment(comment, prseq, seq);
		 
		 
		 return "redirect:/project/projectdetail?prseq=" + prseq;
	 }
	 
	 /**
	  * @author 구대현
	  * 프로젝트 상세정보에서 댓글을 삭제하는 메소드입니다.
	  * @param seq
	  * @param prseq
	  * @param req
	  * @return
	  */
	 @GetMapping(value="/project/delcomment")
	 public String delComment(String seq, String prseq, HttpServletRequest req) {
		 
		 int result = service.delComment(seq);
		 
		 if(result == 1) {
			 return "redirect:/project/projectdetail?prseq=" + prseq;
		 } else {
			 return "redirect:/project/projectdetail?prseq=" + prseq;
		 }
		 
	 }
	 
	 /**
	  * @author 구대현
	  * 프로젝트 상세정보에서 댓글을 수정하는 메소드입니다.
	  * @param req
	  * @return
	  */
	 @PostMapping(value="/project/editcomment")
	 public String editComment(HttpServletRequest req) {
		 
		 String comment = req.getParameter("comment");
		 String seq = req.getParameter("seq");
		 String prseq = req.getParameter("prseq");
		 
		 ProjectCommentDTO dto = new ProjectCommentDTO();
		 
		 dto.setPccontent(comment);
		 dto.setPcseq(seq);
		 
		 int result = service.editComment(dto);
		 
		 return "redirect:/project/projectdetail?prseq=" + prseq;
		 
	 }
	 
	 
	 /**
	  * @author 구대현
	  * 모집 중인 프로젝트에 지원하는 메소드입니다.
	  * @param req
	  * @return
	  */
	 @PostMapping(value="/project/applyproject")
	 public String applyProject(HttpServletRequest req) {
		 
		 String stuseq = req.getParameter("stuseq");
		 String prseq = req.getParameter("prseq");
		 
		 ProjectDTO dto = new ProjectDTO();
		 
		 dto.setStuseq(stuseq);
		 dto.setPrseq(prseq);
		 
		 int check = service.checkApply(dto);
		 
		 if (check==0) {
			
			 int result = service.applyProject(dto);
			 	 
			 return "redirect:/project/projectdetail?prseq=" + prseq;				 
			 
		} else {
			
			int result = service.applyProjectCancel(dto);
			
			 return "redirect:/project/projectdetail?prseq=" + prseq;				 
				
		}
		 
		 
		 
	 }
}
