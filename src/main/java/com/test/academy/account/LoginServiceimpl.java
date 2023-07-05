package com.test.academy.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

@Service
public class LoginServiceimpl implements LoginService {

	@Autowired
	private LoginDAO dao;



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



	@Override
	public int stuFindidok(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return dao.stuFindidok(sdto);
	}

	
	@Override
	public StudentDTO getStufindid(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return dao.getStufindid(sdto);
	}



	@Override
	public int acFindidok(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return dao.acFindidok(acdto);
	}



	@Override
	public AcademyDTO getAcfindid(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return dao.getAcfindid(acdto);
	}



	@Override
	public String getStuid(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return dao.getStuid(sdto);
	}



	@Override
	public int stupwresetsuccess(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return dao.stupwresetsuccess(sdto);
	}



	@Override
	public String getAcid(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return dao.getAcid(acdto);
	}



	@Override
	public int acpwresetsuccess(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return dao.acpwresetsuccess(acdto);
	}



	
}
