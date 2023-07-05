<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<body>

	<div id="post">
		<table id="tbl">
			<tr>
				<th>프로젝트 관리</th>
			</tr>
			<tr>
				
				<td>
					<div class="manage">새로운 신청</div>
					<c:forEach items="${aplist}" var="apdto">
					<div class="box">
					${apdto.stuname}님
					<input type="button" value="승인" id="approval" onclick="approval('${apdto.stuseq}', '${apdto.prseq}');">
					<input type="button" value="거절" id="reject" onclick="reject('${apdto.prseq}');">
					</div>
					</c:forEach>
				</td>
				
				
			</tr>
			<tr>
				<td>
					<div class="manage">팀원</div>
					<c:forEach items="${mlist}" var="mdto">
					<div class="box">
					${mdto.stuname}님
					<input type="button" value="내보내기" id="export" onclick="">
					</div>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>

  <script>
  
  function reject(prseq) {
	   
	  if(confirm("정말 삭제하시겠습니까?")){

	        location.href ='/academy/member/rejectdelok?stuseq=' + ${stuinfo.stuseq} + "&prseq=" + prseq;
	        
	     } else{
	        history.back();
	     }
 	}
  
  function approval(stuseq, prseq) {
	   
	  if(confirm("팀원으로 추가하시겠습니까?")){

	        location.href ='/academy/member/approvaladdok?stuseq=' + stuseq + "&prseq=" + prseq;
	        
	     } else{
	        history.back();
	     }
 }
  
  /* 	$('#btn_approval').click(function(){
  		
  		if(confirm("정말 삭제하시겠습니까?")){

  	        location.href ='/academy/member/approvaldelok?stuseq=' + ${apdto.stuseq};
  	        
  	     } else{
  	        history.back();
  	     }
  		
  	}); */
  </script>
    

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
<script src="/academy/resources/js/navbars.js"></script>
   
</body>
 