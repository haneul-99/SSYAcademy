package com.test.academy.admin;

import java.util.List;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

public interface AdminDAO {

	AdminDTO get(String adseq);

	List<StudentDTO> student();

	List<AcademyDTO> academy();

}
