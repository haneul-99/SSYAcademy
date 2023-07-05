package com.test.academy.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.academy.dto.ProjectCommentDTO;
import com.test.academy.dto.ProjectDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAOImpl dao;
	
	@Override
	public int addProject(ProjectDTO dto) {
		
		return dao.addProject(dto);
	}
	
	@Override
	public String getName(String seq) {
		
		return dao.getName(seq);
	}
	
	@Override
	public int checkMember(String seq) {
		
		return dao.checkMember(seq);
	}

	@Override
	public List<ProjectDTO> getMemberName(String seq) {
		
		return dao.getMemberName(seq);
	}

	@Override
	public List<ProjectCommentDTO> getComment(String seq) {
		
		return dao.getComment(seq);
	}

	@Override
	public int getcommentCount(String seq) {
		
		return dao.getcommentCount(seq);
	}

	@Override
	public int addComment(String comment, String prseq, String seq) {
		
		return dao.addComment(comment, prseq, seq);
	}

	@Override
	public int delComment(String seq) {
		
		return dao.delComment(seq);
	}

	@Override
	public int editComment(ProjectCommentDTO dto) {
		
		return dao.editComment(dto);
	}

	@Override
	public int applyProject(ProjectDTO dto) {

		return dao.applyProject(dto);
	}

	@Override
	public int checkApply(ProjectDTO dto) {

		return dao.checkApply(dto);
	}

	@Override
	public int applyProjectCancel(ProjectDTO dto) {

		return dao.applyProjectCancel(dto);
	}
}
