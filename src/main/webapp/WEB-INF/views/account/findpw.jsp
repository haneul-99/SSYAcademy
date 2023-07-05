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
							<a href="#" class="active" id="login-form-link">학생 아이디찾기</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="register-form-link" onclick="$('#logintype').val('2')">학원 아이디찾기</a>
						</div>
					</div>
					<hr>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form id="login-form" action="/academy/account/findpwok" method="POST"
								style="display: block;">
								<input type="hidden" name="logintype" id="logintype" value="1">
								<!-- role="form" -->
								<div class="form-group">
									<input type="text" name="name" id="name" tabindex="1"
										class="form-control" placeholder="이름">
								</div>
								<div class="form-group">
									<input type="text" name="email" id="email"
										tabindex="2" class="form-control" placeholder="email">
								</div>
								<div class="form-group">
									<input type="text" name="id" id="id"
										tabindex="3" class="form-control" placeholder="아이디">
								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="login-submit" id="login-submit"
												tabindex="4" class="form-control btn btn-login" value="찾기 및 비밀번호 재설정">
										</div>
									</div>
								</div>
								
							</form>
							<form id="register-form" action="/academy/account/findpwok" method="POST"
								style="display: none;">
								<input type="hidden" name="logintype" id="logintype" value="2">
								<div class="form-group">
									<input type="text" name="name" id="name" tabindex="1"
										class="form-control" placeholder="이름">
								</div>
								<div class="form-group">
									<input type="text" name="email" id="email"
										tabindex="2" class="form-control" placeholder="email">
								</div>
								<div class="form-group">
									<input type="text" name="id" id="id"
										tabindex="3" class="form-control" placeholder="아이디">
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="register-submit"
												id="register-submit" tabindex="4"
												class="form-control btn btn-register" value="찾기 및 비밀번호 재설정">
										</div>
									</div>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 
	<h1>아이디 찾기</h1>
	<table>
		<tr>
			<th>이름: </th>
			<td></td>
		</tr>
		<tr>
			<th>e-mail: </th>
			<td></td>
		</tr>
			
	</table>
 -->