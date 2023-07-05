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
                    
                    <a href="/academy/member/studentresume?stuseq=${stuinfo.stuseq}" class="nav__link">
                        <ion-icon name="business-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">이력서 관리</span>
                    </a>
                    
                    <a href="/academy/member/crboard?stuseq=${stuinfo.stuseq}" class="nav__link">
                        <ion-icon name="chatbox-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내가 작성한 게시글</span>
                    </a>
                    
                     <a href="/academy/member/studentclass?stuseq=${stuinfo.stuseq}" class="nav__link active">
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
    
   <div id="classmain">
   	<h2 style="margin-bottom: 20px;">과정 관리</h2>
   	<table id="tbl">
    	<c:if test="${list.size() == 0}">
	    <tr>
	    	<td colspan="3">신청한 과정이 없습니다.</td>
	    </tr>
	    </c:if>
    	<c:forEach items="${list}" var="dto">
    	<tr>
    		<td>${dto.aname}</td>
    		<td>
	    		${dto.cname}
	    		<div class="cstu"><small>교육일: ${dto.ctime} | 지역: ${dto.lname} | 수강정원: ${dto.stunum}명</small></div>
    		</td>
    		<c:if test="${dto.state == 'w'}">
	    		<td>
	    			교육예정
		    		<input type="button" value="신청취소" onclick="location.href='/academy/member/classdeleteok?mcsseq=${dto.mcsseq}';">
		    		<input type="hidden" value="${dto.mcsseq}" name="mcsseq">
		    		<div class="cstu">
		    			<small>
				    		<fmt:parseDate value="${dto.cend}" var="cend" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${cend}" pattern="~ MM/dd(E) 마감"/>
						</small>
					</div>
	    		</td>
    		</c:if>
    		<c:if test="${dto.state == 'o'}">
    			<td>교육중</td>
    			<div class="cstu">
    				<small>
			    		<fmt:parseDate value="${dto.cend}" var="cend" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${cend}" pattern="~ MM/dd(E)"/>
					</small>
				</div>
    		</c:if>
    		<c:if test="${dto.state == 'x'}">
    			<td>교육마감</td>
    		</c:if>
    		
    	</tr>
    	</c:forEach>
    </table> 
   </div>
  

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
<script src="/academy/resources/js/navbars.js"></script>
   
</body>