package com.test.academy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.ClassDTO;
import com.test.academy.dto.JjimDTO;
import com.test.academy.dto.MapcsDTO;
import com.test.academy.dto.QnaDTO;
import com.test.academy.dto.StudentDTO;
import com.test.academy.dto.TeacherDTO;

public interface AcademyDAO {

	List<AcademyDTO> alist();

	List<String> jlist();

	List<ClassDTO> pclist(List<String> jlist);

	List<ClassDTO> sclist();

	List<ClassDTO> jclist(String word);

	AcademyDTO get(String aseq);

	int edit(AcademyDTO dto);

	List<TeacherDTO> teacher(String aseq);

	List<ClassDTO> getClass(String aseq);

	List<MapcsDTO> getMapcs(String aseq);

	int del(String tseq);

	int tadd(TeacherDTO dto);

	int cadd(ClassDTO dto);

	ClassDTO getc(String tseq);

	int editc(ClassDTO dto);

	StudentDTO gets(String stuseq);

	List<QnaDTO> getQna(String aseq);

	QnaDTO getq(String aseq);

	

	int qadd(String aseq, HttpServletRequest req, QnaDTO dto);

	AcademyDTO getAca(String seq);

	List<ClassDTO> classlist(String seq);

	List<JjimDTO> jjimlist(String stuid);

	int delJjim(String jseq);
}
