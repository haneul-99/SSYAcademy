package com.test.academy.project;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.ProjectCommentDTO;
import com.test.academy.dto.ProjectDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Autowired
	private SqlSessionTemplate template;

	public List<ProjectDTO> list() {
		
		return template.selectList("project.projectlist");
	}

	public ProjectDTO getDetail(String seq) {
		
		return template.selectOne("project.projectdetail", seq);
	}

	public List<ProjectDTO> allList() {
		
		return template.selectList("project.projectalllist");
	}

	@Override
	public int addProject(ProjectDTO dto) {
		
		return this.template.insert("project.addproject", dto);
	}

	@Override
	public String getName(String seq) {
		
		return this.template.selectOne("project.getname", seq);
	}
	
	@Override
	public int checkMember(String seq) {
		
		return this.template.selectOne("project.checkmember", seq);
	}

	@Override
	public List<ProjectDTO> getMemberName(String seq) {
		
		return this.template.selectList("project.getmembername", seq);
	}

	@Override
	public List<ProjectCommentDTO> getComment(String seq) {
		
		return this.template.selectList("project.getcomment", seq);
	}

	@Override
	public int getcommentCount(String seq) {
		
		return this.template.selectOne("project.getcommentcount", seq);
	}

	@Override
	public int addComment(String comment, String prseq, String seq) {
		
		ProjectCommentDTO dto = new ProjectCommentDTO();
		
		dto.setPccontent(comment);
		dto.setPrseq(prseq);
		dto.setStuseq(seq);
		
		return this.template.insert("project.addcomment", dto);
	}

	public int delComment(String seq) {
		
		return this.template.delete("project.delcomment", seq);
	}

	@Override
	public int editComment(ProjectCommentDTO dto) {
	
		return this.template.update("project.editcomment", dto);
	}

	@Override
	public int applyProject(ProjectDTO dto) {

		return this.template.insert("project.applyproject", dto);
	}

	@Override
	public int checkApply(ProjectDTO dto) {

		return this.template.selectOne("project.checkapply", dto);
	}

	@Override
	public int applyProjectCancel(ProjectDTO dto) {

		return this.template.delete("project.applyprojectcancel", dto);
	}

	
	
}

