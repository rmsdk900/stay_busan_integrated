<!-- user 정보 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/header.jsp" %>
<c:set var="login" value="1" scope="session"/>

<style>
	.show_my_img {
		width: 200px;
		height: 200px;
	}
	.FilledImg{
		
		width: 100%;
		height: 100%;
	}
	
	.roundingProfileImg{
		border-radius: 100px;
	}
	
	.show_wrapper{
		margin-left:100px;
		margin-right:100px;	
	}
</style>
<script>
	var u_no = '${myAllInfo.userVO.u_no}';
	var login = '${login}';
</script>
<!-- 소개 페이지 전체 -->
<div class="show_wrapper">
	<!-- 프로필 사진 + 제목 + 회원가입일 + 소개  -->
	<div>
		<!-- 프로필 사진 + 제목 + 회원가입일 -->
		<div>
			<!-- 프로필 사진 -->
			<div class="show_my_img" >
				[프로필 사진]
			</div>
			<!-- 프로필 제목 + 회원가입일-->
			<div>
				<!-- 프로필 제목 -->
				<div class="show_my_title">
					<h1>안녕하세요. 저는 ${myAllInfo.userVO.u_name}입니다.</h1>
				</div>
				<!-- 회원 가입일 -->
				<div>
					<span>회원 가입: </span>
					<span>
						<fmt:formatDate value="${myAllInfo.userVO.u_regdate}" pattern="yyyy"/>
					</span>
				</div>
			</div>
		</div>
		<!-- 소개 -->
		<div>
			<div class="show_my_introduce">
				<textarea  readonly>${myAllInfo.userVO.u_introduce}</textarea>
				
			</div>
			<div class="show_my_introduce_mod">
				<textarea  >${myAllInfo.userVO.u_introduce}</textarea>
				<div>
					<button class="show_my_introduce_mod_submit">편집 완료</button>
					<button class="show_my_introduce_mod_cancel">취소</button>
				</div>
			</div>
			<c:if test="${myAllInfo.userVO.u_no == login}">
				<div>
					<input type="button" class="show_my_introduce_mod_open" value="편집" />
				</div>
			</c:if>
		</div>
	</div>
	<!-- 숙소들 -->
	<!-- 
		조건 
		1. 보려는 페이지가 게스트일 경우
			1) 접속한 u_no랑 보려는 사람의 u_no가 같을 때 = 내 거 볼 때
			2) 접속한 내 u_no랑 보려는 마이페이지의 u_no가 다를 때 = 다른 사람 거 볼 때
		2. 보려는 페이지가 호스트일 경우
			1) 접속한 u_no랑 보려는 사람의 u_no가 같을 때 = 내 거 볼 때
			2) 접속한 내 u_no랑 보려는 마이페이지의 u_no가 다를 때 = 다른 사람 거 볼 때
	-->
	<c:choose>
		<c:when test="${myAllInfo.userVO.u_type == 0 or myAllInfo.userVO.u_type == 9}">
			<%@ include file="./showGuestRooms.jsp" %>
		</c:when>
		<c:otherwise>
			<%@ include file="./showHostRooms.jsp" %>
			<!-- 후기들 -->
			<%@ include file="../comment/comment_host.jsp" %>
			<script src="${pageContext.request.contextPath}/resources/js/show_host.js"></script>
		</c:otherwise>
	</c:choose>

	
	
	
</div>



<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/show.js"></script>

<%@ include file="../common/footer.jsp" %>