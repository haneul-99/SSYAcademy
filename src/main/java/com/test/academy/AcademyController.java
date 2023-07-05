package com.test.academy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.ClassDTO;
import com.test.academy.dto.JjimDTO;
import com.test.academy.dto.MapcsDTO;
import com.test.academy.dto.QnaDTO;
import com.test.academy.dto.StudentDTO;
import com.test.academy.dto.TeacherDTO;

@Controller
public class AcademyController {

	@Autowired
	private AcademyService service;

	@GetMapping(value = "/academy/index")
	public String index(Model model) {

		List<AcademyDTO> alist = service.alist();
		List<String> jlist = service.jlist();
		// popular class list
		List<ClassDTO> pclist = service.pclist(jlist);

		// searchclass list
		List<ClassDTO> sclist = service.sclist();

		model.addAttribute("sclist", sclist);
		model.addAttribute("alist", alist);
		model.addAttribute("pclist", pclist);

		return "a.academy.index";
	}

	@ResponseBody
	@PostMapping(value = "/academy/getclassdto")
	public List<ClassDTO> getclassdto(String word) {
		List<ClassDTO> jclist = service.jclist(word);

		return jclist;
	}

	/**
	 * @author 박민수 학원 마이페이지 메소드
	 * @param model
	 * @param req
	 * @return b.academy.academymypage
	 */
	@GetMapping(value = "/academy/academymypage")
	public String academymypage(Model model, HttpServletRequest req) {

		String aseq = req.getParameter("aseq");

		AcademyDTO dto = service.get(aseq);

		model.addAttribute("dto", dto);

		return "b.academy.academymypage";
	} // 0

	/**
	 * @author 박민수 학원마이페이지 수정 메소드
	 * @param model
	 * @param req
	 * @return b.academy.academymypageedit
	 */
	@GetMapping(value = "/academy/academymypageedit")
	public String academymypageedit(Model model, HttpServletRequest req) {

		String aseq = req.getParameter("aseq");

		AcademyDTO dto = service.get(aseq);

		model.addAttribute("dto", dto);

		return "b.academy.academymypageedit";

	}

	/**
	 * @author 박민수 학원마이페이지 수정 메소드
	 * @param session
	 * @param dto
	 * @param aseq
	 * @return
	 */
	@PostMapping(value = "/academy/academymypageeditok")
	public String academymypageeditok(HttpSession session, AcademyDTO dto, String aseq) {

		int result = service.edit(dto);

		if (result == 1) {
			return "redirect:/academy/academymypage?aseq=" + aseq;
		} else {
			return "redirect:/academy/academymypageedit?aseq=" + aseq;
		}

	}

	/**
	 * @author 박민수 강사 페이지 메소드
	 * @param model
	 * @param req
	 * @return "b.academy.teacherpage
	 */
	@GetMapping(value = "/academy/teacherpage")
	public String teacherpage(Model model, HttpServletRequest req) {

		String aseq = req.getParameter("aseq");

		List<TeacherDTO> list = service.teacher(aseq);

		model.addAttribute("list", list);

		return "b.academy.teacherpage";

	}

	/**
	 * @author 박민수 강사 삭제 메소드
	 * @param model
	 * @param req
	 * @param session
	 * @return
	 */
	@PostMapping(value = "/academy/delok")
	public String delok(Model model, HttpServletRequest req, HttpSession session) {

		AcademyDTO adto = (AcademyDTO) session.getAttribute("acinfo");
		String aseq = adto.getAseq();

		String tseq = req.getParameter("tseq");

		int result = service.del(tseq);

		if (result == 1) {

			return "redirect:/academy/teacherpage?aseq=" + aseq;

		} else {

			return "redirect:/academy/academymypage?aseq=" + aseq;

		}

	}

	/**
	 * @author 박민수 강사 추가 메소드
	 * @param model
	 * @param req
	 * @return b.academy.teacheradd
	 */
	@GetMapping(value = "/academy/teacheradd")
	public String teacheradd(Model model, HttpServletRequest req) {

		String aseq = req.getParameter("aseq");

		AcademyDTO dto = service.get(aseq);

		model.addAttribute("dto", dto);

		return "b.academy.teacheradd";
	}

	/**
	 * @author 박민수 강사 추가 메소드
	 * @param dto
	 * @param session
	 * @param req
	 * @return
	 */
	@PostMapping(value = "/academy/teacheraddok")
	public String teacheraddok(TeacherDTO dto, HttpSession session, HttpServletRequest req) {

		AcademyDTO adto = (AcademyDTO) session.getAttribute("acinfo");
		String aseq = adto.getAseq();

		int result = service.tadd(dto);

		if (result == 1) {
			return "redirect:/academy/teacherpage?aseq=" + aseq;
		} else {
			return "redirect:/academy/teacheradd?aseq=" + aseq;
		}

	}

	/**
	 * @author 박민수 해당 학원의 열린 강좌 메소드
	 * @param model
	 * @param req
	 * @return b.academy.openclasspage
	 */
	@GetMapping(value = "/academy/openclasspage")
	public String openclasspage(Model model, HttpServletRequest req) {

		String aseq = req.getParameter("aseq");

		List<ClassDTO> list = service.getClass(aseq);

		model.addAttribute("list", list);

		return "b.academy.openclasspage";

	}

	/**
	 * @author 박민수 열린 강좌 수정 메소드
	 * @param model
	 * @param req
	 * @return b.academy.openclassedit
	 */
	@GetMapping(value = "/academy/openclassedit")
	public String openclassedit(Model model, HttpServletRequest req) {

		String tseq = req.getParameter("tseq");

		ClassDTO dto = service.getc(tseq);

		model.addAttribute("dto", dto);

		return "b.academy.openclassedit";

	}

	/**
	 * @author 박민수 열린 강좌 수정 메소드
	 * @param session
	 * @param dto
	 * @param tseq
	 * @return
	 */
	@PostMapping(value = "/academy/openclasseditok")
	public String openclasseditok(HttpSession session, ClassDTO dto, String tseq) {

		int result = service.editc(dto);

		if (result == 1) {
			return "redirect:/academy/openclasspage";
		} else {
			return "redirect:/academy/openclassedit";
		}

	}

	/**
	 * @author 박민수 강좌 추가 메소드
	 * @param model
	 * @param req
	 * @return b.academy.openclassadd
	 */
	@GetMapping(value = "/academy/openclassadd")
	public String openclassadd(Model model, HttpServletRequest req) {

		String aseq = req.getParameter("aseq");
		List<ClassDTO> list = service.getClass(aseq);
		model.addAttribute("list", list);
		return "b.academy.openclassadd";

	}

	/**
	 * @author 박민수 강좌 추가 메소드
	 * @param dto
	 * @param session
	 * @param req
	 * @return
	 */
	@PostMapping(value = "/academy/openclassaddok")
	public String openclassaddok(ClassDTO dto, HttpSession session, HttpServletRequest req) {

		AcademyDTO adto = (AcademyDTO) session.getAttribute("acinfo");
		String aseq = adto.getAseq();

		int result = service.cadd(dto);

		if (result == 1) {
			return "redirect:/academy/openclasspage?aseq=" + aseq;
		} else {
			return "redirect:/academy/openclasspage?aseq=" + aseq;
		}

	}

	/**
	 * @author 박민수 강좌 신청 학생 조회 메소드
	 * @param model
	 * @param req
	 * @return b.academy.mapcs
	 */
	@GetMapping(value = "/academy/mapcs")
	public String mapcs(Model model, HttpServletRequest req) {

		String aseq = req.getParameter("aseq");

		List<MapcsDTO> list = service.getMapcs(aseq);

		model.addAttribute("list", list);

		return "b.academy.mapcs";

	}

	/**
	 * @author 박민수 강좌 신청 학생 자세히 보기 메소드
	 * @param model
	 * @param req
	 * @return b.academy.mapcsdetail
	 */
	@GetMapping(value = "/academy/mapcsdetail")
	public String mapcsdetail(Model model, HttpServletRequest req) {

		String stuseq = req.getParameter("stuseq");

		StudentDTO dto = service.gets(stuseq);

		model.addAttribute("dto", dto);

		return "b.academy.mapcsdetail";
	}

	/**
	 * @author 박민수 질문 게시판 메소드
	 * @param model
	 * @param req
	 * @return b.academy.qna
	 */
	@GetMapping(value = "/academy/qna")
	public String qna(Model model, HttpServletRequest req) {

		String aseq = req.getParameter("aseq");

		List<QnaDTO> list = service.getQna(aseq);

		model.addAttribute("list", list);

		return "b.academy.qna";

	}

	/**
	 * @author 박민수 질문 게시판 자세히 보기 메소드
	 * @param model
	 * @param req
	 * @return b.academy.qnadetail
	 */
	@GetMapping(value = "/academy/qnadetail")
	public String qnadetail(HttpSession session, Model model, HttpServletRequest req) {

		AcademyDTO dto = (AcademyDTO) session.getAttribute("acinfo");

		String aseq = dto.getAseq();

		QnaDTO qdto = service.getq(aseq);

		model.addAttribute("dto", qdto);

		return "b.academy.qnadetail";
	}

	/**
	 * @author 박민수 질문게시판 답변 메소드
	 * @param session
	 * @param req
	 * @param qdto
	 * @return
	 */
	@PostMapping(value = "/academy/qnaaddok")
	public String qnaaddok(HttpSession session, HttpServletRequest req, QnaDTO qdto) {

		AcademyDTO dto = (AcademyDTO) session.getAttribute("acinfo");

		String aseq = dto.getAseq();

		int result = service.qadd(aseq, req, qdto);

		if (result == 1) {
			return "redirect:/academy/qna?aseq=" + aseq;
		} else {
			return "redirect:/academy/qnadetail?aseq=" + aseq;
		}

	}
	
	/**
	    * @author 김동석
	    * <p>  학원 상세 정보 페이지를 불러오는 메소드입니다.</p>
	    * @param aseq 불러올 학원의 번호
	    * @param model 돌려줄 학원의 정보를 담을 객체
	    * @return String
	    */
		@GetMapping(value="/academy/academydetail")
		public String academydetail(HttpServletRequest req, HttpServletResponse resp, Model model, String aseq) {
			
			
			AcademyDTO dto = service.getAca(aseq);
			
			List<ClassDTO> list = service.classlist(aseq);

			model.addAttribute("dto", dto);
			model.addAttribute("list",list);
			
			return "a.academy.academydetail";
		}
		
		
		/**
	    * @author 김동석
	    * <p>  찜목록 페이지를 불러오는 메소드입니다.</p>
	    * @param session 회원의 로그인 정보를 불러올 객체
	    * @param model 돌려줄 학원의 정보를 담을 객체
	    * @return String
	    */
		@GetMapping(value="/academy/jjim")
		public String jjim(HttpServletRequest req, HttpServletResponse resp, Model model,  HttpSession session) {
			String stuid = (String) session.getAttribute("stuid");
			List<JjimDTO> list = service.jjimlist(stuid);

			model.addAttribute("list",list);
			 

			return "a.academy.jjim";
		}
		
		/**
	    * @author 김동석
	    * <p>  찜목록에서 삭제를 실행하는 메소드입니다.</p>
	    * @param session 회원의 로그인 정보를 불러올 객체
	    * @param jseq 삭제할 항목의 번호를 불러오는 객체
	    * @return String
	    */
		@GetMapping(value="/academy/jjimdelete")
		public String jjim(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String jseq) {
			
			int result = service.delJjim(jseq);
			
			if (result == 1) {
				return "redirect:/academy/jjim";
			} else {
				return "redirect:/academy/jjim";
			}
		}
}
