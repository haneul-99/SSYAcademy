<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="/academy/academy/academymypage?aseq=${acinfo.aseq}" class="nav__logo">학원 마이페이지</a>
                </div>
                <div class="nav__list">
                   
                    
                    <a href="/academy/academy/openclasspage?aseq=${acinfo.aseq}" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">수강 강좌 확인</span>
                    </a>
                    
                     <a href="/academy/academy/qna?aseq=${acinfo.aseq}" class="nav__link">
                        <ion-icon name="clipboard-outline"></ion-icon>
                        <span class="nav_name">문의 게시글 확인</span>
                    </a>


                    <a href="/academy/academy/mapcs?aseq=${acinfo.aseq}" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">수강 신청 확인</span>
                    </a>

                <a href="/academy/academy/teacherpage?aseq=${acinfo.aseq}" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">학원 강사 관리</span>
                    
                      <a href="/academy/academy/index" nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">홈으로 돌아가기</span>
                </a>
            </div>
            </div>
        </nav>
    </div>
  
  <div class = "content_academy">
  	
  	<h2>${dto.aname}의 정보</h2>
  	<div id = "first">
  	<div class="acainput">
    			<span class="txt">학원번호</span>
    			${dto.aseq}
    		</div>
    <div class="acainput">
    			<span class="txt">학원이름</span>
    			${dto.aname}
    		</div>
    <div class="acainput">
    			<span class="txt">학원전화번호</span>
    			${dto.atel}
    		</div>
    <div class="acainput">
    			<span class="txt">학원이미지</span>
    		</div>
    <div class="acainput">
    			<span class="txt">학원이메일</span>
    			${dto.aemail}
    		</div>		
    <div class="acainput">
    			<span class="txt">학원정보</span>
    			
    			<span>a${dto.ainfo}</span>
    		</div>
    <div class="acainput">
    			<span class="txt">학원주소</span>
    			${dto.aaddr}
    		</div>
  	</div>
  	
  	
  	
  
<div id="btnedit">
  <input type = "button" value=" 학원 정보 수정" onclick = "location.href='/academy/academy/academymypageedit?aseq=${dto.aseq}';">
 </div>  
  </div>
    	
    
  
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>

