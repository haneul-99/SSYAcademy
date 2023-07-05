package com.test.academy.project;

import java.util.List;

import com.test.academy.dto.ProjectCommentDTO;
import com.test.academy.dto.ProjectDTO;

public interface ProjectDAO {

	int addProject(ProjectDTO dto);
	
	String getName(String name);
	
	int checkMember(String seq);
	
	List<ProjectDTO> getMemberName(String seq);
	
	List<ProjectCommentDTO> getComment(String seq);

	int getcommentCount(String seq);
	
	int addComment(String comment, String prseq, String seq);
	
	int delComment(String seq);
	
	int editComment(ProjectCommentDTO dto);
	
	int applyProject(ProjectDTO dto);
	
	int checkApply(ProjectDTO dto);
	
	int applyProjectCancel(ProjectDTO dto);
}
