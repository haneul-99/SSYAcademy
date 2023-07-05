package com.test.academy.codingtest;

import java.util.List;

import com.test.academy.dto.CodingTestDTO;

public interface CodingTestService {

	List<CodingTestDTO> codingtestlist();

	CodingTestDTO codingtestview(String ctseq);

}
