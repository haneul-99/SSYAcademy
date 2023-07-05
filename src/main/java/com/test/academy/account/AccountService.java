package com.test.academy.account;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AccountDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

public interface AccountService {

	int acaregister(AccountDTO dto);

	int sturegister(AccountDTO dto);
	
	int studentLoginok(StudentDTO sdto);

	int academyLoginok(AcademyDTO acdto);

	int adminLoginok(AdminDTO addto);

	//String getStuname(StudentDTO sdto);

	StudentDTO getStuinfo(StudentDTO sdto);

	AcademyDTO getAcademyinfo(AcademyDTO acdto);

	AdminDTO getAdmininfo(AdminDTO addto);

}
