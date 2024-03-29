<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html style="height: 100%; margin: 0;">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Stay Busan</title>
<!-- path 설정 -->
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<script type="text/javascript">
   var contextPath = '${pageContext.request.contextPath}';
</script>

<!-- jquery 최신 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap css -->
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<!-- bootstrap js -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="${path}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


  
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
   src="${path}/resources/jquery-ui/jquery-ui.min.js"></script>
<!-- <script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> -->
<link rel="stylesheet"
   href="${path}/resources/jquery-ui/jquery-ui.css">   
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<style>
.messageWrap{
   list-style:none;
   backgroud-color:white;
   position:absolute;
   display:none;
}
</style>
<body style="height: 100%; margin: 0;">
   <header style="margin:0 auto; width:83%; height: 100px;">
      <nav class="navbar container-fluid navbar-expand-lg navbar-light nav-color">
         <a class="navbar-brand" href="/"> 
         <img style="width:120px;height:90px;"src="${path}/resources/img/stay.png" id="icon" alt="User Icon" />
         </a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav">
               <li class="nav-item"><a class="nav-link"
                  href="/">Home</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="/common/about">About Us</a></li>

               <c:choose>
                  <c:when test="${!empty userInfo}">
                     <li class="nav-item"><a class="nav-link"
                        href="${pageContext.request.contextPath}/user/show?u_no=${userInfo.u_no}"><c:out value="${userInfo.u_name}" escapeXml="true"/></a></li>
                     <!-- 충전 기능 -->
                     <li class="nav-item"><a id="money" class="nav-link" href="${pageContext.request.contextPath}/common/charging" data-toggle="modal" data-target="#exampleModal"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${userInfo.u_balance}"/></a></li>
                     <%@include file="./charging.jsp" %>
                     <c:if test="${userInfo.u_type eq 1 || userInfo.u_type eq 2}">
                        <!-- 호스트  -->
                        <!-- 쪽지 추가 -->
                        <li class="nav-item" style="backgoround-color:white;"><a class="nav-link messageNav" href="#">쪽지</a>
                           <ul class="messageWrap">
                              
                           </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="${path}/Rooms/resisterRoom1">호스팅</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path}/user/hosting?u_no=${userInfo.u_no}">호스팅 관리</a></li>
                     </c:if>
                     <c:if test="${userInfo.u_type eq 0 || userInfo.u_type eq 9}">
                        <!-- 게스트 -->
                        <!-- 쪽지 추가 -->
                        <li class="nav-item"><a class="nav-link messageNav" href="#">쪽지</a>
                           <ul class="messageWrap">
                              
                           </ul>
                        </li>
                     </c:if>
                     <c:if test="${userInfo.u_type eq 3}">
                        <!-- 관리자 -->
                        <!-- 쪽지 추가 -->
                        <li class="nav-item"><a class="nav-link messageNav" href="#">쪽지</a>
                           <ul class="messageWrap">
                              
                           </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link"
                           href="${path}/user/adminMyPage">관리</a></li>
                     </c:if>
                     <li class="nav-item"><a class="nav-link" href="${path}/user/logOut">로그아웃</a>
                     </li>
                  </c:when>
                  <c:otherwise>
                     <li class="nav-item"><a class="nav-link" href="${path}/user/join">회원가입</a>
                     </li>
                     <li class="nav-item"><a class="nav-link" href="${path}/user/login">로그인</a>
                     </li>
                  </c:otherwise>
               </c:choose>
            </ul>
         </div>
      </nav>
   </header>
<!-- 모달을 옮겨놓았다! -->

<%@ include file="./transformModal.jsp" %>