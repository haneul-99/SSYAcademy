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
								<li><a href="/academy/project/projectlist">프로젝트</a></li>
								<li>프로젝트 상세보기</li>
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

				<!-- Blog Content -->
				<div class="col-lg-8">
					<div class="blog_content">
						<div class="blog_title">${dto.prsubject}</div>
						<div class="blog_meta">
							<ul  style="padding: 0">
								<li>작성일 ${dto.prregdate}</li>
								<li>작성자 ${dto.stuname}</li>
							</ul>
						</div>
						<p style="margin-bottom: 90px;">${dto.prinfo}</p>
					</div>

					<!-- Comments -->
					<div class="comments_container">
						<div class="comments_title" style="margin-bottom: 10px;">
							댓글<span>(${commentcount})</span>
						</div>
						
						<ul class="comments_list">
							<%-- 
							<c:if test="${pclist.size() == 0}">
								<div style="font-size: 18px;">아직 작성된 댓글이 없습니다</div>
							</c:if>
							 --%>
							<c:forEach items="${pclist}" var="pcdto">
								<li>
									<div
										class="comment_item d-flex flex-row align-items-start jutify-content-start">
									
										<div class="comment_content">
											<div
												class="comment_title_container d-flex flex-row align-items-center justify-content-start">
													
														<div class="comment_author">
															<c:if test="${dto.stuname eq pcdto.stuname}">
																<i class="fa-solid fa-crown" style="color:gold;"></i>															
															</c:if>
															<a href="#" style="font-size: 16px;">${pcdto.stuname}</a>
														</div>												
												
												<div class="comment_time ml-auto">${pcdto.pcregdate}</div>
											</div>
											<div class="comment_text">
												<p>${pcdto.pccontent}</p>
											</div>
											<c:if test="${stuinfo.stuname eq pcdto.stuname}">
												<div
													class="comment_extras d-flex flex-row align-items-center justify-content-start">
													<div class="comment_extra comment_reply" style="margin: 0;">
														<a href="#"  onclick="$('#${pcdto.pcseq}').show()" ><i class="fa fa-pencil-square-o"
															aria-hidden="true"></i><span>수정</span></a>
													</div>
													<div class="comment_extra comment_reply" style="margin-left: 20px;">
														<a href="/academy/project/delcomment?seq=${pcdto.pcseq}&prseq=${dto.prseq}" class="del"><i class="fa fa-trash"
															aria-hidden="true"></i><span>삭제</span></a>
													</div>
												</div>
											</c:if>
										</div>
									</div>
								</li>
								<li>
									<form action="/academy/project/editcomment" method="post">
									<div id="${pcdto.pcseq}" style="display: none;">
										<textarea style="resize: none; outline: none; width: 100%; border: solid 1px #d9d9d9; border-radius: 3px;" name="comment">${pcdto.pccontent}
										</textarea>
										<div style="text-align: right;">
											<button type = "submit" id = "edit_btn" class="reply_edit-btn">
												수정하기
											</button>
											<button type="button" onclick="$('#${pcdto.pcseq}').hide()" class="reply_edit-btn">
												수정취소
											</button>
										</div>
										<input type="hidden" name="seq" value="${pcdto.pcseq}">
										<input type="hidden" name="prseq" value="${dto.prseq}">
									</div>
									</form>
								</li>
							</c:forEach>
							
						</ul>
						<div class="add_comment_container">
							<c:if test="${not empty stuinfo.stuid}">
								<form action="/academy/project/addcomment" method="post" class="comment_form">
									<div>
										<textarea class="comment_input comment_textarea"
											required="required" style="resize: none;" placeholder="댓글 작성" name="comment"></textarea>
									</div>
	
									<!-- <div class="comment_notify" style="margin-top: 0;">
										<input type="checkbox" id="checkbox_notify"
											name="regular_checkbox"
											class="regular_checkbox checkbox_account" checked> <label
											for="checkbox_notify"><i class="fa fa-check"
											aria-hidden="true"></i></label> <span>비밀글로 작성하기</span>
									 </div> -->
									<div>
										<button type="submit" class="comment_button trans_200" style="margin: 0;">작성하기</button>
									</div>
									<input type="hidden" name="prseq" value="${dto.prseq}">
									<input type="hidden" name="seq" value="${stuinfo.stuseq}">
								</form>
							</c:if>
							<c:if test="${empty stuinfo.stuid}">
									<div>
										<textarea class="comment_input comment_textarea"
											required="required" style="resize: none;" placeholder="댓글은 로그인 후 작성할 수 있습니다." name="comment" readonly="readonly"></textarea>
									</div>
							</c:if>
						</div>
					</div>
				</div>

				<!-- Blog Sidebar -->
				<div class="col-lg-4">
					<div class="sidebar" style="padding-top:0;">
					<c:if test="${not empty stuinfo.stuid}">
						<c:if test="${check eq '0'}">
							<form action="/academy/project/applyproject" method="post">
								<div class="apply_btn">
									<button type="submit" onclick="return confirm('이 프로젝트를 신청하시겠습니까?');"><b>프로젝트 신청하기</b></button>
									<input type="hidden" value="${dto.prseq}" name="prseq">
									<input type="hidden" value="${stuinfo.stuseq}" name="stuseq">
								</div>
							</form>
						</c:if>
						<c:if test="${check eq '1'}">
							<form action="/academy/project/applyproject" method="post">
								<div class="apply_btn">
									<button type="submit" onclick="return confirm('이 프로젝트를 신청취소하시겠습니까?');"><b>프로젝트 신청취소</b></button>
									<input type="hidden" value="${dto.prseq}" name="prseq">
									<input type="hidden" value="${stuinfo.stuseq}" name="stuseq">
								</div>
							</form>
						</c:if>					
					</c:if>
					<c:if test="${empty stuinfo.stuid}">
							<div class="apply_btn">
								<a href="/academy/account/login" onclick="return confirm('프로젝트 신청은 로그인 후에 가능합니다.\n로그인 창으로 이동하시겠습니까?');"><b>프로젝트 신청하기</b></a>
							</div>
					</c:if>

						<!-- Categories -->
						<div class="sidebar_section">
							<div class="sidebar_section_title">모집 정보</div>

							<div class="sidebar_section">

								<div class="sidebar_feature">

									<!-- Features -->
									<div class="feature_list">

										<!-- Feature -->
										<div
											class="feature d-flex flex-row align-items-center justify-content-start">
											<div class="feature_title">
												<i class="fa fa-clock-o" aria-hidden="true"></i><span>기간</span>
											</div>
											<div class="feature_text ml-auto">${dto.prperiod}</div>
										</div>

										<!-- Feature -->
										<div
											class="feature d-flex flex-row align-items-center justify-content-start">
											<div class="feature_title">
												<i class="fa fa-flag" aria-hidden="true"></i><span>모집
													인원</span>
											</div>
											<div class="feature_text ml-auto">${result}/${dto.stucnt}명</div>
										</div>

										<!-- Feature -->
										<div
											class="feature d-flex flex-row align-items-center justify-content-start">
											<div class="feature_title">
												<i class="fa fa-user" aria-hidden="true"></i><span>팀장</span>
											</div>
											<div class="feature_text ml-auto">${dto.stuname}</div>
										</div>

										<!-- Feature -->
										<div
											class="feature d-flex flex-row align-items-center justify-content-start">
											<div class="feature_title">
												<i class="fa fa-users" aria-hidden="true"
													style="font-size: 15px;"></i><span>팀원</span>
											</div>
											<div class="feature_text ml-auto">
												<c:if test="${result == 1}">없음</c:if>
												<c:if test="${result > 1}">
													<c:forEach items="${mlist}" var="pdto">
														${pdto.stuname}
													</c:forEach>
												</c:if>
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
	</div>
</div>

<script>
	$(".del").click(function(){
	    if(confirm("정말 삭제 하시겠습니까 ?") == true){
	        alert("삭제 되었습니다");
	    }
	    else{
	 	   alert("삭제가 취소되었습니다");
	       return false;
	    }
	});

</script>

