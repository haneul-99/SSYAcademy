<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/04d62b639a.js" crossorigin="anonymous"></script>
	<!-- Header -->

<style>
header{position:relative;}

.loginfo{
position:absolute;
right:-1050px;
top:45px;
font-size:1.2rem;
display:flex;
color:black;
z-index:100;
}

.acainfo{
	right:-1100px;
}
.img_login {width: 35px; height:35px; border-radius:50%; margin-right: 8px;
transform:translateY(-5px);}

.mypagelink_container {
    background-color: #181818;
    border-radius: 45px;
    width: 25px;
    height: 25px;
    text-align: center;
    padding: 2px;
    margin: 0;
}

.mypagelink_container:hover {
    background-color: #14bdee;
    cursor: pointer;
    transition: all 200ms ease;
}
</style>
		<header class="header">

			<!-- Top Bar -->
			<div class="top_bar">
				<div class="top_bar_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div
									class="top_bar_content d-flex flex-row align-items-center justify-content-start">
									<ul class="top_bar_contact_list">
										<li><div class="question">고객센터</div></li>
										<li><i class="fa fa-envelope-o" aria-hidden="true"></i>
											<div>ssyAcademy@ssy.co.kr</div></li>
											
									</ul>
								
									
									<div class="top_bar_login ml-auto">
										<div class="login_button">
										
										
										<c:if test="${empty stuid}">
   											<c:if test="${empty acinfo.aid}">
      											<c:if test="${empty adinfo.adid}">
   													<a href="/academy/account/login">회원가입 | 로그인</a>
      											</c:if>
  											</c:if>   
										</c:if>
										
										<c:if test="${not empty stuid}">
												<a href="/academy/account/logout">로그아웃</a>
											</c:if>
											<c:if test="${not empty acinfo.aid}">
												<a href="/academy/account/logout">로그아웃</a>
											</c:if>
											<c:if test="${not empty adinfo.adid}">
												<a href="/academy/account/logout">로그아웃</a>
											</c:if>
										
										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="header_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div
								class="header_content d-flex flex-row align-items-center justify-content-start">
								<div class="logo_container">
										<a href='/academy/academy/index'>
										<div class="logo_text">
											SSY<span>Academy</span>
										</div>
									</a>
								</div>
								<nav class="main_nav_contaner ml-auto">
									<ul class="main_nav">
										<li class="active"><a href="/academy/academy/index">홈</a></li>
										<li><a href="/academy/course/courselist">과정</a></li>
										<li><a href="/academy/project/projectlist">프로젝트</a></li>
										<li><a href="/academy/board/community">게시판</a></li>
										<li><a href="/academy/codingtest/codingtestlist">코딩테스트</a></li>
									</ul>
									<div class="search_button">
											<c:if test="${not empty stuid}">
												<div class="mypagelink_container"><a href="/academy/member/studentmypage?stuseq=${stuinfo.stuseq}" style="display: block; color: white;"><i class="fa-regular fa-user" style="color: #ffffff;"></i></a></div>
											</c:if>
											<c:if test="${not empty acinfo.aid}">
												<div class="mypagelink_container"><a href="/academy/academy/academymypage?aseq=${acinfo.aseq}" style="display: block; color: white;"><i class="fa-regular fa-user" style="color: #ffffff;"></i></a></div>
											</c:if>
											<c:if test="${not empty adinfo.adid}">
												<div class="mypagelink_container"><a href="/academy/admin/adminmypage?adseq=${adinfo.adseq}" style="display: block; color: white;"><i class="fa-regular fa-user" style="color: #ffffff;"></i></a></div>
											</c:if>
											<c:if test="${empty stuinfo.stuid and empty acinfo.aid and empty adinfo.adid}">
												<div style="width:25px;"></div>
											</c:if>
									</div>


									<div class="shopping_cart">
										<i class="fa-solid fa-cart-shopping" aria-hidden="true" onclick="location.href='/academy/academy/jjim';"></i>
									</div>
									<div class="shopping_cart">
										
									</div>
								</nav>

							</div>
						</div>
					</div>
				</div>
			</div>
		</header>