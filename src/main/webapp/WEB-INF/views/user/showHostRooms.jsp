<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.show_host_rooms_list_room_img{
		width: 100%;
		height: 180px;
	}
	.show_host_rooms_list_room_img img {
		width: 100%;
		height: 100%;
	}
	
	.show_host_rooms_one_manage {
		width: 50%;
		display: flex;
		justify-content: flex-end;
		align-items: center;
		flex-direction: column;
	}
	
</style>
<style>
/* 리스트의 룸 하나 당 별점관련 */
.onestarL1, .onestarL2, .onestarL3, .onestarL4, .onestarL5 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.onestarR1, .onestarR2, .onestarR3, .onestarR4, .onestarR5 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.onestarL1.on, .onestarL2.on, .onestarL3.on, .onestarL4.on, .onestarL5.on
	{
	background-position: 0 0;
}

.onestarR1.on, .onestarR2.on, .onestarR3.on, .onestarR4.on, .onestarR5.on
	{
	background-position: -15px 0;
}
.show_host_rooms_wrapper,.deleted_host_rooms_wrapper{
	margin-left: 10%;
}
</style>

<style>
.btnReview, .modalBtnDelRoom{
	background-color: #56baed;
	border: none;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 15px;
	height: 44px;
	width: 90px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	margin-top: 12px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	margin: 0 4px;
}

.btncancel, .btndel{
	background-color: #56baed;
	border: none;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 15px;
	height: 48px;
	width: 100px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
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
<c:if test="${!empty myAllInfo.hosting}">
	<div class="show_host_rooms_wrapper swiper-container">
		<div>
			<h3>
				<c:out value="${myAllInfo.userVO.u_name}"/>의 숙소
			</h3>
		</div>
		
		<div class="show_host_rooms_list swiper-wrapper">
			<c:forEach var="room" items="${myAllInfo.hosting}">
					<c:if test="${room.r_deleted == 0}">
						<div class="show_host_rooms_one swiper-slide" > 
							<div>
								<div class="show_host_rooms_list_room_img">
									
									<a href="${pageContext.request.contextPath}/room/detail?r_no=${room.r_no}">
										<img src="${pageContext.request.contextPath}/displayFile?fileName=${room.imgList[0]}" alt="대표 이미지" />
									</a>
									
								</div>
								<br/>
								<div>
									<h4>${room.r_name}</h4>
								</div>
								<div>
									<div class="starRev">
										<span class="onestarL1 
										<c:out value="${room.r_star > 0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR1
										<c:out value="${room.r_star > 0.5 ? 'on' : ''}"/>
										"></span>
										<span class="onestarL2
										<c:out value="${room.r_star > 1.0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR2
										<c:out value="${room.r_star > 1.5 ? 'on' : ''}"/>
										"></span>
										<span class="onestarL3
										<c:out value="${room.r_star > 2.0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR3
										<c:out value="${room.r_star > 2.5 ? 'on' : ''}"/>
										"></span>
										<span class="onestarL4
										<c:out value="${room.r_star > 3.0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR4
										<c:out value="${room.r_star > 3.5 ? 'on' : ''}"/>
										"></span>
										<span class="onestarL5
										<c:out value="${room.r_star > 4.0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR5
										<c:out value="${room.r_star > 4.5 ? 'on' : ''}"/>
										"></span>
									</div>
									<span>
										<fmt:formatNumber value="${room.r_star}" pattern="0.##"/>
									</span>
									
								</div>
								<div>
									<span>총 예약 : <c:out value="${room.r_bookedcnt}"/></span>
								</div>
							</div>
							
							<c:if test="${myAllInfo.userVO.u_no eq userInfo.u_no}">
								<div class="show_host_rooms_one_manage" style="margin:0 auto;">
									<!-- 방 삭제 모달 -->
									<table>
										<tr>
											<td>
												<button type="button" data-r_no="${room.r_no}" data-toggle="modal"
												data-target="#delRoom"  class="modalBtnDelRoom">방 삭제</button>
											</td>
											<td>
												<input type="button" value="댓글 관리" data-r_no="${room.r_no}" class="btnReview" />
											</td>
										</tr>
									</table>
								</div>
							</c:if>
						</div>
						
					</c:if>
			</c:forEach>
			
		</div>
		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	<!-- 방 삭제 기능 구현 -->
	<div class="delRoomView"></div>
	<br/>
	<div class="deleted_host_rooms_wrapper swiper-container">
		<div>
			<h3>
				<c:out value="${myAllInfo.userVO.u_name}"/>의 삭제된 숙소
			</h3>
		</div>
		<div class="show_host_rooms_list swiper-wrapper">
			<c:forEach var="room" items="${myAllInfo.hosting}">
					<c:if test="${room.r_deleted == 1}">
						<div class="show_host_rooms_one swiper-slide">
							<div style="max-width:290px;">
								<div class="show_host_rooms_list_room_img">
								
									<a href="${pageContext.request.contextPath}/room/detail?r_no=${room.r_no}">
										<img src="${pageContext.request.contextPath}/displayFile?fileName=${room.imgList[0]}" alt="대표 이미지" />
									</a>
									
								</div>
								<br/>
								<div>
									<h4>${room.r_name}</h4>
								</div>
								<div>
									<div class="starRev">
										<span class="onestarL1 
										<c:out value="${room.r_star > 0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR1
										<c:out value="${room.r_star > 0.5 ? 'on' : ''}"/>
										"></span>
										<span class="onestarL2
										<c:out value="${room.r_star > 1.0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR2
										<c:out value="${room.r_star > 1.5 ? 'on' : ''}"/>
										"></span>
										<span class="onestarL3
										<c:out value="${room.r_star > 2.0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR3
										<c:out value="${room.r_star > 2.5 ? 'on' : ''}"/>
										"></span>
										<span class="onestarL4
										<c:out value="${room.r_star > 3.0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR4
										<c:out value="${room.r_star > 3.5 ? 'on' : ''}"/>
										"></span>
										<span class="onestarL5
										<c:out value="${room.r_star > 4.0 ? 'on' : ''}"/>
										"></span>
										<span class="onestarR5
										<c:out value="${room.r_star > 4.5 ? 'on' : ''}"/>
										"></span>
									</div>
									<span>
										<fmt:formatNumber value="${room.r_star}" pattern="0.##"/>
									</span>
									
								</div>
								<div>
									<span>총 예약 : </span>
									<span><c:out value="${room.r_bookedcnt}"/></span>
								</div>	
							</div>
							
						</div>
					</c:if>
			</c:forEach>
		</div>
		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	
</c:if>
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
<script>
	$(".modalBtnDelRoom").on("click", function(){
		var r_no=$(this).attr("data-r_no");
		
		var html = "";
		
		html += "<div class='modal fade' id='delRoom' ";
		html += " tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true' >";
		html += "	<div class='modal-dialog modal-sm' role='document'>";
		html += "		<div class='modal-content'>";
		html += "			<div class='modal-header'>";
		html += "				<h5 class='modal-title' id='myModalLabel' >"+r_no+"번 방 삭제 확인</h5>";
		html += "				<button type='button' class='close' data-dismiss='modal' aria-label='Close' >";
		html += "					<span aria-hidden='true'>&times;</span>";
		html += "				</button>";
		html += "			</div>";
		html += "			<div class='modal-body'>";
		html += "				<p>"+r_no+"번 방을 정말 삭제하시겠습니까?</p>";
		html += "			</div>";
		html += "			<div class='modal-footer'>";
		html += "			<button type='button' class='btncancel' data-dismiss='modal'>Close</button>";
		html += "			<button type='button' class='btndel' id='btnDelRoom' data-r_no='"+r_no+"'>방 삭제</button>";
		html += "			</div>";
		html += "		</div>";
		html += "	</div>";
		html += "</div>";
		
		$(".delRoomView").html(html);
		
	});
	
	$(".delRoomView").on("click", "#btnDelRoom", function(){
		var r_no = $(this).attr("data-r_no");
		console.log(r_no);
		$.post(contextPath+"/room/hide", {
			r_no: r_no
		}, function(data){
			console.log(data);
			location.reload();
		});
	});
</script>
<script>

</script>
