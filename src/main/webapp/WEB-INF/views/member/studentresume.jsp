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
                    <a href="/academy/member/studentmypage?stuseq=${stuinfo.stuseq}" class="nav__link">
                        <ion-icon name="person-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">학생 정보</span>
                    </a>
                    
                    <a href="/academy/member/studentresume?stuseq=${stuinfo.stuseq}" class="nav__link active">
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
    
    <div style="margin-left: 100px;">
   		RESUME | 이력서
    	<div id="sturesume">
    		<div id="box">
    			<img src="/academy/resources/images/${dto.stuimage}" alt="">
	    		<table id="tbl">
	    			<tr>
	    				<td style="border-bottom: 3px solid black;">
	    					<span>개인정보</span>
	    				</td>
	    			</tr>
	    			<tr>
		    			<td>
		    				<span class="txt">성명</span> ${dto.stuname}
		    				
		    				<span class="txt" id="txtresume">성별</span> ${dto.stugender == m ? "남" : "여"} 
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>
		    				<span class="txt">생년월일</span>
			    			<fmt:parseDate value="${dto.stubirth}" var="stubirth" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${stubirth}" pattern="yyyy년 MM월 dd일"/>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>
		    				<span class="txt">연락처</span> ${dto.stutel}
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>
		    				<span class="txt">이메일</span> ${dto.stuemail}
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>
		    				<span class="txt">주소</span> ${dto.stuaddr}
		    			</td>
		    		</tr>
		    	</table>
    		</div>
    	
    		<form method="POST" action="/academy/member/delresumeok">
    		<div id="stuedu">
    			<table id="tbledu">
		    		<tr>
		    			<th>최종학력</th>
		    			<th>보유자격증</th>
		    			<th>병역</th>
		    		</tr>
		    		<tr>		    			
		    			<td>${rdto.edu}</td>
		    			<td>${rdto.license}</td>
		    			<td>${rdto.army}</td>
		    		</tr>
		    	</table>
    		</div>
    		
    		
    		<div id="intro">
    			자기소개
    			<div style="border-top: 3px solid black; ">
	    			<div id="introbox">
		    			<textarea name="introduce" id="introduce" readonly>${rdto.introduce}</textarea>
	    			</div>
	    		</div>
    		</div>
    		
    		<div id="resumebtn">
    			<!-- 조건문 작성하기 -->
    			<c:if test="${empty rdto}">
    				<input type="button" value="이력서 작성하기" id="addresume" onclick="location.href='/academy/member/addresume?stuseq=${stuinfo.stuseq}';">
				</c:if>
				
				<c:if test="${not empty rdto}">
					<div id="resume">
    				<input type="button" value="이력서 수정하기" onclick="location.href='/academy/member/editresume?stuseq=${stuinfo.stuseq}';">
    				<input type="submit" value="이력서 삭제하기">
    				<input type="hidden" name="stuseq" value="${stuinfo.stuseq}"> 
    				</div>
    			</c:if>
    		</div>
    		</form>
    	</div>
    </div>
    
    

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
<script src="/academy/resources/js/navbars.js"></script>
   
</body>