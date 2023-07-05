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
    		<span>회원정보수정</span> 		
    		<form method="POST" action="/academy/member/studenteditok">
    		<div class="stuinput">
    			<span class="txt">이름</span>
    			<input type="text" name="stuname" id="stuname" value="${dto.stuname}">
    		</div>
    		<div class="stuinput">
    			<span class="txt">사용자 ID</span>
    			${dto.stuid}
    			<%-- <input type="text" name="txtid" id="txtid" value="${dto.stuid}" readonly> --%>
    		</div>
    		<div class="stuinput">
    			<span class="txt">생년월일</span>
    			<fmt:parseDate value="${dto.stubirth}" var="stubirth" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${stubirth}" pattern="yyyy년 MM월 dd일"/>
    		</div>
    		<div class="stuinput">
    			<span class="txt">휴대전화</span>
    			<input type="text" name="stutel" id="stutel" value="${dto.stutel}">
    		</div>
    		<div class="stuinput">
    			<span class="txt">주소</span>
    			<input type="text" name="stuaddr" id="stuaddr" value="${dto.stuaddr}">
    		</div>
    		<div class="stuinput">
    			<span class="txt">이메일</span>
    			<input type="text" name="stuemail" id="stuemail" value="${dto.stuemail}">
    		</div>

    		<div id="btnedit">
    			<input type="button" value="돌아가기" onclick="location.href='/academy/member/studentmypage?stuseq=${stuinfo.stuseq}';">
				
				
				<button type="submit">수정하기</button>
				<input type="hidden" name="stuseq" value="${stuinfo.stuseq}"> 
    		</div>
    		</form>
    	</div>
    </div>
    
    <%-- <table>
    	<tr>
    		<th>이름</th>
    		<td>${dto.stuname}</td>
    		<th>사용자 ID</th>
    		<td>${dto.stuid}</td>
    	</tr>
    	<tr>
    		<th>생년월일</th>
    		<td colspan="3">${dto.stubirth}</td>
    	</tr>
    	<tr>
    		<th>휴대전화</th>
    		<td colspan="3">${dto.stutel}</td>
    	</tr>
    	<tr>
    		<th>주소</th>
    		<td colspan="3">${dto.stuaddr}</td>
    	</tr>
    	<tr>
    		<th>이메일</th>
    		<td colspan="3">${dto.stuemail}</td>
    	</tr>
    </table> --%>


    

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
<script src="/academy/resources/js/navbars.js"></script>
   
</body>
