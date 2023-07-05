
package com.test.academy;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.ClassDTO;
import com.test.academy.dto.JjimDTO;
import com.test.academy.dto.MapcsDTO;
import com.test.academy.dto.QnaDTO;
import com.test.academy.dto.StudentDTO;
import com.test.academy.dto.TeacherDTO;

@Service
public class AcademyServiceImpl implements AcademyService{
	
	@Autowired
	private AcademyDAO adao;

	@Autowired
	private AcademyDAO dao;

	public List<AcademyDTO> alist() {
		
		List<AcademyDTO> alist = adao.alist();
		
		for(AcademyDTO dto : alist) {
			String[] address = dto.getAaddr().split(" ");
			dto.setAaddr(address[0] + " " + address[1]);

			
			dto.setAaddr(dto.getAaddr());
			dto.setAinfo(dto.getAinfo().substring(0,20) + "...");
			
		}
		
		return alist;
	}

	public List<String> jlist() {
		
		 List<String> jlist = adao.jlist();
		Stream<String> jstream = jlist.stream().limit(3);
		jlist = jstream.collect(Collectors.toList());
		
		
		return jlist;
	}
	
	@Override
	public List<ClassDTO> pclist(List<String> jlist) {

		return adao.pclist(jlist);
	}

	
	@Override
	public List<ClassDTO> sclist() {
		return adao.sclist();
	}
	
	@Override
	public List<ClassDTO> jclist(String word) {
		
		List<ClassDTO> jclist = adao.jclist(word);
		
		for(ClassDTO dto : jclist) {
			dto.setCinfo(dto.getCinfo().substring(0,20) + "...");
		}
		
		
		
		return jclist;
	}

	@Override
	public AcademyDTO get(String aseq) {
		
		return dao.get(aseq);
	}
	
	@Override
	public int edit(AcademyDTO dto) {
		
		return dao.edit(dto);
	}
	@Override
	public int tadd(TeacherDTO dto) {
		// TODO Auto-generated method stub
		return dao.tadd(dto);
	}
	@Override
	public List<TeacherDTO> teacher(String aseq) {
		
		return dao.teacher(aseq);
	}
	
	@Override
	public List<ClassDTO> getClass(String aseq) {
		
		return dao.getClass(aseq);
	}
	@Override
	public int cadd(ClassDTO dto) {
		
		return dao.cadd(dto);
	}
	
	@Override
	public ClassDTO getc(String tseq) {
		
		return dao.getc(tseq);
	}
	
	@Override
	public int editc(ClassDTO dto) {
		
		return dao.editc(dto);
	}
	
	@Override
	public List<MapcsDTO> getMapcs(String aseq) {
		
		return dao.getMapcs(aseq);
	}
	
	@Override
	public int del(String tseq) {
	
		return dao.del(tseq);
	}
	
	@Override
	public StudentDTO gets(String stuseq) {
		
		return dao.gets(stuseq);
	}
	
	@Override
	public List<QnaDTO> getQna(String aseq) {
	
		return dao.getQna(aseq);
	}
	
	@Override
	public QnaDTO getq(String aseq) {
		
		return dao.getq(aseq);
	}
	
	
	@Override
	public int qadd(String aseq, HttpServletRequest req, QnaDTO dto) {
		
		return dao.qadd(aseq,req,dto);
	}

	@Override
	public AcademyDTO getAca(String seq) {
		return dao.getAca(seq);
	}

	@Override
	public List<ClassDTO> classlist(String seq) {
		return dao.classlist(seq);
	}

	@Override
	public List<JjimDTO> jjimlist(String stuid) {
		return dao.jjimlist(stuid);
	}

	@Override
	public int delJjim(String jseq) {
		// TODO Auto-generated method stub
		return dao.delJjim(jseq);
	}
}















