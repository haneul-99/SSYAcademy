<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapper">

	<!-- content-->
	<div id="content">
		<form method="POST" action="/academy/account/sturegisterok">

			<!-- ID -->
			<div>
				<h3 class="join_title">
					<label for="id">아이디</label>
				</h3>
				<span class="box int_id"> <input type="text" id="stuid" name = "stuid" class="int" maxlength="20">
				</span>
			</div>

			<!-- PW1 -->
			<div>
				<h3 class="join_title">
					<label for="pswd1">비밀번호</label>
				</h3>
				<span class="box int_pass"> <input type="text" id="stupw" name="stupw" class="int" maxlength="20"> <span id="alertTxt">사용불가</span>
				</span>
			</div>

			<!-- PW2 -->
			<div>
				<h3 class="join_title">
					<label for="pswd2">비밀번호 재확인</label>
				</h3>
				<span class="box int_pass_check"> <input type="text" id="pswd2" name="stupw2" class="int" maxlength="20">
				</span>
			</div>

			<!-- NAME -->
			<div>
				<h3 class="join_title">
					<label for="name">이름</label>
				</h3>
				<span class="box int_name"> <input type="text" id="stuname" name="stuname" class="int" maxlength="20">
				</span> <span class="error_next_box"></span>
			</div>

			<!-- BIRTH -->
			<div>
				<h3 class="join_title">
					<label for="yy">생년월일</label>
				</h3>

				<div id="bir_wrap">
					<!-- BIRTH_YY -->
					<div id="bir_yy">
						<span class="box"> <input type="text" id="yy" name="yy" class="int" maxlength="4" placeholder="년(4자)">
						</span>
					</div>

					<!-- BIRTH_MM -->
					<div id="bir_mm">
						<span class="box"> <select id="mm" class="sel" name="mm">
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>
						</span>
					</div>

					<!-- BIRTH_DD -->
					<div id="bir_dd">
						<span class="box"> <input type="text" id="dd" name="dd" class="int" maxlength="2" placeholder="일">
						</span>
					</div>

				</div>
				<span class="error_next_box"></span>
			</div>

			<!-- GENDER -->
			<div>
				<h3 class="join_title">
					<label for="gender">성별</label>
				</h3>
				<span class="box gender_code"> <select id="stugender" name="stugender" class="sel">
						<option value="">성별</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select>
				</span>
			</div>


			<!-- MOBILE -->
			<div>
				<h3 class="join_title">
					<label for="phoneNo">휴대전화</label>
				</h3>
				<span class="box int_mobile"> <input type="text" id="stutel" name="stutel"class="int" maxlength="16" placeholder="전화번호 입력">
				</span>
			</div>

			<!-- Address -->
			<div>
				<h3 class="join_title">
					<label for="Address">주소</label>
				</h3>
				<span class="box int_mobile"> <input type="tel" id="stuaddr" name="stuaddr" class="int" maxlength="16" placeholder="주소 입력">
				</span>
			</div>

			<!-- EMAIL -->
			<div>
				<h3 class="join_title">
					<label for="email">본인확인 이메일</label>
				</h3>
				<span class="box int_email"> <input type="text" id="stuemail" name="stuemail" class="int" maxlength="100" placeholder="example@example.com">
					<input type="button" value="이메일 확인" id="emailbtn">
				</span>
			</div>

			<div>
				<h3 class="join_title">
					<label for="email">이메일 인증</label>
				</h3>
				<span class="box int_email"> <input type="text"
					id="emailcheck" class="int" maxlength="100"
					placeholder="이메일로 전송된 코드를 입력해주세요">
				</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
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