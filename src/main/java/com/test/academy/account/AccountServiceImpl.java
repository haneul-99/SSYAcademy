
package com.test.academy.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AccountDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;


@Repository
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	private AccountDAO dao;

	@Override
	public int acaregister(AccountDTO dto) {
		return dao.acaregister(dto);
	}

	@Override
	public int sturegister(AccountDTO dto) {
		return dao.sturegister(dto);
	}
	
	@Override
	public int studentLoginok(StudentDTO sdto) {
		
		
		return dao.studentLoginok(sdto);
	}



	@Override
	public int academyLoginok(AcademyDTO acdto) {
		
		
		return dao.academyLoginok(acdto);
	}



	@Override
	public int adminLoginok(AdminDTO addto) {
		
		return dao.adminLoginok(addto);
	}



	@Override
	public StudentDTO getStuinfo(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return dao.getStuinfo(sdto);
	}



	@Override
	public AcademyDTO getAcademyinfo(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return dao.getAcademyinfo(acdto);
	}



	@Override
	public AdminDTO getAdmininfo(AdminDTO addto) {
		// TODO Auto-generated method stub
		return dao.getAdmininfo(addto);
	}



//	@Override
//	public String getStuname(StudentDTO sdto) {
//		
//		return dao.getStuname(sdto);
//	}

}
