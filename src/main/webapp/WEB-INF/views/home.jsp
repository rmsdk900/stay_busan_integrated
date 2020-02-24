<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ include file="common/header.jsp" %>
<div style="min-hight:100%; margin-left: 30px; margin-right:30px;">
<!-- 안에 내용  -->
<!-- 지유가 주는거 넣기 -->

	<div class="searchFormDiv">
		<form id="searchForm" action="${pageContext.request.contextPath}/room/list" method="GET">
			<table>
				<tr>
					<th></th><th></th><th></th><th></th>
				</tr>
				<tr>
					<td>지역</td>
					<td colspan=3><input type="text" name="g_area"/></td>
				</tr>
				<tr>
					<td>체크인</td>
					<td><input type="text" id="startDate" name="startDate"></td>
					<td>체크아웃</td>
					<td><input type="text" id="endDate" name="endDate"></td>
				</tr>
				<tr>
					<td>인원</td>
					<td colspan=3><input type="number" name="g_guests"/></td>
				</tr>
				<tr>
					<td style="text-align:right;"colspan=4><input type="button" id="searchBtn" value="검색"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<script>
		$("#searchBtn").click(function(){
			$("#searchForm").submit();
		});
	</script>
	
	
	
	<div class="homeList">
		<hr/>
		<c:choose>
			<c:when test="${!empty homeList}">
				<ul>
					<c:forEach var="guList" items="${homeList}">
						<li style="list-style:none;">
							<div class="roomList">
								<a href="${pageContext.request.contextPath}/room/list?r_gu=${guList.r_gu}">
									<img class="roomImg" src="${pageContext.request.contextPath}/room/displayFile?fileName=${guList.g_i_fullName}"/>
								<span>
									<p>${guList.r_gu}(${guList.r_count}개)</p>
									<p style="text-align:right;">${guList.r_gu} 평균가격 : ${guList.r_avgPrice}</p>
								</span>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:when>
		</c:choose>
		<hr/>
	</div>
	
		<h2>TOP 3</h2>
		<div class="homeList">
		<c:choose>
			<c:when test="${!empty bestList}">
				<ul>
					<c:forEach var="best" items="${bestList}">
						<li style="list-style:none;">
							<div class="roomImgDiv">
								<a href="${pageContext.request.contextPath}/room/detail?r_no=${best.r_no}">
									<img class="roomImg" src="${pageContext.request.contextPath}/room/displayFile?fileName=${best.r_i_fullName}"/>
								</a>
								<div><br/>
							${best.r_no}</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:when>
		</c:choose>
		</div>



</div>
<!-- datepicker -->
<script>

   var minDate;

   $("#startDate").datepicker({
      dateFormat : "yy-mm-dd",
      minDate : 0,
      todayHighlight : true,
      changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
      changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       dayNames: ['일', '월', '화', '수', '목', '금', '토'],
       dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
       dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      onSelect : function(dateText, inst) {
         minDate = new Date(dateText);
         $("#endDate").datepicker("option","minDate",minDate);
         $(".endDate").focus();
      }
   });
   
   $("#endDate").datepicker({
      dateFormat : "yy-mm-dd",
      changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
      changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       dayNames: ['일', '월', '화', '수', '목', '금', '토'],
       dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
       dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
       onSelect : function(dateText, inst){
          maxDate = new Date(dateText);
          $(".endDate").focus();
          startDatepicker();
       }
   });
</script>
<%@ include file="common/footer.jsp" %>