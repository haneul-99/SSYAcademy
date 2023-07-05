<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="/academy/admin/adminmypage?adseq=${adinfo.adseq}" class="nav__logo">관리자 마이페이지</a>
                </div>
                <div class="nav__list">
                   
                    
                    <a href="/academy/admin/studentlist" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">학생 관리</span>
                    </a>
                    
                    <a href="/academy/admin/academylist" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">학원 관리</span>
                    </a>
                    
                    
                
                    
                      <a href="/academy/academy/index" nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">홈으로 돌아가기</span>
                </a>
            </div>
            </div>
        </nav>
    </div>