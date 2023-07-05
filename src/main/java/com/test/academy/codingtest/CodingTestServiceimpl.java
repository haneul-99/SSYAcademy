package com.test.academy.codingtest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.academy.dto.CodingTestDTO;

@Service
public class CodingTestServiceimpl implements CodingTestService {

	@Autowired
	private CodingTestDAO dao;
	
	@Override
	public List<CodingTestDTO> codingtestlist() {
		
		return dao.codingtestlist();
	}

	@Override
	public CodingTestDTO codingtestview(String ctseq) {
		// TODO Auto-generated method stub
		return dao.codingtestview(ctseq);
	}

	
}
