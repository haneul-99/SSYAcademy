<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<body id="body-pd">

    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="/academy/member/student" class="nav__logo">마이페이지</a>
                </div>
                <div class="nav__list">
                    <a href="/academy/member/studentmypage?stuseq=${stuinfo.stuseq}" class="nav__link active">
                        <ion-icon name="person-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">학생 정보</span>
                    </a>
                    
                    <a href="/academy/member/studentresume?stuseq=${stuinfo.stuseq}" class="nav__link">
                        <ion-icon name="business-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">이력서 관리</span>
                    </a>
                    
                    <a href="/academy/member/crboard?stuseq=${stuinfo.stuseq}" class="nav__link">
                        <ion-icon name="chatbox-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내가 작성한 게시글</span>
                    </a>
                    
                     <a href="/academy/member/studentclass?stuseq=${stuinfo.stuseq}" class="nav__link">
                       <ion-icon name="library-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">과정관리</span>
                    </a> 
                    
                     <a href="/academy/member/studentproject?stuseq=${stuinfo.stuseq}" class="nav__link">
                       <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">프로젝트 관리</span>
                    </a> 
                 

	                <a href="/academy/academy/index" class="nav__link">
	                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
	                    <span class="nav_name">홈으로 돌아가기</span>
	                </a>
	            </div>
            </div>
        </nav>
    </div>
    
    <h2>${dto.stuname}님</h2>
    
    
    
    <div id="first">
    	<div id="second">
    		<span>기본정보</span>
    		<div class="stuinput">
    			<span class="txt">이름</span>
    			${dto.stuname}
    		</div>
    		<div class="stuinput">
    			<span class="txt">사용자 ID</span>
    			${dto.stuid}
    		</div>
    		<div class="stuinput">
    			<span class="txt">생년월일</span>
    			<fmt:parseDate value="${dto.stubirth}" var="stubirth" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${stubirth}" pattern="yyyy년 MM월 dd일"/>
    		</div>
    		<div class="stuinput">
    			<span class="txt">휴대전화</span>
    			${dto.stutel}
    		</div>
    		<div class="stuinput">
    			<span class="txt">주소</span>
    			${dto.stuaddr}
    		</div>
    		<div class="stuinput">
    			<span class="txt">이메일</span>
    			${dto.stuemail}
    		</div>
    		<div id="btnedit">
    			<input type="button" value="정보수정" onclick="location.href='/academy/member/studentedit?stuseq=${stuinfo.stuseq}';">
    		</div>
    	</div>
    </div>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
<script src="/academy/resources/js/navbars.js"></script>
   
</body>
