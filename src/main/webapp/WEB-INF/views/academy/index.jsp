<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.course_col {margin-bottom: 10px;}
.aimage{height: 270px; }

#search_courses{
display:flex;
flex-wrap: wrap;
min-height: 1;
margin: 20px 0;
}
#word{width: 900px;}
</style>

<body>
	<div class="super_container">
		<div class="home">
			<div class="home_slider_container">

				<!-- Home Slider -->
				<div class="owl-carousel owl-theme home_slider">

				

					<!-- Home Slider Item -->
					<div class="owl-item">
						<div class="home_slider_background search_container"
							style="background-image: url(/academy/resources/images/home_slider_1.jpg)"></div>
						<div class="home_slider_content">
							<div class="container">
								<div class="row">
									<div class="col text-center">
										<div class="home_slider_title" style="color:#181818;">누구나 할 수 있지만 아무나 할 수 없다</div>
										<div class="home_slider_subtitle" style="color:#181818;">SSY Academy에서는 가능합니다</div>
										<div class="home_slider_form_container">
											<div id="home_search_form_3"
												class="home_search_form d-flex flex-lg-row flex-column align-items-center justify-content-between">
												<div
													class="d-flex flex-row align-items-center ">
													<input type="text" class="home_search_input"
														placeholder="학원 또는 과정을 입력해주세요" required="required" name="word" id="word">
												</div>
												<button type="button" class="home_search_button" id="btn_search" >검색</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<!-- Home Slider Nav -->

<!-- 			<div class="home_slider_nav home_slider_prev"> -->
<!-- 				<i class="fa fa-angle-left" aria-hidden="true"></i> -->
<!-- 			</div> -->
<!-- 			<div class="home_slider_nav home_slider_next"> -->
<!-- 				<i class="fa fa-angle-right" aria-hidden="true"></i> -->
<!-- 			</div> -->
		</div>

		<!-- Features -->
	<!-- Popular Courses -->


		<div id="search_courses">
		</div>
			
		
		<div class="courses">
			<div class="section_background parallax-window"
				data-parallax="scroll"
				data-image-src="/academy/resources/images/courses_background.jpg" data-speed="0.8"></div>
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="section_title_container text-center">
							<h2 class="section_title"><i style="color:gold; margin-right:10px;" class="fa-solid fa-crown"></i>인기 TOP3 강좌</h2>
							<div class="section_subtitle">
								
							</div>
						</div>
					</div>
				</div>
				<div class="row courses_row">

					<!--인기강좌 -->
					<c:forEach items="${pclist}" var="dto">
					<div class="col-lg-4 course_col">
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
										<i class="fa fa-graduation-cap" aria-hidden="true"></i> <span>${dto.stunum}
											Student</span>
									</div>
									<div class="course_info">
										<i class="fa fa-star" aria-hidden="true"></i> <span>5
											점</span>
									</div>
									<c:if test="${dto.ccost > 0}">
									<div class="course_price ml-auto"> <fmt:formatNumber value="${dto.ccost}" pattern="#,###"/>원</div>
									</c:if>
									<c:if test="${dto.ccost == 0}">
									<div class="course_price ml-auto"> 무료</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
		<!-- 인기과정 코스 -->
				
					</div>

				</div>
				<div class="row">
				</div>
			</div>
		</div>

		<div class="features">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="section_title_container text-center">
							<h2 class="section_title">전체 모집 정보</h2>
							<div class="section_subtitle">
								<p></p>
							</div>
						</div>
					</div>
				</div>
				<div class="row features_row">

					<!-- 학원 Item -->
					<c:forEach items="${alist}" var="dto">
					<div class="col-lg-4 course_col">
						<div class="course">
							<div class="course_image">
								<img src="/academy/resources/files/${dto.aimage}" class="aimage">
							</div>
							<div class="course_body">
								<h3 class="course_title">
									<a href="/academy/academy/academydetail?aseq=${dto.aseq}">${dto.aname}</a>
								</h3>
								<div class="course_teacher">${dto.aaddr}</div>
								<div class="course_text">
									<p>${dto.ainfo}</p>
								</div>
							</div>
							<div class="course_footer">
								<div
									class="course_footer_content d-flex flex-row align-items-center justify-content-start">
									<div class="course_info">
										<i class="fa-solid fa-phone"></i> <span>연락처</span> ${dto.atel}
									</div>
									<div class="course_info">
										<i class="fa-solid fa-user"></i> <span>면접여부</span> ${dto.interviewox}
									</div>
									<div class="course_price ml-auto"></div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<!-- 학원 아이템 -->

				


				</div>
			</div>
		</div>

</body>

<script>


	$('#sclass').append(`
			
			<c:forEach items="${sclist}" var="dto">
			<option val="${dto.cseq}">${dto.cname}</option>
			</c:forEach>
			`)


			
	let word = $('#word');
	let btn = $('#btn_search');
	
	$('#btn_search').click(function() {
		$.ajax({
			url:'/academy/academy/getclassdto',
			method:'POST',
			data: "word="+word.val(),
			dataType: 'JSON',
			
		    success: function(result){
		    	
		    		$('#search_courses').html('');
		    	$.each(result, function (i, item) {
		    		$('#search_courses').append(`
		    				
		    				<div class="col-lg-4 course_col item_search">
							<div class="course">
								
								<div class="course_body">
									<h3 class="course_title">
										<a href="course.html">\${item.cname}</a>
									</h3>
									<div class="course_teacher">\${item.tname}</div>
									<div class="course_text">
										<p>\${item.cinfo}</p>
									</div>
								</div>
								<div class="course_footer">
									<div
										class="course_footer_content d-flex flex-row align-items-center justify-content-start">
										<div class="course_info">
											<i class="fa fa-graduation-cap" aria-hidden="true"></i> <span>\${item.stunum}
												Student</span>
										</div>
										<div class="course_info">
											<i class="fa fa-star" aria-hidden="true"></i> <span>5
												점</span>
										</div>
										<c:if test="\${item.ccost > 0}">
										<div class="course_price ml-auto"> <fmt:formatNumber value="\${item.ccost}" pattern="#,###"/>원</div>
										</c:if>
										<c:if test="\${item.ccost == 0}">
										<div class="course_price ml-auto"> 무료</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
		    				
		    				
		    				`)
		    	});
		    	
		    },
		    error: function(a,b,c) {
		    	console.log(a,b,c);
		    }
		});
	});
		$('#word').keyup(function(event){
				if(event.keyCode ==13){
					btn.click();
				}
		}
		)
// 	$('#academy').change(function(){
// 		$.ajax({
// 			url:'/academy/board/getclassok',
// 			method:'GET',
// 			data: "academy="+$('#academy').val(),
// 			dataType: 'JSON',
			
// 		    success: function(result){
// 		    	$('#class').html('<option value="all">전체</option>')
// 		    	$.each(result, function (i, item) {
// 		    		$('#class').append(`<option value="\${item}">` +item+ `</option>`)
// 		    	});
		    	
// 		    },
// 		    error: function(a,b,c) {
// 		    	console.log(a,b,c);
// 		    }
// 		});
		
// 		});
</script>
</html>

















