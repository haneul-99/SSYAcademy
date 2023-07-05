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
						<a class="active" id="login-form-link" style="margin-bottom: 30px;">학생 비밀번호 변경</a>
						</div>
						
						<form action="/academy/account/stupwreset" method="POST">
							<input type="password" id="newpw" name="newpw" placeholder="새 비밀번호">
							<input type="password" id="newpwok" name="newpwok" placeholder="새 비밀번호 확인">
							<input type="hidden" id = "stuid" name="stuid" value="${sdto.stuid}">
							
							
							<button type="submit" class="btn1" id="submit1">비밀번호 변경</button>
						</form>
					</div>
					<hr style="margin-bottom: 100px;">
					<button type="button" onclick="history.back();">돌아가기</button>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script>

	$('#submit1').click(() => {
			
			for (var i=0; i<$('#newpw').val().length; i++) {
		        let c = $('#newpw').val().charAt(i);
		        
		        if ((c < 'A' || c > 'Z') && (c < 'a' || c > 'z') && (c < '0' || c > '9') ) {
		              alert('비밀번호를 영문 대/소문자, 숫자 조합으로만 입력하세요.');
		              event.preventDefault();
		              $('#newpw').focus();
		                return;
		           }
		      }
			
	       if($('#newpw').val() != $('#newpwok').val()) {
	           alert('비밀번호 확인이 일치하지 않습니다. 다시 입력해주십시오.');
	           event.preventDefault();
	           $('#newpw').focus();
	           return;
	       }
			
	       if($('#newpw').val().length < 8 || $('#newpw').val().length > 16) {
	           alert('비밀번호를 8~16자 사이로 입력해주세요.');
	            event.preventDefault();
	           $('#newpw').focus();
	           return;
	      }
	
	       
	       
		});
</script>
