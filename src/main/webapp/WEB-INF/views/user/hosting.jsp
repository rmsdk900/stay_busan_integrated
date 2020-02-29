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
</style>
<!-- 별점 관련 -->
<style>
/* 평균 별점관련 */
	.avgStarL1, .avgStarL2, .avgStarL3, .avgStarL4, .avgStarL5{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.avgStarR1, .avgStarR2, .avgStarR3, .avgStarR4, .avgStarR5{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.avgStarL1.on, .avgStarL2.on, .avgStarL3.on, .avgStarL4.on, .avgStarL5.on{background-position:0 0;}
	.avgStarR1.on, .avgStarR2.on, .avgStarR3.on, .avgStarR4.on, .avgStarR5.on{background-position:-15px 0;}
	
	/* 별점 처리 */
	.starL1, .starL2, .starL3, .starL4, .starL5{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR1, .starR2, .starR3, .starR4, .starR5{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starL1.on, .starL2.on, .starL3.on, .starL4.on, .starL5.on{background-position:0 0;}
	.starR1.on, .starR2.on, .starR3.on, .starR4.on, .starR5.on{background-position:-15px 0;}
</style>

<script>
	var u_no = '${myAllInfo.userVO.u_no}';
	var login_u_no = ${!empty userInfo ? userInfo.u_no : 0};
	var login_u_name = "${!empty userInfo ? userInfo.u_name : ''}";
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
			<c:if test="${myAllInfo.userVO.u_no == userInfo.u_no}">
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
	<!-- 호스팅 관리용 리스트 -->
	<%@ include file="./showHostRooms.jsp" %>
	<!-- 후기들 -->
	<%@ include file="../comment/comment.jsp" %>
	<script src="${pageContext.request.contextPath}/resources/js/show_host.js"></script>
	
</div>
<!-- 예약 결과 표시 -->

<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/show.js"></script>

<%@ include file="../common/footer.jsp" %>