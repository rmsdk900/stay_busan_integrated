<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<img src="${pageContext.request.contextPath}/user/displayFile?fileName=${history.r_i_fullName}"/>
	<h2>${history.r_name}</h2>
	<div>
		체크인 : <f:formatDate value="${history.b_date_from}" pattern="yyyy.MM.dd"/> &nbsp;&nbsp;&nbsp;<f:formatDate value="${history.r_checkin}" pattern="a hh:mm"/><br/>
		<hr/>
		체크아웃 : <f:formatDate value="${history.b_date_to}" pattern="yyyy.MM.dd"/> &nbsp;&nbsp;&nbsp;<f:formatDate value="${history.r_checkout}" pattern="a hh:mm"/> <br/>
		<hr/>
		<br/>
		예약 인원 : ${history.b_guest} 명<br/>
		<hr/>
		결제 금액 : \ ${history.b_total_price} 원<br/>
		<hr/>
	</div>
	<input type="button" value="예약 취소" id="cancelRoom"/>
	
	<c:if test="${history.r_deleted == 0}">
		<!-- 삭제된 방이면 버튼 안보이게 -->
		<a href="${pageContext.request.contextPath}/room/detail?r_no=${history.r_no}"><input type="button" value="상세 보기" id="detailRoom"/></a>
	</c:if>
	
</div>

<form id="bookedInfo">
	<input type="hidden" name="b_no" value="${history.b_no}"/>
	<input type="hidden" name="u_no" value="${history.u_no}"/>
</form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	var obj = $("#bookedInfo");
	$("#cancelRoom").click(function(){
		console.log("click");
		var isCancel = confirm("예약을 취소하시겠습니까?");
		if(isCancel){
			obj.attr("action", "cancelRoom");
			obj.submit();
		}
	});
	
</script>