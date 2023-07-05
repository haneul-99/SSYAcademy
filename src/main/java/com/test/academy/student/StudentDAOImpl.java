package com.test.academy.student;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class StudentDAOImpl implements StudentDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public StudentDTO get(String stuseq) {
		
		return template.selectOne("student.mypage", stuseq);
	}

	@Override
	public List<ClassReviewDTO> crboard(String stuseq) {
		
		return template.selectList("student.crboard", stuseq);
	}

	@Override
	public int edit(StudentDTO dto) {
		
		return template.update("student.edit", dto);
	}

	@Override
	public List<TeacherReviewDTO> trboard(String stuseq) {
		
		return template.selectList("student.trboard",stuseq);
	}

	@Override
	public List<CompleteReviewDTO> completeboard(String stuseq) {
		
		return template.selectList("student.completeboard", stuseq);
	}

	@Override
	public List<CommunityDTO> cmboard(String stuseq) {
		
		return template.selectList("student.cmboard", stuseq);
	}

	@Override
	public List<ResumeDTO> resume(String stuseq) {
		
		return template.selectList("student.resume", stuseq);
	}

	public int addresume(ResumeDTO dto) {
		
		return template.insert("student.addresume", dto);
	}


	@Override
	public List<ClassDTO> studentclass(String stuseq) {
		
		return template.selectList("student.studentclass", stuseq);
	}

	@Override
	public ResumeDTO sturesume(String stuseq) {
		
		return template.selectOne("student.sturesume", stuseq);
	}

	@Override
	public int editresume(ResumeDTO dto) {
		
		return template.update("student.editresume", dto);
	}

	@Override
	public int stueditresume(String stuseq) {
		
		return template.update("student.stueditresume", stuseq);
	}

	@Override
	public int classdelete(String mccseq) {
		
		return template.delete("student.classdelete", mccseq);
	}

	@Override
	public List<ProjectDTO> studentproject(String stuseq) {
		
		return template.selectList("student.studentproject", stuseq);
	}
	

	@Override
	public int projectMemberdel(String prseq) {
		
		return template.delete("student.projectMemberdel", prseq);
	}

	@Override
	public int projectdelete(String prseq) {
		
		return template.delete("student.projectdelete", prseq);
	}

	@Override
	public List<ProjectMemberDTO> projectmember(String stuseq) {
		
		return template.selectList("student.projectmember",stuseq);
	}

	@Override
	public List<ApplyProjectDTO> projectapply(String stuseq) {
		
		return template.selectList("student.projectapply",stuseq);
	}

	@Override
	public int projapplydel(String apseq) {
		
		return template.delete("student.projapplydel", apseq);
	}

	@Override
	public int delresumeok(String stuseq) {
		
		return template.delete("student.delresumeok", stuseq);
	}

	@Override
	public List<PostDTO> stumanage(String stuseq) {
		
		return template.selectList("student.stumanage", stuseq);
	}

	@Override
	public List<ProjectMemberDTO> membermanage(String stuseq) {
		
		return template.selectList("student.membermanage",stuseq);
	}

	@Override
	public List<ApplyProjectDTO> applymanage(String stuseq) {
		
		return template.selectList("student.applymanage",stuseq);
	}
//
//	@Override
//	public int projapplydel(String stuseq, String prseq) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

	@Override
	public int rejectdelok(String stuseq) {
		
		return template.delete("student.rejectdelok", stuseq);
	}

	@Override
	public int approvaladdok(String stuseq) {
		
		return template.insert("student.approvaladdok", stuseq);
	}


	@Override
	public int participatedelok(String pmseq) {
		
		return template.delete("student.participatedelok", pmseq);
	}


	@Override
	public int applyProject(String prseq) {
		
		return template.delete("student.applyProject", prseq);
	}

	@Override
	public int projectcomment(String prseq) {
		
		return template.delete("student.projectcomment", prseq);
	}


	


	


	

}
