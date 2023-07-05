package com.test.academy.course;

import java.util.HashMap;
import java.util.List;

import com.test.academy.dto.CourseDTO;

public interface CourseService {

	List<CourseDTO> getLatestList();

	List<CourseDTO> allCourse(HashMap<String, String> map);

	int getAllTotalCount(HashMap<String, String> map);

	List<CourseDTO> searchCourse(HashMap<String, String> map);

	int getSearchTotalCount(HashMap<String, String> map);

	List<CourseDTO> getCategory(String category);

	List<CourseDTO> getLanguege(String category);

	CourseDTO getCourseDetail(String seq);

	int getJjimCount(String seq);

	int courseJjim(CourseDTO dto);

	int checkJjim(CourseDTO dto);

	int checkApply(CourseDTO checkDto);

	int applyCourse(CourseDTO dto);

	int applyCancelCourse(CourseDTO dto);

	int courseJjimCancel(CourseDTO dto);

}
