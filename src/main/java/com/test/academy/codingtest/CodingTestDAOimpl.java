package com.test.academy.codingtest;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.CodingTestDTO;

@Repository
public class CodingTestDAOimpl implements CodingTestDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<CodingTestDTO> codingtestlist() {
		
		return template.selectList("codingtest.codingtestlist");
	}

	@Override
	public CodingTestDTO codingtestview(String ctseq) {
		// TODO Auto-generated method stub
		return template.selectOne("codingtest.codingtestview", ctseq);
	}

}
