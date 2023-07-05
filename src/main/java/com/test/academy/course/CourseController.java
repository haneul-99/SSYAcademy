package com.test.academy.course;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.academy.dto.CourseDTO;

@Controller
public class CourseController {

	@Autowired
	private CourseService service;

	@Autowired
	private CourseDAOImpl dao;

	/**
	 * @author 구대현
	 * 전체 과정 목록을 나타내는 리스트입니다.
	 * @param column
	 * @param word
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/course/courselist")
	public String courseList(String page, String column, String word, Model model) {

		List<CourseDTO> list = service.getLatestList();

		for (CourseDTO dto : list) {

			DecimalFormat format = new DecimalFormat("###,###");

			String cost = dto.getCcost();
			cost = format.format(Integer.parseInt(cost));

			dto.setCcost(cost);

		}

		// 페이징 작업
		int nowPage = 0; // 현재 페이지 번호
		int begin = 0; // rnum
		int end = 0; // rnum
		int pageSize = 8; // 한페이지 당 출력할 게시물 수
		int totalCount = 0; // 총 게시물 수
		int totalPage = 0; // 총 페이지 수(총 게시물 수 / 한 페이지 당 게시물 수)

		if (page == null || page == "")
			nowPage = 1;
		else
			nowPage = Integer.parseInt(page);

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		String isSearch = "n"; // n(목록), y(검색)

		HashMap<String, String> map = new HashMap<String, String>();

		List<CourseDTO> allCourse = null;
		List<CourseDTO> searchCourse = null;

		if ((column == null || word == null) || (column == "" || word == "")
				|| (column.equals("null") || word.equals("null"))) {
			isSearch = "n";
			map.put("isSearch", isSearch);
			map.put("begin", begin + "");
			map.put("end", end + "");

			allCourse = service.allCourse(map);

			totalCount = service.getAllTotalCount(map);
			model.addAttribute("allcourse", allCourse);

		} else {
			isSearch = "y";
			map.put("column", column);
			map.put("word", word);
			map.put("isSearch", isSearch);
			map.put("begin", begin + "");
			map.put("end", end + "");

			searchCourse = service.searchCourse(map);
			totalCount = service.getSearchTotalCount(map);
			model.addAttribute("searchccourse", searchCourse);
			model.addAttribute("word", word);

		}

		model.addAttribute("isSearch", isSearch);

		if (isSearch.equals("y")) {
			// - 데이터 조작
			for (CourseDTO dto : searchCourse) {

				// 날짜 자르기
				String regdate = dto.getCregdate();

				regdate = regdate.substring(0, 10);

				dto.setCregdate(regdate);

				// 태그 이스케이프
				String subject = dto.getCname();
				subject = subject.replace("<", "&lt;").replace(">", "&gt;");

				String info = dto.getCinfo();
				subject = subject.replace("<", "&lt;").replace(">", "&gt;");

				// 내용 자르기
				if (info.length() > 50) {
					info = info.substring(0, 50);
					dto.setCinfo(info + "..");
				}

				// 숫자 구분자
				DecimalFormat format = new DecimalFormat("###,###");

				String cost = dto.getCcost();
				cost = format.format(Integer.parseInt(cost));

				dto.setCcost(cost);

				// 제목 검색 중 + 검색어 강조

				subject = subject.replace(word,
						"<span style=\"background-color: #14bdee; color: #ffffff;\">" + word + "</span>");
				dto.setCname(subject);

			}

		} else {

			for (CourseDTO dto : allCourse) {

				// 날짜 자르기
				String regdate = dto.getCregdate();

				regdate = regdate.substring(0, 10);

				dto.setCregdate(regdate);

				// 태그 이스케이프
				String subject = dto.getCname();
				subject = subject.replace("<", "&lt;").replace(">", "&gt;");

				String info = dto.getCinfo();
				subject = subject.replace("<", "&lt;").replace(">", "&gt;");

				// 내용 자르기
				if (info.length() > 45) {
					info = info.substring(0, 45);
					dto.setCinfo(info + "..");
				}

				// 숫자 구분자
				DecimalFormat format = new DecimalFormat("###,###");

				String cost = dto.getCcost();
				cost = format.format(Integer.parseInt(cost));

				dto.setCcost(cost);

			}

		}

		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		String pagebar = ""; // 페이지바 태그

		int blockSize = 10; // 한번에 보여지는 페이지바 수
		int n = 0; // 출력 페이지 번호
		int loop = 0; // 루프 변수

		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		if (n == 1) {
			pagebar += String.format(
					"<li><a href='#!' style='cursor:not-allowed;'><i class=\"fa fa-angle-left\"aria-hidden=\"true\"></i></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='/academy/course/courselist?page=%d&column=%s&word=%s'><i class=\"fa fa-angle-left\"aria-hidden=\"true\"></i></a></li>",
					n - 1, column, word);
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (nowPage == n) {
				pagebar += String.format(" <li class=\"active\"><a href='#!' style='color:#ffffff;'>%d</a></li> ", n);
			} else {
				pagebar += String.format(
						" <li><a href='/academy/course/courselist?page=%d&column=%s&word=%s'>%d</a></li> ", n, column,
						word, n);
			}
			loop++;
			n++;
		}

		if (n > totalPage) {
			pagebar += String.format(
					"<li><a href='#!' style='cursor:not-allowed;'><i class=\"fa fa-angle-right\"aria-hidden=\"true\"></i></a></li>",
					n);
		} else {
			pagebar += String.format(
					"<li><a href='/academy/course/courselist?page=%d&column=%s&word=%s'><i class=\"fa fa-angle-right\"aria-hidden=\"true\"></i></a></li>",
					n, column, word);
		}

		model.addAttribute("pagebar", pagebar);

		model.addAttribute("list", list);
		
		
		return "a.course.courselist";

	}
	
	/**
	 * @author 구대현
	 * 선택한 카테고리의 과정을 출력하는 리스트입니다.
	 * @param category
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/course/coursecategory")
	public String courseCategory(String category, Model model) {
		
		List<CourseDTO> list = null;
		
		switch(category) {
			
			case "web":
				category = "웹개발";
				list = service.getCategory(category);
				break;
			case "app":
				category = "앱개발";
				list = service.getCategory(category);
				break;
			case "game":
				category = "게임개발";
				list = service.getCategory(category);
				break;
			case "etc":
				category = "기타";
				list = service.getCategory(category);
				break;
			case "java":
				category = "JAVA";
				list = service.getLanguege(category);
				break;
			case "html":
				category = "HTML";
				list = service.getLanguege(category);
				break;
			case "sql":
				category = "SQL";
				list = service.getLanguege(category);
				break;
			case "css":
				category = "CSS";
				list = service.getLanguege(category);
				break;
			case "python":
				category = "파이썬";
				list = service.getLanguege(category);
				break;
			case "js":
				category = "JavaScript";
				list = service.getLanguege(category);
				break;
				
			default:
				break;
		}
		
		model.addAttribute("categorylist", list);
		
		return "a.course.courselist";
	}

	/**
	 * @author 구대현
	 * 과정의 상세정보를 출력하는 메소드입니다.
	 * @param seq
	 * @param stuseq
	 * @param model
	 * @return
	 */
	@GetMapping(value="/course/coursedetail")
	public String courseDetail(String seq, String stuseq, Model model) {
		
		List<CourseDTO> lList = service.getLatestList();
		
		CourseDTO cdto = service.getCourseDetail(seq);
		
		
		for(CourseDTO dto : lList) {
			
		
			// 숫자 구분자
			DecimalFormat format = new DecimalFormat("###,###");
	
			String cost = dto.getCcost();
			cost = format.format(Integer.parseInt(cost));
			
			dto.setCcost(cost);
		}

		
		int jjim = service.getJjimCount(seq);
		
		model.addAttribute("jjim", jjim);
		model.addAttribute("cdto", cdto);
		model.addAttribute("llist", lList);

		CourseDTO checkDto = new CourseDTO();
		
		checkDto.setCseq(seq);
		checkDto.setStuseq(stuseq);
		
		int result = 0;
		int checkjjim = 0;
		
		//로그인 시에만 체크
		if(stuseq != null || stuseq != "") {
			result = service.checkApply(checkDto);			
			checkjjim = service.checkJjim(checkDto);
		}
		
		
		model.addAttribute("checkapply", result);
		model.addAttribute("checkjjim", checkjjim);
		
		return "a.course.coursedetail";
		
	}
	
	/**
	 * @author 구대현
	 * 선택한 과정을 찜 목록에 추가하는 메소드입니다.
	 * @param seq
	 * @param stuseq
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@GetMapping(value="/course/coursejjim")
	public String courseJjim(String seq, String stuseq, Model model) throws IOException {
		
		CourseDTO dto = new CourseDTO();
		
		dto.setCseq(seq);
		dto.setStuseq(stuseq);
		
		
		int result = service.courseJjim(dto); 			
		
		if (result==1) {
			return "redirect:/course/coursedetail?seq=" + seq + "&stuseq=" + stuseq;			
		}
		
		return null;
		
	}

	/**
	 * @author 구대현
	 * 추가한 찜목록을 다시 취소하는 메소드입니다.
	 * @param seq
	 * @param stuseq
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@GetMapping(value="/course/coursejjimcancel")
	public String courseJjimCancel(String seq, String stuseq, Model model) throws IOException {
		
		CourseDTO dto = new CourseDTO();
		
		dto.setCseq(seq);
		dto.setStuseq(stuseq);
		
		int result = service.courseJjimCancel(dto); 			
		
		if (result==1) {
			return "redirect:/course/coursedetail?seq=" + seq + "&stuseq=" + stuseq;			
		}
		
		return null;
		
	}
	
	/**
	 * @author 구대현
	 * 선택한 과정을 신청하는 메소드입니다.
	 * @param seq
	 * @param stuseq
	 * @param model
	 * @return
	 */
	@GetMapping(value="/course/applycourse")
	public String applyCourse(String seq, String stuseq, Model model){
		
		CourseDTO dto = new CourseDTO();
		
		dto.setCseq(seq);
		dto.setStuseq(stuseq);
		
		int result = service.applyCourse(dto); 			
		
		if(result==1) {

			return "redirect:/course/coursedetail?seq=" + seq + "&stuseq=" + stuseq;
		}
		
		return null; 	
		
	}

	/**
	 * @author 구대현
	 * 선택한 과정 신청을 취소하는 메소드입니다.
	 * @param seq
	 * @param stuseq
	 * @param model
	 * @return
	 */
	@GetMapping(value="/course/applycancelcourse")
	public String applyCancelCourse(String seq, String stuseq, Model model){
		
		CourseDTO dto = new CourseDTO();
		
		dto.setCseq(seq);
		dto.setStuseq(stuseq);
		
		int result = service.applyCancelCourse(dto); 			
		
		if(result==1) {

			return "redirect:/course/coursedetail?seq=" + seq + "&stuseq=" + stuseq;
		}
		
		return null; 	
		
	}
}
