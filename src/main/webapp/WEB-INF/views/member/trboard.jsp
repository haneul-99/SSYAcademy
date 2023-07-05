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
                    
                    <a href="/academy/member/crboard?stuseq=${stuinfo.stuseq}" class="nav__link active">
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
    
	<h2>강사 후기 게시판</h2>
   

    <div id="choice">
	    <form action="" name="frm">
		    <select name="board" onchange="location=document.frm.board.value">
		    	<option value="/academy/member/crboard?stuseq=${stuinfo.stuseq}">과정별 후기</option>
		    	<option value="/academy/member/trboard?stuseq=${stuinfo.stuseq}" selected>강사별 후기</option>
		    	<option value="/academy/member/completeboard?stuseq=${stuinfo.stuseq}">수료생 후기</option>
		    	<option value="/academy/member/cmboard?stuseq=${stuinfo.stuseq}">개발자 커뮤니티</option>
		    </select>
	    </form>
	</div>
    <table>
    	<tr>
    		<th>번호</th>
    		<th>강사이름</th>
    		<th>후기내용</th>
    		<th>별점</th>
    		<th>작성자</th>
    		<th>작성일</th>
    		
    	</tr>
    	<c:if test="${list.size() == 0}">
	    <tr>
	    	<td colspan="6">게시글이 없습니다.</td>
	    </tr>
	    </c:if>
    	<c:forEach items="${list}" var="dto">
    	<tr>
    		<td>${dto.trseq}</td>
    		<td>${dto.tname}</td>
    		<td><a href="#">${dto.trcontent}</a></td>
    		<td>${dto.trstar}</td>
    		<td>${dto.stuname}</td>
    		<td>
    		<fmt:parseDate value="${dto.trregdate}" var="trregdate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${trregdate}" pattern="yyyy-MM-dd"/>
    		</td>
    	</tr>
    	</c:forEach>
    </table>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
<script src="/academy/resources/js/navbars.js"></script>
   
</body>
