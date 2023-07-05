package com.test.academy.account;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.AcademyDTO;
import com.test.academy.dto.AccountDTO;
import com.test.academy.dto.AdminDTO;
import com.test.academy.dto.StudentDTO;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int acaregister(AccountDTO dto) {
		
		return template.insert("account.acaregister", dto);
	}

	@Override
	public int sturegister(AccountDTO dto) {
		
		return template.insert("account.sturegister", dto);
	}
	
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

//	@Override
//	public String getStuname(StudentDTO sdto) {
//		
//		return this.template.selectOne("login.getstuname", sdto);
//	}


	

}
