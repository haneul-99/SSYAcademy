package com.test.academy.account;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

@Repository
public class LoginDAOimpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int studentLoginok(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.studentLoginok", sdto);
	}

	@Override
	public int academyLoginok(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.academyLoginok", acdto);
	}

	@Override
	public int adminLoginok(AdminDTO addto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.adminLoginok", addto);
	}

	@Override
	public StudentDTO getStuinfo(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.getStuinfo", sdto);
	}

	@Override
	public AcademyDTO getAcademyinfo(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.getAcademyinfo", acdto);
	}

	@Override
	public AdminDTO getAdmininfo(AdminDTO addto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.getAdmininfo", addto);
	}
	@Override
	public int stuFindidok(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.stuFindidok", sdto);
	}
	

	@Override
	public StudentDTO getStufindid(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.getStufindid", sdto);
	}

	@Override
	public int acFindidok(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.acFindidok", acdto);
	}

	@Override
	public AcademyDTO getAcfindid(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.getAcfindid", acdto);
	}

	@Override
	public String getStuid(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.getStuid", sdto);
	}

	@Override
	//String pw -> Dto
	public int stupwresetsuccess(StudentDTO sdto) {
		// TODO Auto-generated method stub
		return template.update("login.stupwresetsuccess", sdto);
	}

	@Override
	public String getAcid(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return template.selectOne("login.getAcid", acdto);
	}

	@Override
	public int acpwresetsuccess(AcademyDTO acdto) {
		// TODO Auto-generated method stub
		return template.update("login.acpwresetsuccess", acdto);
	}
	
	
}
