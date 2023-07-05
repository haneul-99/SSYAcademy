<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="super_container">
	<!-- Course -->
	<div class="course">
		<div class="container">
			<div class="row">
				<!-- Course -->
				<div class="col-lg-8">

					<div class="course_container" style="margin-top:100px;">
						<div class="course_title">${dto.aname}</div>
						<div
							class="course_info d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">

							<!-- Course Info Item -->
							<div class="course_info_item">
								<div class="course_info_title">학원 홈페이지</div>
								<div class="course_info_text">
									<a href="${dto.alink}">${dto.alink}</a>
								</div>
							</div>

							<!-- Course Info Item -->
							<div class="course_info_item">
								<div class="course_info_title">지역</div>
								<div class="rating_r rating_r_4">
									${dto.aaddr}
								</div>
							</div>

							<!-- Course Info Item -->
							<div class="course_info_item">
								<div class="course_info_title">전화번호</div>
								<div class="course_info_text">
									<a href="#">${dto.atel}</a>
								</div>
							</div>

						</div>

						<!-- Course Image -->
						<div class="course_image">
							<img src="../resources/acaimages/${dto.aimage}" alt="default.jpg" id="acaimage">
						</div>

						<!-- Course Tabs -->
						<div class="course_tabs_container">
							<div class="tabs d-flex flex-row align-items-center justify-content-start">
								<div class="tab active">학원 설명</div>
							</div>
							<div class="tab_panels">

								<!-- Description -->
								<div class="tab_panel active">
									<div class="tab_panel_title">학원 정보</div>
									<div class="tab_panel_content">
										<div class="tab_panel_text">
											<p>${dto.ainfo}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Course Sidebar -->
				<div class="col-lg-4">
					<div class="sidebar">

						<!-- Feature -->
						<div class="sidebar_section">
							<div class="sidebar_section_title">과정 정보</div>
							<c:forEach items="${list}" var="dto">
							<div class="sidebar_feature">
								<div class="course_price" style="color:black; font-size: 1rem; font-weight: bold;"><a href="/academy/course/coursedetail?seq=${dto.cseq}">${dto.cname}</a></div>

								<!-- Features -->
								<div class="feature_list">

									<!-- Feature -->
									<div
										class="feature d-flex flex-row align-items-center justify-content-start">
										<div class="feature_title">
											<i class="fa fa-clock-o" aria-hidden="true"></i><span>기간</span>
										</div>
										<div class="feature_text ml-auto">${dto.cperiod}</div>
									</div>

									<!-- Feature -->
									<div
										class="feature d-flex flex-row align-items-center justify-content-start">
										<div class="feature_title">
											<i class="fa fa-users" aria-hidden="true"></i><span>분류</span>
										</div>
										<div class="feature_text ml-auto">${dto.ccategory}</div>
									</div>
									<div
										class="feature d-flex flex-row align-items-center justify-content-start">
										<div class="feature_title">
											<i class="fa fa-users" aria-hidden="true"></i><span>정원</span>
										</div>
										<div class="feature_text ml-auto">${dto.stunum}명</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>