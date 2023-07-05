<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapper">

	<!-- content-->
	<div id="content">
	<form method="POST" action="/academy/account/acaregisterok">

		<!-- ID -->
		<div>
			<h3 class="join_title"><label for="id">아이디</label></h3>
			<span class="box int_id">
				<input type="text" id="aid" name= "aid" class="int" maxlength="20">
			</span>
		</div>

		<!-- PW1 -->
		<div>
			<h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
			<span class="box int_pass">
				<input type="password" id="apw" name= "apw" class="int" maxlength="20">
			</span>
		</div>

		<!-- PW2 -->
		<div>
			<h3 class="join_title">
				<label for="pswd2">비밀번호 재확인</label>
			</h3>
			<span class="box int_pass_check">
				<input type="password" id="apw2" name="apw2" class="int" maxlength="20">
			</span>
		</div>

		<!-- NAME -->
		<div>
			<h3 class="join_title">
				<label for="name">학원 이름</label>
			</h3>
			<span class="box int_name">
				<input type="text" id="aname" name="aname"class="int" maxlength="20">
			</span>
		</div>

		<!-- MOBILE -->
		<div>
			<h3 class="join_title">
				<label for="phoneNo">연락처</label>
			</h3>
			<span class="box int_mobile">
				<input type="text" id="atel"  name="atel"class="int" maxlength="16" placeholder="전화번호 입력">
			</span>
		</div>

		<!-- Address -->
		<div>
			<h3 class="join_title">
				<label for="Address">주소</label>
			</h3>
			<span class="box int_addr">
				<input type="text" id="aaddr" name="aaddr" class="int" maxlength="16" placeholder="주소 입력">
			</span>
		</div>

		<!-- Link -->
		<div>
			<h3 class="join_title">
				<label for="Link">홈페이지 링크</label>
			</h3>
			<span class="box int_link">
				<input type="text" id="alink" name="alink" class="int" maxlength="100" placeholder="Ex) http://example.co.kr">
			</span>
		</div>

		<!-- Type -->
		<div>
			<h3 class="join_title">
				<label for="gender">학원 유형</label>
			</h3>
			<span class="box gender_code">
				<select id="actseq" class="sel" name="actseq">
					<option value="">학원 유형</option>
					<option value="1">국비지원</option>
					<option value="2">부트캠프</option>
				</select>
			</span>
		</div>

		<!-- Interview -->
		<div>
			<h3 class="join_title">
				<label for="interview">면접 여부</label>
			</h3>
			<span class="box interview">
				<select id="interviewOX" class="sel" name="interviewOX">
					<option value="">면접 여부</option>
					<option value="O">O</option>
					<option value="X">X</option>
				</select>
			</span>
		</div>

		<!-- Info -->
		<div>
			<h3 class="join_title">
				<label for="Info">학원 정보</label>
			</h3>
			<span class="box int_info">
				<textarea placeholder="학원 정보를 입력해주세요." id="ainfo" name="ainfo"></textarea>
			</span>
		</div>
		
		<!-- Pay -->
		<div>
			<h3 class="join_title">
				<label for="pay">등록금</label>
			</h3>
			<span class="box int_link">
				<input type="text" id="apay" name="apay" class="int" maxlength="100" placeholder="Ex) 1,000,000 원">
			</span>
		</div>

		<!-- EMAIL -->
		<div>
			<h3 class="join_title">
				<label for="email">확인 이메일</label>
			</h3>
			<span class="box int_email">
				<input type="text" name="aemail" id="email" class="int" maxlength="100" placeholder="example@example.com">
				<input type="button" value="이메일 확인" id="emailbtn">
			</span>
		</div>

		<div>
			<h3 class="join_title">
				<label for="email">이메일 인증</label>
			</h3>
			<span class="box int_email">
				<input type="text" id="emailcheck" class="int" maxlength="100" placeholder="이메일로 전송된 코드를 입력해주세요">
			</span>
		</div>

		<!-- JOIN BTN-->
		<div class="btn_area">
			<button type="submit" id="btnJoin">
				<span>가입하기</span>
			</button>
		</div>
	</form>


	</div>
	<!-- content-->

</div>
<!-- wrapper -->
