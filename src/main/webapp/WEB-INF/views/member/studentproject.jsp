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
                    
                     <a href="/academy/member/studentclass?stuseq=${stuinfo.stuseq}" class="nav__link">
                       <ion-icon name="library-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">과정관리</span>
                    </a> 
                    
                     <a href="/academy/member/studentproject?stuseq=${stuinfo.stuseq}" class="nav__link active">
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
   	<h2 style="margin-bottom: 20px;">프로젝트 관리</h2>
   	<div class="txt">만든 프로젝트(팀장)</div>
   	<!-- <form method="POST" action="/academy/member/projectdelok"> -->
   	<table id="tbl">
    	<c:if test="${plist.size() == 0}">
	    <tr>
	    	<td colspan="4" style="text-align: center;">프로젝트가 없습니다.</td>
	    </tr>
	    </c:if>
    	<c:forEach items="${plist}" var="dto">
    	<tr>
    		<td>${dto.prsubject}</td>
    		<td>
    			${dto.prinfo}
    			<div class="cstu">
    				<small>
    					희망 인원 수: ${dto.stucnt}명 | 진행상태: ${dto.prstatus} | 모집기간:
    					<fmt:parseDate value="${dto.pstart}" var="pstart" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${pstart}" pattern="yy.MM.dd"/>
						<fmt:parseDate value="${dto.pend}" var="pend" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${pend}" pattern="~ yy.MM.dd"/>
    				</small>
    			</div>
    		</td>
    		<td><input type="button" value="관리" id="manage" onclick="openPopup('${dto.prseq}');"></td> 
    		<td><input type="submit" value="프로젝트 삭제" onclick="location.href='/academy/member/projectdelok?prseq=${dto.prseq}';"></td>
    		<td><input type="hidden" value="${dto.prseq}" name="prseq"></td>
    		
    	</tr> 
    	</c:forEach>
    </table> 
    <!-- </form> -->
    
    <div class="txt">신청한 프로젝트</div>
   	<!-- <form method="POST" action="/academy/member/projapplydelok"> -->
   	<table id="tblapply">
    	<c:if test="${aplist.size() == 0}">
	    <tr>
	    	<td colspan="3" style="text-align: center;">신청한 프로젝트가 없습니다.</td>
	    </tr>
	    </c:if>
    	<c:forEach items="${aplist}" var="apdto">
    	<tr>
    		<td>${apdto.prsubject}</td>
    		<c:if test="${apdto.state == 'o'}">
    		<td>
    			${apdto.prinfo}
    			<div class="cstu">
    				<small>
    					희망 인원 수: ${apdto.stucnt}명 | 진행상태: 모집중 | 모집기간:
    					<fmt:parseDate value="${apdto.apstart}" var="apstart" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${apstart}" pattern="yy.MM.dd"/>
						<fmt:parseDate value="${apdto.apend}" var="apend" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${apend}" pattern="~ yy.MM.dd"/>
    				</small>
    			</div>
    		</td>
    		<td>
    			<input type="button" value="신청취소" onclick="location.href='/academy/member/projapplydelok?apseq=${apdto.apseq}';">
    			<input type="hidden" value="${apdto.apseq}" name="apseq">
    		</td>
    		</c:if>
    		<c:if test="${apdto.state == 'x'}">
    		<td>
    			${apdto.prinfo}
    			<div class="cstu">
    				<small>
    					희망 인원 수: ${apdto.stucnt}명 | 모집기간:
    					<fmt:parseDate value="${apdto.apstart}" var="apstart" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${apstart}" pattern="yy.MM.dd"/>
						<fmt:parseDate value="${apdto.apend}" var="apend" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${apend}" pattern="~ yy.MM.dd"/>
    				</small>
    			</div>
    		</td>
    		<td><div id="deadline">모집마감</div></td>
    		</c:if>
    	</tr> 
    	</c:forEach>
    </table> 
    <!-- </form> -->
    
   <div class="txt">참여한 프로젝트</div>
   <!-- <form method="POST" action="/academy/member/participatedelok"> -->
   	<table id="tblmember">
    	<c:if test="${mlist.size() == 0}">
	    <tr>
	    	<td colspan="4" style="text-align: center;">참여한 프로젝트가 없습니다.</td>
	    </tr>
	    </c:if>
    	<c:forEach items="${mlist}" var="mdto">
    	<tr>
    		<td>
	    		${mdto.prsubject}
    		</td>
    		<c:if test="${mdto.state == 'o'}">
    		<td>
    			${mdto.prinfo}
    			<div class="cstu">
    				<small>
    				     팀원수: ${mdto.stucnt}명 | 진행상태: 프로젝트 진행중 
    				</small>
    			</div>
    		</td>
    		<td>
    			<input type="submit" value="중도탈락" onclick=" location.href='/academy/member/participatedelok?pmseq=${mdto.pmseq}';""> 
    			<input type="hidden" value="${mdto.pmseq}" name="pmseq">
    		</td>
    		</c:if>
    		<c:if test="${mdto.state == 'x'}">
    		<td>
    			${mdto.prinfo}
    			<div class="cstu">
    				<small>
    					팀원수: ${mdto.stucnt}명 | 진행상태: 프로젝트 종료
    				</small>
    			</div>
    		</td>
    		<td><div id="deadline">프로젝트 종료</div></td>
    		</c:if>
    	</tr> 
    	</c:forEach>
    </table> 
    <!-- </form> -->
    
    
   </div>
   
   <script>
   
   function openPopup(prseq) {
	   
	   	sessionStorage.setItem('stuseq', ${stuinfo.stuseq});
	   	let popUrl = "/academy/member/studentmanage?stuseq=" + sessionStorage.getItem('stuseq')
	   	let popOption = "width = 470px, height=450px, top=100px, left=250px, scrollbars=yes";
		
		window.open(popUrl + "&prseq=" + prseq,"프로젝트 관리",popOption);
		
		console.log(prseq);
   }
	
   </script>
  
    

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
<script src="/academy/resources/js/navbars.js"></script>
   
</body>
