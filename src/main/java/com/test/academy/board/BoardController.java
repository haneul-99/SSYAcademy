package com.test.academy.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.academy.dto.CommunityCommentDTO;
import com.test.academy.dto.CommunityDTO;
import com.test.academy.dto.QnaCommentDTO;
import com.test.academy.dto.QnaDTO;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService service;
	
	/**
	 * 
	 * 사이트내 커뮤니티 메인페이지 입니다. 커뮤니티 목록을 요청받아 응답하는 메소드입니다.
	 * @author 유동환
	 * @param page
	 * @param word
	 * @param model
	 * @return
	 */
	@GetMapping(value="/board/community")
	public String community(String page,String word, Model model) {
		
		
	
		//페이징 작업
		int nowPage = 0;		//현재 페이지 번호
		int begin = 0;			//rnum
		int end = 0;			//rnum
		int pageSize = 20;		//한페이지 당 출력할 게시물 수
		int totalCount = 0;		//총 게시물 수 
		int totalPage = 0;		//총 페이지 수(총 게시물 수 / 한 페이지 당 게시물 수)
		
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		//list.do?page=1 > where rnum between 1 and 10
		//list.do?page=2 > where rnum between 11 and 20
		//list.do?page=3 > where rnum between 21 and 30
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		map.put("word", word);
		String isSearch = "";
		if(word != null) {
			isSearch = "y";
			List<CommunityDTO> searchclist = service.searchclist(map);
			totalCount = service.getsearchcommuCnt(map);
			model.addAttribute("searchclist",searchclist);
			model.addAttribute("word",word);
		}else {
			isSearch = "n";
			List<CommunityDTO> clist = service.clist(map);
			totalCount = service.getcommuCnt();
			model.addAttribute("clist",clist);
		}
		model.addAttribute("isSearch",isSearch);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		String pagebar = ""; //페이지바 태그
		
		int blockSize = 10; //한번에 보여지는 페이지바 수
		int n = 0; //출력 페이지 번호
		int loop = 0; //루프 변수

		loop = 1;
		n = ((nowPage -1) / blockSize) * blockSize + 1;


		if(n == 1) {
			pagebar += String.format("<a href='#!' style='cursor:not-allowed'><i class=\"fa-solid fa-ellipsis\"></i></a>", n-1);
		} else {
			pagebar += String.format("<a href='/ssy/seller/orderprocess.do?page=%d'><i class=\"fa-solid fa-ellipsis\"></i></a>", n-1);
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			
			
			if (nowPage == n) {
				
				pagebar += String.format(" <a href='#!' style='color:cornflowerblue;'>%d</a> ",n);
				
			} else {
				
				pagebar += String.format(" <a href='/ssy/seller/orderprocess.do?page=%d'>%d</a> ", n,n);
			
			}
			loop++;
			n++;
		}
		
		
		if(n > totalPage) {
			pagebar += String.format("<a href='#!' style='cursor:not-allowed;'><i class=\"fa-solid fa-ellipsis\"></i></a>", n);
		} else {
			pagebar += String.format("<a href='/ssy/seller/orderprocess.do?page=%d'><i class=\"fa-solid fa-ellipsis\"></i></a>", n);
			
		}
		
		
		
		model.addAttribute("pagebar",pagebar);
		
		
		return "a.board.community";
		
	}
	
	/**
	 * 커뮤니티에 글을 작성하기 위해 이동하는 페이지입니다. 
	 * @author 유동환
	 * @return
	 */
	@GetMapping(value="/board/communityadd")
	public String communityadd() {
		
		return "a.board.communityadd";
		
	}
	
	
	//글작성
	
	/**
	 * 글작성을 완료하는 메소드입니다.
	 * @author 유동환
	 * @param session
	 * @param req
	 * @return
	 */
	@PostMapping(value="/board/communityaddok")
	public String communityaddok(HttpSession session, HttpServletRequest req) {
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		CommunityDTO dto = new CommunityDTO();
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		dto.setCmsubject(subject);
		dto.setCmcontent(content);
		dto.setStuseq((String)session.getAttribute("stuseq"));
		
		MultipartFile file = multi.getFile("attach");
		String path = multi.getRealPath("/resources/files");
		String filename = "";
		
		if(!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			filename = uuid.toString() + "_" + file.getOriginalFilename();
			dto.setCmattach(filename);
			
			try {
				file.transferTo(new File(path + "\\" + filename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else {
			dto.setCmattach("no file");
		}
		
		
		int result = service.addCommu(dto);
		if(result == 1) {
			
			return "redirect:/board/community";
		} else {
			
			return "redirect:/board/communityadd";
		}
		
		
	}
	
	/**
	 * 
	 * 커뮤니티에 있는 글을 볼수 있는 페이지를 응답하느 메소드입니다.
	 * @author 유동환
	 * @param cmseq 게시글번호
	 * @param model
	 * @return
	 */
	@GetMapping(value="/board/communityview")
	public String communityview(String cmseq,HttpSession session, Model model) {
		//조회수 올리기
		if(session.getAttribute(cmseq) == null) {
			service.readcnt(cmseq);
			session.setAttribute(cmseq,"1");
		}
		//게시글가져오기
		CommunityDTO cdto = service.getCDto(cmseq);
		cdto.setCmsubject(cdto.getCmsubject().replace("\r\n", "<br>"));
		cdto.setCmcontent(cdto.getCmcontent().replace("\r\n", "<br>"));
		
		
		//댓글가져오기
		List<CommunityCommentDTO> cclist = service.getCCDto(cmseq);
		
		int cocnt = service.getCoCnt(cmseq);
		
		model.addAttribute("cdto",cdto);
		model.addAttribute("cocnt",cocnt);
		model.addAttribute("cclist",cclist);
		
		return "a.board.communityview";
		
	}
	
	/**
	 * 뷰 화면에서 글의 작성자가 글을 수정할수 있는 페이지입니다.
	 * @author 유동환
	 * @param cmseq
	 * @param model
	 * @return
	 */
	//커뮤니티 글 수정
	@GetMapping(value="/board/communityedit")
	public String communityedit(String cmseq,Model model) {
		
		CommunityDTO cdto = service.getCDto(cmseq);
		
		model.addAttribute("cdto",cdto);
		if(cdto  != null) {
			return "a.board.communityedit";
		} else {
			return "redirect:/board/community";
		}
	}
	
	/**
	 * 커뮤니티의 기존 글을 수정완료하는 메소드입니다.
	 * @author 유동환 
	 * @param req
	 * @param session
	 * @param model
	 * @return
	 */
	//커뮤니티 글 수정완료
	@PostMapping(value="/board/communityeditok")
	public String communityeditok(HttpServletRequest req, HttpSession session ,Model model) {
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		CommunityDTO dto = new CommunityDTO();
		String subject = multi.getParameter("cmsubject");
		String content = multi.getParameter("cmcontent");
		dto.setCmsubject(subject);
		dto.setCmcontent(content);
		dto.setStuseq((String)session.getAttribute("stuseq"));
		dto.setCmseq(multi.getParameter("cmseq"));
		
		MultipartFile file = multi.getFile("cmattach");
		String path = multi.getRealPath("/resources/files");
		String filename = "";
		
		if(!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			filename = uuid.toString() + "_" + file.getOriginalFilename();
			dto.setCmattach(filename);
			
			try {
				file.transferTo(new File(path + "\\" + filename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else {
			dto.setCmattach("no file");
		}
		
		int result = service.editCommu(dto);
		
		
		if(result == 1) {
			return "redirect:/board/communityview?cmseq=" + dto.getCmseq();
		} else {
			return "redirect:/board/community";
		}
	}
	
	/**
	 * 커뮤니티에 댓글을 작성하고 데이터베이스에 글 저장을 완료하는 메소드입니다.
	 * @author 유동환
	 * @param session
	 * @param dto
	 * @param model
	 * @return
	 */
	@PostMapping(value="/board/commucommentaddok")
	public String commucommentaddok(HttpSession session, CommunityCommentDTO dto,Model model) {
		dto.setStuseq((String)session.getAttribute("stuseq"));
		
		
		int result = service.addComment(dto);
		
		if(result == 1) {
			return "redirect:/board/communityview?cmseq="+dto.getCmseq();
		} else {
			return "redirect:/board/communityview?cmseq=" + dto.getCmseq();
		}
	}
	
	/**
	 * 커뮤니티 게시글에 달린 댓글을 삭제하는 메소드입니다.\
	 * @author 유동환
	 * @param dto
	 * @param model
	 * @return
	 */
	@GetMapping(value="/board/commucommentdelok")
	public String commucommentdelok(CommunityCommentDTO dto,Model model) {
		int result = service.delComment(dto.getCcseq());
		if(result == 1) {
			return "redirect:/board/communityview?cmseq="+dto.getCmseq();
		} else {
			return "redirect:/board/communityview?cmseq=" + dto.getCmseq();
		}
	}
	
	
	
	//커뮤니티 글삭제
	/**
	 * 커뮤니티의 글을 작성자가 삭제하는 메소드입니다.
	 * @author 유동환
	 * @param cmseq
	 * @return
	 */
	@GetMapping(value="/board/communitydel")
	public String communitydel(String cmseq) {
		
		
		service.delCommu(cmseq);
		
		return "redirect:/board/community";
		
	}

	
	/**
	 * ajax를 활용하여 문의게시판 작성시 학원의 정보를 요청받아 해당학원의 과정들을 응답해주는 메소드입니다. 
	 * @param academy
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="/board/getclassok")
	public List<String> getclassok(String academy) {
		
		List<String> clist = service.getclassok(academy);
		return clist;
		
	}
	
	//문의게시판 
	/**
	 * 문의게시판의 메인화면이자 목록을 출력하는 페이지입니다.
	 * @author 유동환
	 * @param page
	 * @param word
	 * @param model
	 * @return
	 */
		@GetMapping(value="/board/qboard")
		public String qboard(String page,String word, Model model) {
			
			List<QnaDTO> qlist = service.qlist();
			model.addAttribute("qlist",qlist);
			return "a.board.qboard";
			
		}
		
		
		
	//문의게시판 등록
		/**
		 * 문의 게시판에 글을 작성할수 있는 페이지입니다.
		 * @author 유동환
		 * @param model
		 * @return
		 */
	@GetMapping(value="/board/qboardadd")
	public String qboardadd(Model model) {
		
		//학원정보 가져오기
		List<String> alist = service.getacademy();
		
		model.addAttribute("alist",alist);
		return "a.board.qboardadd";
		
	}
	
	//문의게시판 글작성
	/**
	 * 문의게시판에 글작성을 완료하는 페이지입니다.
	 * @author 유동환
	 * @param qdto
	 * @param session
	 * @param req
	 * @return
	 */
		@PostMapping(value="/board/qboardaddok")
		public String qboardaddok(QnaDTO qdto,HttpSession session, HttpServletRequest req) {
			
			qdto.setStuseq((String)session.getAttribute("stuseq"));
			int result = service.addqboard(qdto);
			
			if(result == 1) {
				return "redirect:/board/qboard";
			} else {
				return "redirect:/board/qboardadd";
			}
		}
	
		/**
		 * 문의게시판의 목록에 있는 글을 확인할 수 있습니다.
		 * @author 유동환
		 * @param qseq
		 * @param model
		 * @return
		 */
		@GetMapping(value="/board/qboardview")
		public String qboardview(String qseq,Model model) {
			
			service.readcnt(qseq);
			//게시글가져오기
			QnaDTO qdto = service.getQDto(qseq);
			qdto.setAname(service.getaname(qdto.getAseq()));
			
			//댓글 가져오기
			List<QnaCommentDTO> qclist = service.getQclist(qseq);
//			int cocnt = service.getCoCnt(cmseq);
			
			model.addAttribute("qdto",qdto);
//			model.addAttribute("cocnt",cocnt);
			model.addAttribute("qclist",qclist);
			
			return "a.board.qboardview";
			
		}
		
		/**
		 * 작성자가 본인이 작성한 게시글을 삭제하는 메소드입니다.
		 * @author 유동환
		 * @param qseq
		 * @return
		 */
		@GetMapping(value="/board/qboarddel")
		public String qboarddel(String qseq) {
			
			
			int result = service.delQboard(qseq);
			
			if(result == 1) {
				return "redirect:/board/qboard";
			} else {
				return "redirect:/board/qboardview?qseq=" + qseq;
			}
			
		}
		//커뮤니티 글 수정
		/**
		 * 문의게시판의 글을 수정할 수 있는 페이지입니다.
		 * @author 유동환
		 * @param qseq
		 * @param model
		 * @return
		 */
		@GetMapping(value="/board/qboardedit")
		public String qboardedit(String qseq,Model model) {
			
			List<String> alist = service.getacademy();
			QnaDTO qdto = service.getQDto(qseq);
			
			model.addAttribute("qdto",qdto);
			model.addAttribute("alist",alist);
			if(qdto  != null) {
				return "a.board.qboardedit";
			} else {
				return "redirect:/board/community";
			}
		}
		/**
		 * 문의게시판의 수정사항을 저장하는 메소드입니다.
		 * @author 유동환
		 * @param qdto
		 * @param session
		 * @param model
		 * @return
		 */
		@PostMapping(value="/board/qboardeditok")
		public String qboardeditok(QnaDTO qdto, HttpSession session ,Model model) {
			
			
			int result = service.editQboard(qdto);
			
			if(result == 1) {
				return "redirect:/board/qboardview?qseq=" + qdto.getQseq();
			} else {
				return "redirect:/board/qboard";
			}
		}
		/**
		 * 문의게시판에 문의받은 학원이 댓글을 작성할 수있는 메소드입니다.
		 * @author 유동환
		 * @param qadto
		 * @param session
		 * @param model
		 * @return
		 */
		@PostMapping(value="/board/qnacommentaddok")
		public String qnacommentaddok(QnaCommentDTO qadto, HttpSession session ,Model model) {
			
			
			int result = service.addQboardComment(qadto);
			
			
			if(result == 1) {
				return "redirect:/board/qboardview?qseq=" + qadto.getQseq();
			} else {
				return "redirect:/board/qboard";
			}
		}
		
		@GetMapping(value="/board/qboardcommentdelok")
		public String qnacommentdelok(String qaseq, HttpSession session ,Model model) {
			
			
			int result = service.qnacommentdel(qaseq);
			
			
			if(result == 1) {
				return "redirect:/board/qboard";
			} else {
				return "redirect:/board/qboard";
			}
		}

		
}
