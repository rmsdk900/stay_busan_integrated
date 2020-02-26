<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="domitoryList">
	<!-- status  -->
	<div class="likeList">
	<h3>찜 목록</h3>
	<c:choose>
		<c:when test="${!empty likeList}">
			<c:forEach var="likeList" items="${likeList}">
				<a href="">
					<img src="${pageContext.request.contextPath}/room/displayFile?fileName=${likeList.r_i_fullName}"/>
					<h5>${likeList.r_name}</h5>
				</a>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div>찜한 숙소가 없습니다.</div>
		</c:otherwise>
	</c:choose>
	</div>
	<hr/>
	
	<div class="bookedList">
	<h3>예약 목록</h3>
	<c:choose>
		<c:when test="${!empty bookedList}">
			<c:forEach var="bookedList" items="${bookedList}">
				<a href="bookedHistory?b_no=${bookedList.b_no}">
					<img src="${pageContext.request.contextPath}/user/displayFile?fileName=${bookedList.r_i_fullName}"/>
					<h5>${bookedList.r_name}</h5>
				</a>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div>예약한 숙소가 없습니다.</div>
		</c:otherwise>
	</c:choose>
	</div>
	<hr/>
	
	<div class="pastList">
	<h3>지나간 목록</h3>
	<c:choose>
		<c:when test="${!empty pastList}">
			<c:forEach var="pastList" items="${pastList}">
				<a href="pastHistory?b_no=${pastList.b_no}">
					<img src="${pageContext.request.contextPath}/user/displayFile?fileName=${pastList.r_i_fullName}"/>
					<h5>${pastList.r_name}</h5>
				</a>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div>이용하였던 숙소가 없습니다.</div>
		</c:otherwise>
	</c:choose>
	</div>
	
</div>
	
