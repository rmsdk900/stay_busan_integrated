<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>



/* .likeList, .bookedList, .pastList{
	margin-left:10%;
	clear:both;
	margin-top:3%;
} */

.roomlist img {
	width:300px;
	height:180px;
}

</style>
<!-- swiper css, script -->
<link rel="stylesheet" href="${path}/resources/css/swiper.min.css">
<!-- 예제 복사 -->
<style>
.swiper-container {
	margin-left: 10%;
	margin-right: 10%;
	margin-bottom: 3%;
	height: 500px;
	border: 5px solid #56baed;
	border-radius: 7px;
	box-shadow: 0 0 15px #ccc inset;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
	flex-direction: column;
}

.swiper-slide img {
	box-shadow: 0 0 3px #555;
	max-width: 100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
</style>
<script src="${path}/resources/js/swiper.min.js"></script>
<div class="domitoryList">
	<!-- status  -->
	<div class="swiper-container">
		<h3>찜 목록</h3>
		<div class="likeList swiper-wrapper">
			<c:choose>
				<c:when test="${!empty likeList}">
					<c:forEach var="likeList" items="${likeList}">
						<div class="roomlist swiper-slide" >
							<a href="${path}/room/detail?r_no=${likeList.r_no}">
								<img src="${pageContext.request.contextPath}/room/displayFile?fileName=${likeList.r_i_fullName}"/>
							</a>
							<br/>
							<h5>
								<a href="${path}/room/detail?r_no=${likeList.r_no}">${likeList.r_name}</a>
							</h5>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>찜한 숙소가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	
	<!-- status  -->
	<div class="swiper-container">
		<h3>예약 목록</h3>
		<div class="bookedList swiper-wrapper">
			<c:choose>
				<c:when test="${!empty bookedList}">
					<c:forEach var="bookedList" items="${bookedList}">
						<div class="roomlist swiper-slide" >
							<a href="bookedHistory?b_no=${bookedList.b_no}">
								<img src="${pageContext.request.contextPath}/user/displayFile?fileName=${bookedList.r_i_fullName}"/>
							</a>
							<br/>
							<h5>
								<a href="bookedHistory?b_no=${bookedList.b_no}">${bookedList.r_name}</a>
							</h5>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>예약한 숙소가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	<br/><br/>
	
	<!-- status  -->
	<div class="swiper-container">
		<h3>지나간 목록</h3>
		<div class="pastList swiper-wrapper">
			<c:choose>
				<c:when test="${!empty pastList}">
					<c:forEach var="pastList" items="${pastList}">
						<div class="roomlist swiper-slide" >
							<a href="pastHistory?b_no=${pastList.b_no}">
								<img src="${pageContext.request.contextPath}/user/displayFile?fileName=${pastList.r_i_fullName}"/>
							</a>
							<br/>
							<h5>
								<a href="pastHistory?b_no=${pastList.b_no}">${pastList.r_name}</a>
							</h5>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>이용하였던 숙소가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	<br/><br/>
 
</div>
<script>
	new Swiper('.swiper-container', {
	
		slidesPerView : 2, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 10, // 슬라이드간 간격
		slidesPerGroup : 2, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	
		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,
	
		loop : true, // 무한 반복
	
		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
</script>