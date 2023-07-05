<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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