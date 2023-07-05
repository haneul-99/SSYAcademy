<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Home -->

<div class="home">
	<div class="breadcrumbs_container">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="breadcrumbs">
						<ul>
							<li><a href="/academy/academy/index">홈</a></li>
							<li><a href="/academy/project/projectlist">프로젝트</a></li>
							<li>프로젝트 상세보기</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="blog">
	<div class="container">
		<h2 style="margin-bottom: 50px;">프로젝트 등록</h2>
		<div class="row">


			<form action="/academy/project/registerprojectok" method="post">
				<table class="register_tbl">
					<tr>
						<th>팀장</th>
						<td><p style="text-align: left; color: black;">${stuname}</p></td>
					</tr>
					<tr>
						<th>주제</th>
						<td><input type="text" name="prsubject"></td>
					</tr>
					<tr>
						<th>모집 인원</th>
						<td style="text-align: left;">
						<select name="stucnt"
							style="text-align: left; width: 50px; outline: none;">
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
						</select></td>
					</tr>
					<tr>
						<th>기간</th>
						<td>
							<input type="date" name="start_date" id="start_date" class="period"> ~ 
							<input type="date" name="end_date" id="end_date" class="period">
						</td>
					</tr>
					<tr>
						<th>프로젝트 소개</th>
						<td><textarea name="prinfo"></textarea></td>
					</tr>

				</table>
				
				<div style="text-align: right;">
					<input type="submit" value="등록하기" class="load_more trans_200" id="submit_btn"
						style="text-align: center; margin-right: 0; color: #ffffff; outline: none; border: 0; cursor: pointer;"></input>
				</div>
				
				<input type="hidden" name="seq" value="${stuinfo.stuseq}">
			</form>


		</div>
	</div>
</div>


<script>
	var start_date = document.getElementById('start_date');
	var end_date = document.getElementById('end_date');
	let date = new Date();

	date = date.toISOString().slice(0, 10);

	start_date.value = date;
	start_date.setAttribute("min", date);

	end_date.value = date;
	end_date.setAttribute("min", date);

	 $("#submit_btn").click(function() {
		if (start_date.value > end_date.value) {
			alert('시작날짜가 종료날짜 이후입니다. 다시 입력해주세요');
			$("#start_date").focus();
			return false;
		}
	});
</script>

























