package com.test.academy.account;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

public interface LoginDAO {


	int studentLoginok(StudentDTO sdto);

	int academyLoginok(AcademyDTO acdto);

	int adminLoginok(AdminDTO addto);

	StudentDTO getStuinfo(StudentDTO sdto);

	AcademyDTO getAcademyinfo(AcademyDTO acdto);

	AdminDTO getAdmininfo(AdminDTO addto);
	
	int stuFindidok(StudentDTO sdto);

	StudentDTO getStufindid(StudentDTO sdto);

	int acFindidok(AcademyDTO acdto);

	AcademyDTO getAcfindid(AcademyDTO acdto);
	
	String getStuid(StudentDTO sdto);

	int stupwresetsuccess(StudentDTO sdto);

	String getAcid(AcademyDTO acdto);

	int acpwresetsuccess(AcademyDTO acdto);
}
