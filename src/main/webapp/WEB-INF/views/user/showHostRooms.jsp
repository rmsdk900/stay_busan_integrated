<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.show_host_rooms_list_room_img{
		width: 296px;
		height: 200px;
	}
	.show_host_rooms_list_room_img img {
		width: 100%;
		height: 100%;
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
	height: 48px;
	width: 100px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	margin-top: 20px;
	margin-bottom: 20px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
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
	margin-top: 20px;
	margin-bottom: 20px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}
</style>

<c:if test="${!empty myAllInfo.hosting}">
	<div class="show_host_rooms_wrapper">
		<div>
			<h3>
				<c:out value="${myAllInfo.userVO.u_name}"/>의 숙소
			</h3>
		</div>
		
		<div class="show_host_rooms_list">
			<c:forEach var="room" items="${myAllInfo.hosting}">
					<c:if test="${room.r_deleted == 0}">
						<div class="show_host_rooms_list_room_img">
							
							<a href="${pageContext.request.contextPath}/room/detail?r_no=${room.r_no}">
								<img src="${pageContext.request.contextPath}/displayFile?fileName=${room.imgList[0]}" alt="대표 이미지" />
							</a>
							
						</div>
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
						<c:if test="${myAllInfo.userVO.u_no eq userInfo.u_no}">
							<div>
								<input type="button" value="댓글 관리" data-r_no="${room.r_no}" class="btnReview" />
								<!-- 방 삭제 모달 -->
								<button type="button" data-r_no="${room.r_no}" data-toggle="modal"
								data-target="#delRoom"  class="modalBtnDelRoom">${room.r_no}번 방 삭제</button>
							</div>
						</c:if>
					</c:if>
			</c:forEach>
			<!-- 방 삭제 기능 구현 -->
			<div class="delRoomView"></div>
		</div>
		
	</div>
	<div class="deleted_host_rooms_wrapper">
		<div>
			<h3>
				<c:out value="${myAllInfo.userVO.u_name}"/>의 삭제된 숙소
			</h3>
		</div>
		<div class="show_host_rooms_list">
			<c:forEach var="room" items="${myAllInfo.hosting}">
					<c:if test="${room.r_deleted == 1}">
						<div class="show_host_rooms_list_room_img">
							
							<a href="${pageContext.request.contextPath}/room/detail?r_no=${room.r_no}">
								<img src="${pageContext.request.contextPath}/displayFile?fileName=${room.imgList[0]}" alt="대표 이미지" />
							</a>
							
						</div>
						<div>
							<h4>${room.r_name}</h4>
						</div>
						<div>
							<span>★ </span>
							<span>
								<fmt:formatNumber value="${room.r_star}" pattern="0.##"/>
							</span>
							
						</div>
						<div>
							<span>총 예약 : </span>
							<span><c:out value="${room.r_bookedcnt}"/></span>
						</div>
						
					</c:if>
			</c:forEach>
		</div>
		
	</div>
</c:if>
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