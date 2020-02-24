<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="height: 100%; margin: 0;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}';
</script>
<!-- Bootstrap core JavaScript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="${path}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="${path}/resources/jquery-ui/jquery-ui.min.js"></script>
<!-- <script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> -->
<link rel="stylesheet"
	href="${path}/resources/jquery-ui/jquery-ui.css">	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
#exampleModal {
	display: none;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	border-radius: 10px;
}

.modal table {
	margin: auto;
	border-spacing: 10px;
}
/* 쪽지 쪽 */






</style>
</head>
<body style="height: 100%; margin: 0;">
	<header style="height: 100px;">
		<nav class="navbar container navbar-expand-lg navbar-light nav-color">
			<a class="navbar-brand" href="/staybusan"> 머무르다 <span> </span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="/staybusan">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="common/about">About
							Us</a></li>

					<c:choose>
						<c:when test="${!empty userInfo}">
							<!-- 쪽지 추가 -->
							<li class="nav-item">
							
							</li>
							<!-- 나머지 -->
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/user/show?u_no=${userInfo.u_no}">${userInfo.u_name}</a></li>
							<c:if test="${userInfo.u_type eq 1}">
								<!-- 호스트  -->
								<li class="nav-item"><a class="nav-link"
									href="Rooms/resisterRoom1">호스팅</a></li>
							</c:if>
							<c:if test="${userInfo.u_type eq 0 || userInfo.u_type eq 9}">
								<!-- 게스트 -->
								<li class="nav-item"><a class="nav-link" id="transform"
									href="user/transformUser">전환</a></li>
							</c:if>
							<c:if test="${userInfo.u_type eq 3}">
								<!-- 게스트 -->
								<li class="nav-item"><a class="nav-link"
									href="user/adminMyPage">관리</a></li>
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
	<!-- 전환 버튼 클릭시 띄울 modal -->
	<div id="transformModal" class="modal">
		<div class="modal-content">
			<h3>게스트 호스트 전환</h3>
			<div style="text-align: center; margin: 20px;">
				<div>
					<textarea readonly style="resize: none;">이용약관 아무나 써줘....</textarea>
				</div>
				<div>
					<input type="checkbox" id="checkbox" /> 이용약관에 동의해 주세요.
				</div>
				&nbsp;&nbsp;&nbsp; 
				<input type="button" id="transformSubmitBtn" class="btn btn-primary" data-no="${userInfo.u_no}" value="전환" /> 
				&nbsp;&nbsp;&nbsp; 
				<input type="button" id="transformCancelBtn" class="btn btn-danger" value="닫기" />
			</div>
		</div>
	</div>
	<script>
		// 쪽지 추가
		
		
		// 기존
		$("#transform").click(function(event) {
			event.preventDefault();
			$("#transformModal").css("display", "flex");
		});
		
		var boolInfo = false;

		//   modal 신청취소 취소하기 버튼 클릭
		$("#transformSubmitBtn").click(function() {
			var u_no = $(this).attr("data-no");
			if(boolInfo){
				$.ajax({
					type : "POST",
					data : {
						u_no : u_no
					},
					url : contextPath+"/user/transformUser",
					success : function(data){
						$("#transformModal").css("display", "none");
						alert(data);
					},
					error : function(res){
						alert(res.responseText);
					}
				});
			}else{
				alert("이용약관에 동의해주세요.");
			}
		});
		
		$("#checkbox").on("change",function(){
			var isChecked = $(this).is(":checked");
			if(isChecked){
				boolInfo = true;
			}else{
				boolInfo = false;
			}
		});
		
		
		$("#transformCancelBtn").click(function() {
			$("#transformModal").css("display", "none");
		});
	</script>