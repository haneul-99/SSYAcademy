<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row" style="margin-bottom:100px; margin-top:-70px;">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-login">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">
							<a href="#" class="active" id="login-form-link">학생 회원가입</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="register-form-link">학원 회원가입</a>
						</div>
					</div>
					<hr>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form id="login-form" action="#" method="GET"
								style="display: block;">
								<!-- role="form" -->
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="button" name="login-submit" id="login-submit"
												tabindex="4" class="form-control btn btn-login"
												value="학생 회원가입" style="padding-top: 20px; margin-top: 50px;"
												onClick="location.href='/academy/account/sturegister'">
										</div>
									</div>
								</div>
							</form>
							<form id="register-form" action="#" method="GET"
								style="display: none;">

								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="button" name="register-submit"
												id="register-submit" tabindex="4"
												class="form-control btn btn-register" value="학원 회원가입"
												style="padding-top: 20px; margin-top: 50px;"
												onClick="location.href='/academy/account/acaregister'">
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