package com.test.academy.course;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.academy.dto.CourseDTO;


@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDAOImpl dao;

	@Override
	public List<CourseDTO> getLatestList() {
		
		return dao.getLatestList();
	}

	@Override
	public List<CourseDTO> allCourse(HashMap<String, String> map) {
		
		return dao.allCourse(map);
	}

	@Override
	public int getAllTotalCount(HashMap<String, String> map) {

		return dao.getAllTotalCount(map);
	}

	@Override
	public List<CourseDTO> searchCourse(HashMap<String, String> map) {

		return dao.searchCourse(map);
	}

	@Override
	public int getSearchTotalCount(HashMap<String, String> map) {

		return dao.getSearchTotalCount(map);
	}

	@Override
	public List<CourseDTO> getCategory(String category) {

		return dao.getCategory(category);
	}

	@Override
	public List<CourseDTO> getLanguege(String category) {

		return dao.getLanguege(category);
	}

	@Override
	public CourseDTO getCourseDetail(String seq) {

		return dao.getCourseDetail(seq);
	}

	@Override
	public int getJjimCount(String seq) {

		return dao.getJjimCount(seq);
	}

	@Override
	public int courseJjim(CourseDTO dto) {
		
		return dao.courseJjim(dto);
	}

	@Override
	public int checkJjim(CourseDTO dto) {
		
		return dao.checkJjim(dto);
	}

	@Override
	public int checkApply(CourseDTO checkDto) {

		return dao.checkApply(checkDto);
	}

	@Override
	public int applyCourse(CourseDTO dto) {

		return dao.applyCourse(dto);
	}

	@Override
	public int applyCancelCourse(CourseDTO dto) {

		return dao.applyCancelCourse(dto);
	}

	@Override
	public int courseJjimCancel(CourseDTO dto) {

		return dao.courseJjimCancel(dto);
	}
	
}
