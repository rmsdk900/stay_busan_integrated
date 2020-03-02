<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.likeList, .bookedList, .pastList{
   margin-left:10%;
}
</style>

<div class="domitoryList">
   <!-- status  -->
   <div class="likeList">
   <h3>찜 목록</h3>
   <c:choose>
      <c:when test="${!empty likeList}">
         <c:forEach var="likeList" items="${likeList}">
            <a href="${path}/room/detail?r_no=${likeList.r_no}">
               <img style="width:250px;height:150px;" src="${pageContext.request.contextPath}/room/displayFile?fileName=${likeList.r_i_fullName}"/>
            </a>
            <h5>
               <a href="${path}/room/detail?r_no=${likeList.r_no}">${likeList.r_name}</a>
            </h5>
            
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
               <img style="width:250px;height:150px;" src="${pageContext.request.contextPath}/user/displayFile?fileName=${bookedList.r_i_fullName}"/>
            </a>
            <h5>
               <a href="bookedHistory?b_no=${bookedList.b_no}">${bookedList.r_name}</a>
            </h5>
            
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
               <img style="width:250px;height:150px;" src="${pageContext.request.contextPath}/user/displayFile?fileName=${pastList.r_i_fullName}"/>
            </a>
            <h5>
               <a href="pastHistory?b_no=${pastList.b_no}">${pastList.r_name}</a>
            </h5>
         </c:forEach>
      </c:when>
      <c:otherwise>
         <div>이용하였던 숙소가 없습니다.</div>
      </c:otherwise>
   </c:choose>
   </div>
   
</div>
   