package com.test.academy.course;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.CourseDTO;

@Repository
public class CourseDAOImpl implements CourseDAO {

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<CourseDTO> getLatestList() {
		
		return this.template.selectList("course.getlatestlist");
	}

	@Override
	public List<CourseDTO> allCourse(HashMap<String, String> map) {

		return this.template.selectList("course.allcourse", map);
	}

	@Override
	public int getAllTotalCount(HashMap<String, String> map) {

		return this.template.selectOne("course.getalltotalcount", map);
	}

	@Override
	public List<CourseDTO> searchCourse(HashMap<String, String> map) {

		if (map.get("column").equals("국비지원과정")) {

			return this.template.selectList("course.kukbi", map);
			
		} else if (map.get("column").equals("부트캠프과정")) {					
		
			return this.template.selectList("course.bute", map);

		} else {
						
			return this.template.selectList("course.searchcourse", map);
		}

		
	}

	@Override
	public int getSearchTotalCount(HashMap<String, String> map) {
				

		if (map.get("column").equals("국비지원과정")) {

			return this.template.selectOne("course.kukbicount", map);
			
		} else if (map.get("column").equals("부트캠프과정")) {					
		
			return this.template.selectOne("course.butecount", map);

		} else {
						
			return this.template.selectOne("course.getsearchtotalcount", map);
		}
		
	
	}

	@Override
	public List<CourseDTO> getCategory(String category) {

		return this.template.selectList("course.getcategory", category);
	
	}

	@Override
	public List<CourseDTO> getLanguege(String category) {

		return this.template.selectList("course.getlanguage", category);
		
	}

	@Override
	public CourseDTO getCourseDetail(String seq) {

		return this.template.selectOne("course.getcoursedetail", seq);
	}

	@Override
	public int getJjimCount(String seq) {

		return this.template.selectOne("course.getjjimcount", seq);
	}

	@Override
	public int courseJjim(CourseDTO dto) {
		
		return this.template.insert("course.coursejjim", dto);
	}

	@Override
	public int checkJjim(CourseDTO dto) {

		return this.template.selectOne("course.checkjjim", dto);
	}

	@Override
	public int checkApply(CourseDTO checkDto) {

		return this.template.selectOne("course.checkapply", checkDto);
	}

	@Override
	public int applyCourse(CourseDTO dto) {

		return this.template.insert("course.applycourse", dto);
	}

	@Override
	public int applyCancelCourse(CourseDTO dto) {

		return this.template.delete("course.applycancelcourse", dto);
	}

	@Override
	public int courseJjimCancel(CourseDTO dto) {

		return this.template.delete("course.coursejjimcancel", dto);
	}
	
}
