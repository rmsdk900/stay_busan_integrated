<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/header.jsp" %>
<!-- url 접근 막기 -->
<% 
	String strReferer = request.getHeader("referer");
	if(strReferer == null){
%>
<script>
	alert("정상적인 경로를 통해 다시 접근해주십시오.");
	document.location.href=contextPath+"/";
</script>
<%
		return;
	}
%>
<style>
	.room_reservation_img{
		display: inline-block;
		width: 25%;
	}
	.FilledImg{
		
		width: 100%;
		height: 100%;
	}
</style>
<c:if test="${!empty AllInfo}">
	<div class="room_reservation_wrapper">
		<div>
			<span>예약한 방 : </span>
			<span><c:out value="${AllInfo.room.r_name}"/></span>
			<span class="room_reservation_img">
				<img class="FilledImg" src="${pageContext.request.contextPath}/displayFile?fileName=${AllInfo.roomImg.r_i_fullName}" alt="방 사진"/>
			</span>
		</div>
		
		<hr/>
		<div>
			<span>예약자 명 : </span>
			<span><c:out value="${AllInfo.booker}"/></span>
		</div>
		<div>
			<span>체크인 : </span>
			<span><fmt:formatDate value="${AllInfo.yeyag.b_date_from}" pattern="yyyy.MM.dd"/></span>
			<span>&nbsp;&nbsp;&nbsp;</span>
			<span><fmt:formatDate value="${AllInfo.room.r_checkin}" pattern="a hh 시 mm 분"/></span>
			<br/>
			<br/>
			<span>체크아웃 : </span>
			<span><fmt:formatDate value="${AllInfo.yeyag.b_date_to}" pattern="yyyy.MM.dd"/></span>
			<span>&nbsp;&nbsp;&nbsp;</span>
			<span><fmt:formatDate value="${AllInfo.room.r_checkout}" pattern="a hh 시 mm 분"/></span>
		</div>
		<hr/>
		<div>
			<span>예약 인원 : </span>
			<span><c:out value="${AllInfo.yeyag.b_guest}"/></span>
			<span>명</span>
		</div>
		<div>
			<span>결제 금액 : </span>
			<span><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${AllInfo.yeyag.b_total_price}" /></span>
			<span>원</span>
		</div>
		<!-- 결제 후 잔액 -->
		<div>
			<span>결제 후 잔액 : </span>
			<c:set var="result" value="${userInfo.u_balance - AllInfo.yeyag.b_total_price}" />
			<c:choose>
				<c:when test="${result >= 0}">
					<span><fmt:formatNumber type="currency" value="${result}" /></span>
					<span>원</span>
				</c:when>
				<c:otherwise>
					<span>잔액이 부족합니다.</span>
				</c:otherwise>
			</c:choose>
			
		</div>
		<hr/>
		<div>
			<form id="bookingRoomSubmit" action="bookingRoomSubmit" method="post">
				<div>
					<label>
						<input type="checkbox" id="checkOneMore"/>
						상기 결제 내용을 다 확인하였으며, 이에 대한 책임은 게스트에게 있습니다.
					</label>
					
				</div>
				<div>
					<button type="button" id="btnSubmit">결제</button>
					<button type="button" id="btnCancel">취소</button>
				</div>			
			</form>
		</div>
		
	</div>
</c:if>
<script>
	$(function(){
		// 잔액이 부족하면 버튼 비활성화
		var result = '${result}';
		if(result < 0){
			$("#btnSubmit").attr("disabled", true);
		}
	});
	// 결제 취소
	$("#btnCancel").on("click", function(){
		if(confirm("결제를 취소하시겠습니까?")){
			alert("결제를 취소하셨습니다.");
			location.href="${path}/room/detail?r_no=${AllInfo.yeyag.r_no}";
		}
	});
	//결제 보내기
	$("#btnSubmit").on("click",function(){
		var isChecked = $("#checkOneMore").is(":checked");
		// 체크 확인
		if(isChecked){
			var str = "<input type='hidden' name='r_no' value='${AllInfo.yeyag.r_no}'/>";
			str += "<input type='hidden' name='u_no' value='${AllInfo.yeyag.u_no}' />";
			str += "<input type='hidden' name='date_from_dummy' value='${AllInfo.yeyag.date_from_dummy}' />";
			str += "<input type='hidden' name='date_to_dummy' value='${AllInfo.yeyag.date_to_dummy}' />";
			str += "<input type='hidden' name='b_guest' value='${AllInfo.yeyag.b_guest}' />";
			str += "<input type='hidden' name='b_total_price' value='${AllInfo.yeyag.b_total_price}' />";
			$("#bookingRoomSubmit").append(str);
			$("#bookingRoomSubmit").submit();
		}else{
			alert("예약 사항을 꼼꼼히 확인해주세요!");
			$("#checkOneMore").focus();
		}
	});
</script>
<%@ include file="../common/footer.jsp" %>