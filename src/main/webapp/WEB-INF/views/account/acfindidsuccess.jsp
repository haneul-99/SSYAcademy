<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-login">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">
						<a class="active" id="login-form-link" style="margin-bottom: 30px;">학원 아이디찾기</a>
						</div>
					</div>
						찾으시는 아이디는 <a style="border-bottom: 1px solid black;">${acinfo.aid}</a>입니다.
					<hr style="margin-bottom: 100px;">
					<a href="/academy/account/login">로그인 하러가기</a>
				</div>
				
			</div>
		</div>
	</div>
</div>