package com.test.academy.student;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.academy.dto.ApplyProjectDTO;
import com.test.academy.dto.ClassDTO;
import com.test.academy.dto.ClassReviewDTO;
import com.test.academy.dto.CommunityDTO;
import com.test.academy.dto.CompleteReviewDTO;
import com.test.academy.dto.PostDTO;
import com.test.academy.dto.ProjectDTO;
import com.test.academy.dto.ProjectMemberDTO;
import com.test.academy.dto.ResumeDTO;
import com.test.academy.dto.StudentDTO;
import com.test.academy.dto.TeacherReviewDTO;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentDAO dao;
	
	

	@Override
	public StudentDTO get(String stuseq) {
		
		return dao.get(stuseq);
	}


	@Override
	public List<ClassReviewDTO> crboard(String stuseq) {
		
		return dao.crboard(stuseq);
	}


	@Override
	public List<TeacherReviewDTO> trboard(String stuseq) {
		
		return dao.trboard(stuseq);
	}


	@Override
	public List<CompleteReviewDTO> completeboard(String stuseq) {
		
		return dao.completeboard(stuseq);
	}


	@Override
	public List<CommunityDTO> cmboard(String stuseq) {
		
		return dao.cmboard(stuseq);
	}


	@Override
	public List<ResumeDTO> resume(String stuseq) {
		
		return dao.resume(stuseq);
	}
	
	@Override
	public int edit(StudentDTO dto) {
		
		return dao.edit(dto);
	}


	@Override
	public int editresume(String stuseq, HttpServletRequest req) {
		
		ResumeDTO dto = new ResumeDTO();
		
		dto.setRseq(req.getParameter("rseq"));
		dto.setEdu(req.getParameter("edu"));
		dto.setArmy(req.getParameter("army"));
		dto.setLicense(req.getParameter("license"));
		dto.setIntroduce(req.getParameter("introduce"));
		dto.setStuseq(req.getParameter("stuseq"));

	      
	      int result = dao.editresume(dto);
	    
	      
	      return result;
	}
	
//	 
//	   private String getFileName(String path, String filename) {
//	      int n = 1;
//	      int index = filename.lastIndexOf(".");
//	      
//	      String tempName = filename.substring(0, index); 
//	      String tempExt = filename.substring(index); 
//	      
//	      while (true) { 
//	         
//	         File file = new File(path + "\\" + filename);
//	         
//	         if (file.exists()) { 
//	            
//	            filename = String.format("%s_%d%s", tempName, n, tempExt);
//	            n++;   
//	         } else {
//	            return filename;
//	         }
//	         
//	      }
//	   }



	@Override
	public int addresume(HttpServletRequest req) {
			
			ResumeDTO dto = new ResumeDTO();
			
		    dto.setEdu(req.getParameter("edu"));
		    dto.setLicense(req.getParameter("license"));
		    dto.setArmy(req.getParameter("army"));
		    dto.setIntroduce(req.getParameter("introduce"));
		    dto.setStuseq(req.getParameter("stuseq"));
		    

		    int result = dao.addresume(dto);
		      
		    return result;

		}
	
	

	@Override
	public List<ClassDTO> studentclass(String stuseq) {
		
		List<ClassDTO> list = dao.studentclass(stuseq);

		for(ClassDTO dto : list) {
			
			String cstart = dto.getCperiod();
			String cend = dto.getCperiod();
			String state = "";
			
			cstart = cstart.substring(0, 10);
			cend = cend.substring(11);
			
			dto.setCend(cend);
			
			LocalDate start = LocalDate.parse(cstart);
			LocalDate end = LocalDate.parse(cend);
			LocalDate sysdate = LocalDate.now();
			
			if (sysdate.isBefore(start)) { //시작날짜보다 작을경우 > 이용예정
				state="w";
			} else { //현재날짜가 시작날짜보다 같거나 클경우
				if (sysdate.isAfter(end)){ // 현재날짜가 종료날짜보다 큰 경우 > 이용 완료
					state="x";
				} else { //현재날짜가 시작날짜보다 같거나 크고 종료날짜보다 작거나 같은경우 > 진행중
					state="o";
				}
				
			}
			dto.setState(state);
		}
		
		return list;
	}


	@Override
	public ResumeDTO sturesume(String stuseq) {
		
		return dao.sturesume(stuseq);
	}

	@Override
	public int classdelete(String mccseq) {
		
		return dao.classdelete(mccseq);
	}


	@Override
	public List<ProjectDTO> studentproject(String stuseq) {
		
		List<ProjectDTO> list = dao.studentproject(stuseq);

		for(ProjectDTO dto : list) {
			
			String pstart = dto.getPrperiod();
			String pend = dto.getPrperiod();
			
			
			pstart = pstart.substring(0, 10);
			pend = pend.substring(11);
			
			dto.setPstart(pstart);
			dto.setPend(pend);
			
			LocalDate start = LocalDate.parse(pstart);
			LocalDate end = LocalDate.parse(pend);
		}
		
		return list;
	}


	@Override
	public int projectdelete(String prseq) {

		int result = dao.projectMemberdel(prseq);
		result = dao.applyProject(prseq);
		result = dao.projectcomment(prseq);
		result = dao.projectdelete(prseq);
		
		return result;
	}


	@Override
	public List<ProjectMemberDTO> projectmember(String stuseq) {
		
		List<ProjectMemberDTO> list = dao.projectmember(stuseq);

		for(ProjectMemberDTO dto : list) {
			
			String apstart = dto.getPrperiod();
			String apend = dto.getPrperiod();
			String state = "";
			
			apstart = apstart.substring(0, 10);
			apend = apend.substring(11);
		
			LocalDate start = LocalDate.parse(apstart);
			LocalDate end = LocalDate.parse(apend);
			LocalDate sysdate = LocalDate.now();

			if (sysdate.isBefore(start)) { 
				state="w";
			} else { 
				if (sysdate.isAfter(end)){ 
					state="x";
				} else { 
					state="o";
				}
				
			}
			dto.setState(state);
		}
		
		return list;
		
		//return dao.projectmember(stuseq);
	}


	@Override
	public List<ApplyProjectDTO> projectapply(String apseq) {
		
		List<ApplyProjectDTO> list = dao.projectapply(apseq);

		for(ApplyProjectDTO dto : list) {
			
			String apstart = dto.getPrperiod();
			String apend = dto.getPrperiod();
			String state = "";
			
			apstart = apstart.substring(0, 10);
			apend = apend.substring(11);
			
			dto.setApstart(apstart);
			dto.setApend(apend);
			
			LocalDate start = LocalDate.parse(apstart);
			LocalDate end = LocalDate.parse(apend);
			LocalDate sysdate = LocalDate.now();

			if (sysdate.isBefore(start)) { 
				state="w";
			} else { 
				if (sysdate.isAfter(end)){ 
					state="x";
				} else { 
					state="o";
				}
				
			}
			dto.setState(state);
		}
		
		return list;
	}

//
//	@Override
//	public int projapplydel(String stuseq, String prseq) {
//		
//		return dao.projapplydel(stuseq, prseq);
//	}


	@Override
	public int delresumeok(String stuseq) {
		
		return dao.delresumeok(stuseq);
	}


	@Override
	public List<PostDTO> stumanage(String stuseq) {
		
		return dao.stumanage(stuseq);
	}

	@Override
	public List<ProjectMemberDTO> membermanage(String stuseq) {
		return dao.membermanage(stuseq);
	}


	@Override
	public List<ApplyProjectDTO> applymanage(String stuseq) {
		
		return dao.applymanage(stuseq);
	}


	@Override
	public int projapplydel(String stuseq) {
		
		return dao.projapplydel(stuseq);
	}


	@Override
	public int rejectdelok(String stuseq) {
		
		return dao.rejectdelok(stuseq);
	}


	@Override
	public int approvaladdok(String stuseq) {
		
		return dao.approvaladdok(stuseq);
	}


	@Override
	public int participatedelok(String pmseq) {
		
		return dao.participatedelok(pmseq);
	}
	
}