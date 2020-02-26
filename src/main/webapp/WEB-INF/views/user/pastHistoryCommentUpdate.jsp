<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>



<div>
	<img src="${pageContext.request.contextPath}/user/displayFile?fileName=${history.r_i_fullName}"/>
	<h2>${history.r_name}</h2>
	<div>
		체크인 : <f:formatDate value="${history.b_date_from}" pattern="yyyy.MM.dd"/> &nbsp;&nbsp;&nbsp;<f:formatDate value="${history.r_checkin}" pattern="a hh:mm"/><br/>
		<hr/>
		체크아웃 : <f:formatDate value="${history.b_date_to}" pattern="yyyy.MM.dd"/> &nbsp;&nbsp;&nbsp;<f:formatDate value="${history.r_checkout}" pattern="a hh:mm"/> <br/>
		<hr/>
		<br/>
		예약 인원 : ${history.b_guest} 명<br/>
		<hr/>
		결제 금액 : \ ${history.b_total_price} 원<br/>
		${history.u_no}
		<hr/>
	</div>
	
	<!-- 다시 예약-> 없어진 방이면 버튼 없애기 -->
	<c:if test="${history.r_deleted == 0}">
		<!-- 삭제된 방이면 버튼 안보이게 -->
		<a href="${pageContext.request.contextPath}/room/detail?r_no=${history.r_no}"><input type="button" value="다시 예약하러 가기" id="detailRoom"/></a>
	</c:if>
	
	<div class="updateCommentDiv">
		<form id="updateComment" action="commentModify" method="post">
			<table>
				<tr>
					<th>후기 수정
					</th>
				</tr>
				<c:forEach var="comment" items="${comment}">
					<tr>
						<td class="commentUpdateTd">
							<textarea cols=70 rows=10 name="c_content">${comment.c_content}</textarea>
						</td>
						<td>
						<div class="starUpdate">
                        <span class="starR1 
                        <c:out value="${comment.c_star > 0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR2
                        <c:out value="${comment.c_star > 0.5 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR1
                        <c:out value="${comment.c_star > 1.0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR2
                        <c:out value="${comment.c_star > 1.5 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR1
                        <c:out value="${comment.c_star > 2.0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR2
                        <c:out value="${comment.c_star > 2.5 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR1
                        <c:out value="${comment.c_star > 3.0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR2
                        <c:out value="${comment.c_star > 3.5 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR1
                        <c:out value="${comment.c_star > 4.0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR2
                        <c:out value="${comment.c_star > 4.5 ? 'on' : ''}"/>
                        "></span>
                     </div>
						<input type="hidden" name="r_no" value="${history.r_no}"/>
						<input type="hidden" name="u_no" value="${history.u_no}"/>
						<input type="hidden" name="u_name" value="${history.u_no}"/><!-- ${userInfo.u_name} 으로 바꿔줘야 함 -->
						<input type="hidden" name="b_no" value="${history.b_no}"/>
						<input type="hidden" name="c_no" value="${comment.c_no}"/>
						<input type="button" id="commentUpdateSubmit" value="수정"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$('.starUpdate span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
	
var starList = $('.starUpdate span');
console.log(starList);

$('#commentUpdateSubmit').click(function(){
	var starLength = $('.on').length;
	console.log(starLength);
	var starScore = starLength/2;
	var str="<input type='hidden' name='c_star' value='"+starScore+"'/>";
	$('#updateComment').append(str);
	$('#updateComment').submit();
});

	var c_no = $("#c_no").val();
	var b_no = $("#b_no").val();
	$("#commentModify").click(function(){
		location.href="commentModify?b_no="+b_no;
	});

	$("#commentDelete").click(function(){
		var isDelete = confirm("후기를 삭제합니다.");
		if(isDelete){
			location.href="commentDelete?c_no="+c_no+"&b_no="+b_no;
		}
	});
	
</script>

