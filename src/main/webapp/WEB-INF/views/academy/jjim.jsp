<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="course">
	<div class="container">
		<div class="row" style="padding-top: 150px; width:100%;">

			<!-- Courses Main Content -->
			<div class="col">
				<h1>찜 목록</h1>
				<div class="courses_container" style="padding: 15px;">
					<div class="row courses_row">
						<c:forEach items="${list}" var="dto">
							<!-- Course -->
							<div class="col-lg-6 course_col">
								<div class="course">
									<div class="course_body">
										<h3 class="course_title">
											<a href="/academy/course/coursedetail?seq=${dto.cseq}">${dto.cname}</a>
										</h3>
										<div class="course_teacher"></div>
										<div class="course_text">
											<p>${dto.cinfo}</p>
										</div>
									</div>
									<p style="text-align: right;">
										<a href="/academy/academy/jjimdelete?jseq=${dto.jseq}"><i
											class="fa-solid fa-trash"></i></a>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>