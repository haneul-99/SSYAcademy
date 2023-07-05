package com.test.academy.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;



@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	@Override
	public AdminDTO get(String adseq) {
		
		return dao.get(adseq);
	}
	
	@Override
	public List<StudentDTO> student() {
	
		return dao.student();
	}
	@Override
	public List<AcademyDTO> academy() {
		
		return dao.academy();
	}
}
