package com.test.academy.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public AdminDTO get(String adseq) {
		
		return template.selectOne("admin.adminmypage",adseq);
	}
	
	@Override
	public List<StudentDTO> student() {
	
		return template.selectList("admin.studentlist");
	}
	
	@Override
	public List<AcademyDTO> academy() {
	
		return template.selectList("admin.academylist");
	}
	
}
