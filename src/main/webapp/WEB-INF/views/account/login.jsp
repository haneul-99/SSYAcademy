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
							<a href="#" class="active" id="login-form-link">학생 로그인</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="register-form-link" onclick="$('#logintype').val('2')">학원 로그인</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="register-form-link2" onclick="$('#logintype').val('3')">관리자 로그인</a>
						</div>
					</div>
					<hr>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form id="login-form" action="/academy/account/loginok" method="POST"
								style="display: block;">
								<input type="hidden" name="logintype" id="logintype" value="1">
								<!-- role="form" -->
								<div class="form-group">
									<input type="text" name="username" id="username" tabindex="1"
										class="form-control" placeholder="아이디" value="">
								</div>
								<div class="form-group">
									<input type="password" name="password" id="password"
										tabindex="2" class="form-control" placeholder="비밀번호">
								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="login-submit" id="login-submit"
												tabindex="4" class="form-control btn btn-login" value="로그인">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div class="text-center">
												<a href="/academy/account/register" class="forgot-password">회원가입</a>
												<span>|</span> <a href="#" class="forgot-password">아이디
													찾기</a> <span>|</span> <a href="#" class="forgot-password">비밀번호
													찾기</a>
											</div>
										</div>
									</div>
								</div>
							</form>
							<form id="register-form" action="/academy/account/loginok" method="POST"
								style="display: none;">
								<input type="hidden" name="logintype" id="logintype" value="2">
								<div class="form-group">
									<input type="text" name="username" id="username" tabindex="1"
										class="form-control" placeholder="아이디" value="">
								</div>
								<div class="form-group">
									<input type="password" name="password" id="password"
										tabindex="2" class="form-control" placeholder="비밀번호">
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="register-submit"
												id="register-submit" tabindex="4"
												class="form-control btn btn-register" value="로그인">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div class="text-center">
												<a href="/academy/register" class="forgot-password">회원가입</a>
												<span>|</span> <a href="#" class="forgot-password">아이디
													찾기</a> <span>|</span> <a href="#" class="forgot-password">비밀번호
													찾기</a>
											</div>
										</div>
									</div>
								</div>
							</form>
							<form id="register-form2" action="/academy/account/loginok" method="POST"
								style="display: none;">
								<input type="hidden" name="logintype" id="logintype" value="3">
								<!-- role="form" -->
								<div class="form-group">
									<input type="text" name="username" id="username" tabindex="1"
										class="form-control" placeholder="아이디" value="">
								</div>
								<div class="form-group">
									<input type="password" name="password" id="password"
										tabindex="2" class="form-control" placeholder="비밀번호">
								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="login-submit" id="login-submit"
												tabindex="4" class="form-control btn btn-register2" value="로그인">
										</div>
									</div>
								</div>
							</form>
							
							
						</div>
					</div>
				</div>
			</div>
							<form method="POST" action="/academy/account/loginok">
								<input type="hidden" name="logintype" id="logintype" value="1">
						        <input type="hidden" name="username" value="ygub1768"> 
						        <input type="hidden" name="password" value="hbjud45858"> 
						        <input type="submit" value="테스트학생로그인">
						    </form>
							<form method="POST" action="/academy/account/loginok">
								<input type="hidden" name="logintype" id="logintype" value="1">
						        <input type="hidden" name="username" value="ymgc9961"> 
						        <input type="hidden" name="password" value="rznpl06182"> 
						        <input type="submit" value="테스트학생2로그인">
						    </form>
							<form method="POST" action="/academy/account/loginok">
								<input type="hidden" name="logintype" id="logintype" value="2">
						        <input type="hidden" name="username" value="1111"> 
						        <input type="hidden" name="password" value="1111"> 
						        <input type="submit" value="테스트학원로그인">
						    </form>
							<form method="POST" action="/academy/account/loginok">
								<input type="hidden" name="logintype" id="logintype" value="3">
						        <input type="hidden" name="username" value="admin1"> 
						        <input type="hidden" name="password" value="1111"> 
						        <input type="submit" value="테스트관리자로그인">
						    </form>
		</div>
	</div>
</div>