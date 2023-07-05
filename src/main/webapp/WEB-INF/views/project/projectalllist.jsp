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
								<li>프로젝트</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>			
	</div>

	<!-- Blog -->
	
	
	<div class="blog">
		<div class="container">
			<div class="row">
				<div class="col">
				<table  style="width: 100%; margin-bottom: 30px;">
						<tr>
							<td>
								<h2>모집 중인 프로젝트</h2>
							</td>
							<c:if test="${not empty stuinfo.stuid}">
								<td style="text-align: right">
									<div class="load_more trans_200" style="text-align: center; margin-right:0;"><a href="/academy/project/registerproject?seq=${stuinfo.stuseq}">프로젝트 등록</a></div>
								</td>
							</c:if>
						</tr>
					</table>
					<div class="blog_post_container">
						
						<c:forEach items="${alllist}" var="pdto">
							<div class="blog_post trans_200">
								<div class="blog_post_body">
									<div class="blog_post_title"><a href="/academy/project/projectdetail?prseq=${pdto.prseq}&stuseq=${stuinfo.stuseq}">${pdto.prsubject}</a></div>
									<div class="blog_post_meta">
										
											<a href="#">기간: ${pdto.prperiod} | </a>
											<a href="#">모집인원: ${pdto.stucnt}명</a>
										
									</div>
									<div class="blog_post_text">
										<p>${pdto.prinfo}</p>
									</div>
								</div>
							</div>
						</c:forEach>
						
						<!-- 
						<div class="blog_post trans_200">
							<div class="blog_post_body">
								<div class="blog_post_title"><a href="blog_single.html">With Changing Students and Times</a></div>
								<div class="blog_post_meta">
									<ul>
										<li><a href="#">admin</a></li>
										<li><a href="#">november 11, 2017</a></li>
									</ul>
								</div>
								<div class="blog_post_text">
									<p>Policy analysts generally agree on a need for reform, but not on which path policymakers should take...</p>
								</div>
							</div>
						</div> -->

						<!-- Blog Post -->
						<!-- 
						<div class="blog_post trans_200">
							<div class="blog_post_video_container">
								<video class="blog_post_video video-js" data-setup='{"controls": true, "autoplay": false, "preload": "auto", "poster": "images/blog_2.jpg"}'>
									<source src="images/mov_bbb.mp4" type="video/mp4">
									<source src="images/mov_bbb.ogg" type="video/ogg">
									Your browser does not support HTML5 video.
								</video>
							</div>
							<div class="blog_post_body">
								<div class="blog_post_title"><a href="blog_single.html">Building Skills Outside the Classroom With New Ways</a></div>
								<div class="blog_post_meta">
									<ul>
										<li><a href="#">admin</a></li>
										<li><a href="#">november 11, 2017</a></li>
									</ul>
								</div>
								<div class="blog_post_text">
									<p>Policy analysts generally agree on a need for reform, but not on which path policymakers should take...</p>
								</div>
							</div>
						</div>
 -->
						

					</div>
				</div>
			</div>
			
		</div>
	</div>


	
</div>
