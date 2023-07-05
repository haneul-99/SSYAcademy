<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
								<li><a href="/academy/course/courselist">과정</a></li>
								<li>과정 상세보기</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>			
	</div>

	<!-- Course -->

	<div class="course">
		<div class="container">
			<div class="row">

				<!-- Course -->
				<div class="col-lg-8">
					
					<div class="course_container">
						<div class="course_title">${cdto.cname}</div>
						<div class="course_info d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">

							<!-- Course Info Item -->
							<div class="course_info_item">
								<div class="course_info_title">학원:</div>
								<div class="course_info_text"><a href="#">${cdto.aname}</a></div>
							</div>

							<!-- Course Info Item -->
							<div class="course_info_item">
								<div class="course_info_title">강사:</div>
								<div class="course_info_text"><a href="#">${cdto.tname}</a></div>
							</div>

							<!-- Course Info Item -->
							<div class="course_info_item">
								<div class="course_info_title">카테고리:</div>
								<div class="course_info_text"><a href="#">${cdto.ccategory}, ${cdto.skname}</a></div>
							</div>

						</div>
						
						<!-- Course Image -->
						<div class="course_image"><img src="/academy/resources/images/${cdto.aseq}.jpg" alt=""></div>

						<!-- Course Tabs -->
						<div class="course_tabs_container">
							<div class="tabs d-flex flex-row align-items-center justify-content-start">
								<div class="tab active" id="tab1">과정 소개</div>
								<div class="tab " id="tab2">과정 후기</div>
								<div class="tab" id="tab3">강사 후기</div>
							</div>
							<div class="tab_panels">

								<!-- Description -->
								<div class="tab_panel active" id="panel1">
									<div class="tab_panel_title">${cdto.cname}</div>
									<div class="tab_panel_content">
										<div class="tab_panel_text">
											<p>${cdto.cinfo}</p>
										</div>
									
										<!-- Course Image -->
										<div class="course_image"><img src="/academy/resources/images/ssyinfo.png" alt=""></div>
									</div>
								</div>

								<!-- Curriculum -->
								<div class="tab_panel tab_panel_2" id="panel2">
									<div class="tab_panel_content">
										<!-- Rating -->
									<div class="review_rating_container">
										<div class="review_rating">
											<div class="review_rating_num">4.5</div>
											<div class="review_rating_stars">
												<div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div>
											</div>
											<div class="review_rating_text">(28개의 후기)</div>
										</div>
										<div class="review_rating_bars" style="padding-left: 50px;">
											<ul>
												<li><span>5 Star</span><div class="review_rating_bar"><div style="width:90%;"></div></div></li>
												<li><span>4 Star</span><div class="review_rating_bar"><div style="width:75%;"></div></div></li>
												<li><span>3 Star</span><div class="review_rating_bar"><div style="width:32%;"></div></div></li>
												<li><span>2 Star</span><div class="review_rating_bar"><div style="width:5%;"></div></div></li>
												<li><span>1 Star</span><div class="review_rating_bar"><div style="width:3%;"></div></div></li>
											</ul>
										</div>
										<div class="comments_container">
										<ul class="comments_list">
											<li>
												<div class="comment_item d-flex flex-row align-items-start jutify-content-start">
													<div class="comment_image"><div><img src="/academy/resources/images/ssy_comment_img.jpg" alt=""></div></div>
													<div class="comment_content">
														<div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
															<div class="comment_author"><a href="#">김동수</a></div>
															<div class="comment_rating"><div class="rating_r rating_r_5"><i></i><i></i><i></i><i></i><i></i></div></div>
														</div>
														<div class="comment_text">
															<p>교육기간이 너무 짧아서 아쉬웠다. 강사님이 친절하시고 재밌으시다. 커리큘럼은 짧은 기간동안 최대한 많은 것을 얻을 수 있도록 잘 짜여져있었다. 추천합니다.</p>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="comment_item d-flex flex-row align-items-start jutify-content-start">
													<div class="comment_image"><div><img src="/academy/resources/images/ssy_comment_img.jpg" alt=""></div></div>
													<div class="comment_content">
														<div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
															<div class="comment_author"><a href="#">구민환</a></div>
															<div class="comment_rating"><div class="rating_r rating_r_5"><i></i><i></i><i></i><i></i><i></i></div></div>
														</div>
														<div class="comment_text">
															<p>개념에 대하여 차근차근 정확하게 설명해주셔서 이해하기 좋습니다. 강사님께서 쉽게 예를 들어주시면서 강의를 해주셔서 이해가 쉬워져서 너무 좋습니다. 처음 공부해보는 과목인데 어렵지 않게 잘 설명해주셔서 더 의욕이 생기네요! 좋은 강의 감사합니다 !!</p>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="comment_item d-flex flex-row align-items-start jutify-content-start">
													<div class="comment_image"><div><img src="/academy/resources/images/ssy_comment_img.jpg" alt=""></div></div>
													<div class="comment_content">
														<div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
															<div class="comment_author"><a href="#">김하진</a></div>
															<div class="comment_rating"><div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div></div>
														</div>
														<div class="comment_text">
															<p>정말 유익한 강의였습니다.</p>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<div class="add_comment_container">
											<div class="add_comment_text">학원 홈페이지에서 가져온 베스트 후기입니다.</div>
										</div>
									</div>
									</div>
									</div>
								</div>

								<!-- Reviews -->
								<div class="tab_panel tab_panel_3" id="panel3">
									<!-- Rating -->
									<div class="review_rating_container">
										<div class="review_rating">
											<div class="review_rating_num">4.9</div>
											<div class="review_rating_stars">
												<div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div>
											</div>
											<div class="review_rating_text">(107개의 후기)</div>
										</div>
										<div class="review_rating_bars" style="padding-left: 50px;">
											<ul>
												<li><span>5 Star</span><div class="review_rating_bar"><div style="width:96%;"></div></div></li>
												<li><span>4 Star</span><div class="review_rating_bar"><div style="width:64%;"></div></div></li>
												<li><span>3 Star</span><div class="review_rating_bar"><div style="width:20%;"></div></div></li>
												<li><span>2 Star</span><div class="review_rating_bar"><div style="width:10%;"></div></div></li>
												<li><span>1 Star</span><div class="review_rating_bar"><div style="width:1%;"></div></div></li>
											</ul>
										</div>
									</div>
									
									<!-- Comments -->
									<div class="comments_container">
										<ul class="comments_list">
											<li>
												<div class="comment_item d-flex flex-row align-items-start jutify-content-start">
													<div class="comment_image"><div><img src="/academy/resources/images/ssy_comment_img.jpg" alt=""></div></div>
													<div class="comment_content">
														<div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
															<div class="comment_author"><a href="#">김지원</a></div>
															<div class="comment_rating"><div class="rating_r rating_r_5"><i></i><i></i><i></i><i></i><i></i></div></div>
														</div>
														<div class="comment_text">
															<p>강사님이 알기 쉽게 차근차근 설명해주셔서 이해하기 편했습니다. 감사합니다 ! </p>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="comment_item d-flex flex-row align-items-start jutify-content-start">
													<div class="comment_image"><div><img src="/academy/resources/images/ssy_comment_img.jpg" alt=""></div></div>
													<div class="comment_content">
														<div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
															<div class="comment_author"><a href="#">송정우</a></div>
															<div class="comment_rating"><div class="rating_r rating_r_5"><i></i><i></i><i></i><i></i><i></i></div></div>
														</div>
														<div class="comment_text">
															<p>수업 진행 속도가 적당해서 듣기에 무리가 없었고 예제를 많이 주셔서 실력 향상에 큰 도움이 되었습니다. 추천합니다.</p>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="comment_item d-flex flex-row align-items-start jutify-content-start">
													<div class="comment_image"><div><img src="/academy/resources/images/ssy_comment_img.jpg" alt=""></div></div>
													<div class="comment_content">
														<div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
															<div class="comment_author"><a href="#">남우혁</a></div>
															<div class="comment_rating"><div class="rating_r rating_r_5"><i></i><i></i><i></i><i></i><i></i></div></div>
														</div>
														<div class="comment_text">
															<p>강사님이 완전 재밌어서 수업시간이 기다려졌네요 ㅎㅎ 강사님 좋은 강의 감사합니다 !!</p>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<div class="add_comment_container">
											<div class="add_comment_text">학원 홈페이지에서 가져온 베스트 후기입니다.</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<!-- Course Sidebar -->
				<div class="col-lg-4">
						<div class="jjim_and_apply">
							<table>
								<tr>
									<td>
										<c:if test="${not empty stuinfo.stuid}">
											<c:if test="${checkjjim  eq '0'}">
												<div class="jjim_btn">
													<a href="/academy/course/coursejjim?seq=${cdto.cseq}&stuseq=${stuinfo.stuseq}"><i class="fa-regular fa-star"></i> ${jjim}</a>
												</div>
											</c:if>
											<c:if test="${checkjjim  eq '1'}">
												<div class="jjim_btn">
													<a href="/academy/course/coursejjimcancel?seq=${cdto.cseq}&stuseq=${stuinfo.stuseq}"><i class="fa-solid fa-star"></i> ${jjim}</a>
												</div>
											</c:if>
										</c:if>
										<c:if test="${empty stuinfo.stuid}">
											<div class="jjim_btn" style="color: #ffffff;">
												<a href="/academy/account/login" onclick="return confirm('찜목록 추가는 로그인 후에 가능합니다.\n로그인 창으로 이동하시겠습니까?');"><i class="fa-regular fa-star"></i> ${jjim}</a>
											</div>
										</c:if>
									</td>
									<td>
										<c:if test="${not empty stuinfo.stuid}">										
											<c:if test="${checkapply  eq '0'}">
												<div class="apply_btn">
													<a href="/academy/course/applycourse?seq=${cdto.cseq}&stuseq=${stuinfo.stuseq}" onclick="return confirm('${cdto.cname} 과정을 신청하시겠습니까?');">과정 신청</a>
												</div>
											</c:if>										
											<c:if test="${checkapply  eq '1'}">
												<div class="apply_btn" style="color: #ffffff;">
													<a href="/academy/course/applycancelcourse?seq=${cdto.cseq}&stuseq=${stuinfo.stuseq}" onclick="return confirm('${cdto.cname} 과정 신청을 취소하시겠습니까?');">신청 취소</a>
													<!-- <a onclick="alert('이미 신청한 과정입니다.');">신청 취소</a> -->
												</div>
											</c:if>
										</c:if>
										
									 	<c:if test="${empty stuinfo.stuid}">
											<div class="apply_btn">
												<a href="/academy/account/login" onclick="return confirm('과정 신청은 로그인 후에 가능합니다.\n로그인 창으로 이동하시겠습니까?');">과정 신청</a>
											</div>
										</c:if> 
									</td>
								</tr>
							</table>
						</div>

							
			
					<div class="sidebar">
						
						<!-- Feature -->
						<div class="sidebar_section">
							<div class="sidebar_section_title">과정정보</div>
							<div class="sidebar_feature">
												<c:if test="${cdto.ccost ne '0'}">											
													<div class="course_price">\ ${cdto.ccost}</div>
												</c:if>
												<c:if test="${cdto.ccost eq '0'}">											
													<div class="course_price" style="font-weight: 700; margin-bottom: 10px;" >무료</div>
												</c:if>

								<!-- Features -->
								<div class="feature_list">

									<!-- Feature -->
									<div class="feature d-flex flex-row align-items-center justify-content-start">
										<div class="feature_title"><i class="fa fa-clock-o" aria-hidden="true"></i><span>과정 기간:</span></div>
										<div class="feature_text ml-auto">${cdto.cperiod}</div>
									</div>

									<!-- Feature -->
									<div class="feature d-flex flex-row align-items-center justify-content-start">
										<div class="feature_title"><i class="fa fa-question-circle-o" aria-hidden="true"></i><span>교육 시간:</span></div>
										<div class="feature_text ml-auto">${cdto.ctime}</div>
									</div>

									<!-- Feature -->
									<div class="feature d-flex flex-row align-items-center justify-content-start">
										<div class="feature_title"><i class="fa fa-list-alt" aria-hidden="true"></i><span>모집 기간:</span></div>
										<div class="feature_text ml-auto">${cdto.rperiod}</div>
									</div>

									<!-- Feature -->
									<div class="feature d-flex flex-row align-items-center justify-content-start">
										<div class="feature_title"><i class="fa fa-users" aria-hidden="true"></i><span>모집인원:</span></div>
										<div class="feature_text ml-auto">${cdto.stunum}명</div>
									</div>

								</div>
							</div>
						</div>

						<!-- Feature -->
						<div class="sidebar_section">
							<div class="sidebar_section_title">학원 정보</div>
							<div class="sidebar_teacher">
								<div class="teacher_title_container d-flex flex-row align-items-center justify-content-start">
									<div class="teacher_image"><img src="/academy/resources/images/${cdto.aseq}.jpg" alt=""></div>
									<div class="teacher_title">
										<div class="teacher_name"><a href="#">${cdto.aname}</a></div>
										<div class="teacher_position">Marketing & Management</div>
									</div>
								</div>
								<div class="teacher_meta_container">
									<!-- Teacher Rating -->
									<div class="teacher_meta d-flex flex-row align-items-center justify-content-start">
										<div class="teacher_meta_title">주소:</div>
										<div class="teacher_meta_text ml-auto"><span>${cdto.aaddr}</span></div>
									</div>
									<!-- Teacher Review -->
									<div class="teacher_meta d-flex flex-row align-items-center justify-content-start">
										<div class="teacher_meta_title">연락처:</div>
										<div class="teacher_meta_text ml-auto"><span>${cdto.atel}</span></div>
									</div>
									<!-- Teacher Review -->
									<div class="teacher_meta d-flex flex-row align-items-center justify-content-start">
										<div class="teacher_meta_title">홈페이지:</div>
										<div class="teacher_meta_text ml-auto"><span><a class="aca_link" href="${cdto.alink}">${cdto.alink}</a></span></div>
									</div>
									
								</div>
							</div>
						</div>
						

						<!-- Latest Course -->
						<div class="sidebar_section">
							<div class="sidebar_section_title">최근 모집과정</div>
							<div class="sidebar_latest">

								<c:forEach items="${llist}" var="dto">
									<!-- Latest Course -->
									<div
										class="latest d-flex flex-row align-items-start justify-content-start">
										<div class="latest_image"></div>
										<div class="latest_content">
											<div class="latest_title">
												<a href="/academy/course/coursedetail?seq=${dto.cseq}">${dto.cname}</a>
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

					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<script>

$('#tab1').click(function(e) {
	$("#panel1").delay(100).fadeIn(100);
	$("#panel2").fadeOut(100);
	$("#panel3").fadeOut(100);
	$('#tab2').removeClass('active');
	$('#panel2').removeClass('active');
	$('#tab3').removeClass('active');
	$('#panel3').removeClass('active');
	$(this).addClass('active');
	$('#panel1').addClass('active');
	e.preventDefault();
});
$('#tab2').click(function(e) {
	$("#panel2").delay(100).fadeIn(100);
	$("#panel1").fadeOut(100);
	$("#panel3").fadeOut(100);
	$('#tab1').removeClass('active');
	$('#panel1').removeClass('active');
	$('#tab3').removeClass('active');
	$('#panel3').removeClass('active');
	$(this).addClass('active');
	$('#panel2').addClass('active');
	e.preventDefault();
});
$('#tab3').click(function(e) {
	$("#panel3").delay(100).fadeIn(100);
	$("#panel1").fadeOut(100);
	$("#panel2").fadeOut(100);
	$('#tab1').removeClass('active');
	$('#panel1').removeClass('active');
	$('#tab2').removeClass('active');
	$('#panel2').removeClass('active');
	$(this).addClass('active');
	$('#panel3').addClass('active');
	e.preventDefault();
});
</script>
