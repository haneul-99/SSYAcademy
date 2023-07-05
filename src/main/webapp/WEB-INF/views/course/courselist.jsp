<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="super_container">





	<!-- Home -->

	<div class="home">
		<div class="breadcrumbs_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="breadcrumbs">
							<ul>
								<li><a href="/academy/academy/index">홈</a></li>
								<li>과정</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Courses -->

	<div class="courses">
		<div class="container">
			<div class="row">

				<!-- Courses Main Content -->
				<div class="col-lg-8">
					<div class="courses_search_container">
						<form action="/academy/course/courselist" id="courses_search_form"
							class="courses_search_form d-flex flex-row align-items-center justify-content-start">
							<input type="search" class="courses_search_input"
								placeholder="과정명" required="required" name="word"> 
								<select id="courses_search_select"
								class="courses_search_select courses_search_input" name="column">
								<option>전체</option>
								<option>국비지원과정</option>
								<option>부트캠프과정</option>
							</select>
							<button action="submit" class="courses_search_button ml-auto">검색</button>
						</form>
					</div>
					<div class="courses_container">
						<div class="row courses_row">
							
							<c:if test="${isSearch eq 'n'}">
							<c:forEach items="${allcourse}" var="dto">
								<!-- Course -->
								<div class="col-lg-6 course_col">
									<div class="course">
										<div class="course_body">
											<h3 class="course_title">
												<a href="/academy/course/coursedetail?seq=${dto.cseq}&stuseq=${stuinfo.stuseq}">${dto.cname}</a>
											</h3>
											<div class="course_teacher">${dto.tname}</div>
											<div class="course_text">
												<p>${dto.cinfo}</p>
											</div>
										</div>
										<div class="course_footer">
											<div
												class="course_footer_content d-flex flex-row align-items-center justify-content-start">
												<div class="course_info">
													<i class="fa fa-graduation-cap" aria-hidden="true"></i> <span>${dto.stunum}</span>
												</div>
												<div class="course_info">
													<i class="fa fa-clock-o" aria-hidden="true"></i> <span>${dto.cperiod}</span>
												</div>
											</div>
											<div class="course_price ml-auto"
												style="padding-bottom: 10px;">
												<c:if test="${dto.ccost ne '0'}">											
													\ ${dto.ccost}
												</c:if>
												<c:if test="${dto.ccost eq '0'}">											
													FREE
												</c:if>
												
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							</c:if>

							<c:if test="${isSearch eq 'y'}">
							<c:forEach items="${searchccourse}" var="ydto">
								<!-- Course -->
								<div class="col-lg-6 course_col">
									<div class="course">
										<div class="course_body">
											<h3 class="course_title">
												<a href="/academy/course/coursedetail?seq=${dto.cseq}&stuseq=${stuinfo.stuseq}">${ydto.cname}</a>
											</h3>
											<div class="course_teacher">${ydto.tname}</div>
											<div class="course_text">
												<p>${ydto.cinfo}</p>
											</div>
										</div>
										<div class="course_footer">
											<div
												class="course_footer_content d-flex flex-row align-items-center justify-content-start">
												<div class="course_info">
													<i class="fa fa-graduation-cap" aria-hidden="true"></i> <span>${ydto.stunum}</span>
												</div>
												<div class="course_info">
													<i class="fa fa-clock-o" aria-hidden="true"></i> <span>${ydto.cperiod}</span>
												</div>
											</div>
											<div class="course_price ml-auto"
												style="padding-bottom: 10px;">
												<c:if test="${ydto.ccost ne '0'}">											
													\ ${ydto.ccost}
												</c:if>
												<c:if test="${ydto.ccost eq '0'}">											
													FREE
												</c:if>
												
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							</c:if>
							
							
							<c:if test="${empty isSearch}">
							<c:forEach items="${categorylist}" var="dto">
								<!-- Course -->
								<div class="col-lg-6 course_col">
									<div class="course">
										<div class="course_body">
											<h3 class="course_title">
												<a href="course.html">${dto.cname}</a>
											</h3>
											<div class="course_teacher">${dto.tname}</div>
											<div class="course_text">
												<p>${dto.cinfo}</p>
											</div>
										</div>
										<div class="course_footer">
											<div
												class="course_footer_content d-flex flex-row align-items-center justify-content-start">
												<div class="course_info">
													<i class="fa fa-graduation-cap" aria-hidden="true"></i> <span>${dto.stunum}</span>
												</div>
												<div class="course_info">
													<i class="fa fa-clock-o" aria-hidden="true"></i> <span>${ydto.cperiod}</span>
												</div>
											</div>
											<div class="course_price ml-auto"
												style="padding-bottom: 10px;">
												<c:if test="${dto.ccost ne '0'}">											
													\ ${dto.ccost}
												</c:if>
												<c:if test="${dto.ccost eq '0'}">											
													FREE
												</c:if>
												
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							</c:if>
							
							
						</div>

						

						<div class="row pagination_row">
							<div class="col">
								<div
									class="pagination_container d-flex flex-row align-items-center justify-content-start">
									<ul class="pagination_list">
										${pagebar}							
									</ul>
									
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Courses Sidebar -->
				<div class="col-lg-4">
					<div class="sidebar">

						<!-- Categories -->
						<div class="sidebar_section">
							<div class="sidebar_section_title">카테고리</div>
							<div class="sidebar_categories">
								<ul>
									<li><a href="/academy/course/courselist">전체보기</a></li>
									<li><a href="/academy/course/coursecategory?category=web">웹 개발</a></li>
									<li><a href="/academy/course/coursecategory?category=app">앱 개발</a></li>
									<li><a href="/academy/course/coursecategory?category=game">게임 개발</a></li>
									<li><a href="/academy/course/coursecategory?category=etc">기타</a></li>
								</ul>
							</div>
						</div>
						
						<!-- Tags -->
						<div class="sidebar_section">
							<div class="sidebar_section_title">언어</div>
							<div class="sidebar_tags">
								<ul class="tags_list">
									<li><a href="/academy/course/coursecategory?category=java">JAVA</a></li>
									<li><a href="/academy/course/coursecategory?category=html">HTML</a></li>
									<li><a href="/academy/course/coursecategory?category=css">CSS</a></li>
									<li><a href="/academy/course/coursecategory?category=sql">SQL</a></li>
									<li><a href="/academy/course/coursecategory?category=python">Python</a></li>
									<li><a href="/academy/course/coursecategory?category=js">JavaScript</a></li>
								</ul>
							</div>
						</div>
						
						
						<!-- Latest Course -->
						<div class="sidebar_section">
							<div class="sidebar_section_title">최근 모집과정</div>
							<div class="sidebar_latest">

								<c:forEach items="${list}" var="dto">
									<!-- Latest Course -->
									<div
										class="latest d-flex flex-row align-items-start justify-content-start">
										<div class="latest_image"></div>
										<div class="latest_content">
											<div class="latest_title">
												<a href="/academy/course/coursedetail?#">${dto.cname}</a>
											</div>
												<c:if test="${dto.ccost ne '0'}">											
													<div class="latest_price">\ ${dto.ccost}</div>
												</c:if>
												<c:if test="${dto.ccost eq '0'}">											
													<div class="latest_price">FREE</div>
												</c:if>
										</div>
									</div>
								</c:forEach>




							</div>
						</div>



						

						<!-- Banner -->
						<div class="sidebar_section">
							<div
								class="sidebar_banner d-flex flex-column align-items-center justify-content-center text-center">
								<div class="sidebar_banner_background"></div>
								<div class="sidebar_banner_overlay"></div>
								<div class="sidebar_banner_content">
									<div class="banner_title">Free Book</div>
									<div class="banner_button">
										<a href="#">download now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




</div>



</body>
</html>