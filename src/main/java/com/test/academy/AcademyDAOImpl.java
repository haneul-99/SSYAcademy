package com.test.academy;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.ClassDTO;
import com.test.academy.dto.JjimDTO;
import com.test.academy.dto.MapcsDTO;
import com.test.academy.dto.QnaDTO;
import com.test.academy.dto.StudentDTO;
import com.test.academy.dto.TeacherDTO;

@Repository
public class AcademyDAOImpl implements AcademyDAO{
	
	
	@Autowired
	private SqlSessionTemplate template;

	public List<AcademyDTO> alist() {
		return template.selectList("academy.alist");
	}
	
	@Override
	public List<String> jlist() {
		return template.selectList("academy.jlist");
	}
	
	@Override
	public List<ClassDTO> pclist(List<String> jlist) {
		
		List<ClassDTO> pclist = new ArrayList<>();
		
		for(String cseq : jlist ) {
			pclist.add(template.selectOne("academy.pclist",cseq));
		}
		
		for(ClassDTO dto : pclist) {
			dto.setCinfo(dto.getCinfo().substring(0,20) + "..");
		}
		
		return pclist;
	}
	
	
	@Override
	public List<ClassDTO> sclist() {

		return template.selectList("academy.sclist");
	}
	
	@Override
	public List<ClassDTO> jclist(String word) {
		return template.selectList("academy.jclist",word);
	}
	
	@Override
	public AcademyDTO get(String aseq) {
		
		return template.selectOne("academy.mypage",aseq);
	}

	@Override
	public int edit(AcademyDTO dto) {
		
		return template.update("academy.edit",dto);
	}
	
	@Override
	public List<TeacherDTO> teacher(String aseq) {
		
		return template.selectList("academy.teacher",aseq);
	}
	
	@Override
	public List<ClassDTO> getClass(String aseq) {
		
		return template.selectList("academy.openclasspage",aseq);
	}
	
	@Override
	public int cadd(ClassDTO dto) {
		
		return template.insert("academy.openclassadd",dto);
	}
	
	@Override
	public ClassDTO getc(String tseq) {
		
		return template.selectOne("academy.openclassget",tseq);
	}
	
	@Override
	public int editc(ClassDTO dto) {
		
		return template.update("academy.openclassedit",dto);
	}
	
	@Override
	public List<MapcsDTO> getMapcs(String aseq) {
		
		return template.selectList("academy.mapcs",aseq);
	}
	
	@Override
	public int del(String tseq) {
		
		return template.delete("academy.teacherdel",tseq);
	}
	
	
	@Override
	public int tadd(TeacherDTO dto) {
	
		return template.insert("academy.teacheradd",dto);
	}
	
	@Override
	public StudentDTO gets(String stuseq) {
		
		return template.selectOne("academy.mapcsdetail",stuseq);
	}
	
	@Override
	public List<QnaDTO> getQna(String aseq) {
		
		return template.selectList("academy.qna",aseq);
	}
	
	@Override
	public QnaDTO getq(String aseq) {
		
		return template.selectOne("academy.qnadetail",aseq);
	}
	
	
	@Override
	public int qadd(String aseq, HttpServletRequest req,QnaDTO dto) {
		
		return template.insert("academy.qnaadd",dto);
	}

	@Override
	public AcademyDTO getAca(String seq) {
		
		return template.selectOne("academy.academydetail", seq);
	}

	@Override
	public List<ClassDTO> classlist(String seq) {
		
		return template.selectList("academy.classlist", seq);
	}

	@Override
	public List<JjimDTO> jjimlist(String stuid) {
		return template.selectList("academy.jjimlist", stuid);
	}

	@Override
	public int delJjim(String jseq) {
		return template.delete("academy.jjimdelete", jseq);
	}

	
}
