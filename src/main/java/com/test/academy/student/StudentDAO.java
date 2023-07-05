package com.test.academy.student;

import java.util.List;

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

public interface StudentDAO {

	StudentDTO get(String stuseq);

	List<ClassReviewDTO> crboard(String stuseq);

	int edit(StudentDTO dto);

	List<TeacherReviewDTO> trboard(String stuseq);

	List<CompleteReviewDTO> completeboard(String stuseq);

	List<CommunityDTO> cmboard(String stuseq);

	List<ResumeDTO> resume(String stuseq);

	int addresume(ResumeDTO dto);

	List<ClassDTO> studentclass(String stuseq);

	ResumeDTO sturesume(String stuseq);

	int editresume(ResumeDTO dto);

	int stueditresume(String stuseq);

	int classdelete(String mcsseq);

	List<ProjectDTO> studentproject(String stuseq);
	
	int projectMemberdel(String prseq);

	int projectdelete(String prseq);

	List<ProjectMemberDTO> projectmember(String stuseq);

	List<ApplyProjectDTO> projectapply(String stuseq);

	int delresumeok(String stuseq);

	List<PostDTO> stumanage(String stuseq);

	List<ProjectMemberDTO> membermanage(String stuseq);

	List<ApplyProjectDTO> applymanage(String stuseq);

	int projapplydel(String apseq);

	int rejectdelok(String stuseq);

	int approvaladdok(String stuseq);
	
	int participatedelok(String pmseq);

	int applyProject(String prseq);

	int projectcomment(String prseq);


}
