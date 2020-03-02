<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> --%>

<%@ include file="common/header.jsp"%>

<style>

/* 검색 테이블 */
.searchFormDiv{
	max-width: 1500px;
	margin: 0 auto;
	margin-bottom: 50px;
	padding-top:30px;
	padding-bottom:30px;
}

input[type=text],input[type=number] {
  background-color: white;
  border: none;
  color: #0d0d0d;
  padding: 15px 20px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  width: 100%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:placeholder {
  color: #cccccc;
}

input[type=text]:focus,input[type=number]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder, input[type=number]{
  color: #cccccc;
}

input[type=text]:hover, input[type=number]:hover{
  background-color: #EAEAEA;
}


input[type=button]{
  background-color: #56baed;
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 30px;
  height: 48px;
  width: 80px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 3px 7px 17px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;	
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

/* 검색 테이블 */

/* 구별 room list style /////////*/
.homeList {
	max-width: 81%;
	min-height: 600px;
	margin: 0 auto;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-ms-flex-direction: row;
	flex-direction: row;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
}


.roomList {
	background-color: #eaeaea;
	min-width: 12rem;
	min-height: 8rem;
	position: relative;
	-webkit-box-flex: 1;
	-ms-flex: 1;
	flex: 1;
	-ms-flex-preferred-size: 8rem;
	flex-basis: 8rem;
	margin-right: 2px;
	margin-bottom: 2px;
	transfom:scale(1.2);
	color:white;
}

.roomList:hover{
color:black;
  opacity: 0.6;
  -webkit-transition: .2s ease-in;
  transition: .2s ease-in;
	transfom:scale(1.2);
	
}

.roomList:nth-child(4n){
	-ms-flex-preferred-size: 14rem;
      flex-basis: 14rem;
}

.roomList:nth-child(3n+1) {
  -ms-flex-preferred-size: 10rem;
      flex-basis: 10rem;
}

.roomList:nth-child(7n+4) {
  -ms-flex-preferred-size: 20rem;
      flex-basis: 20rem;
  min-height: 12rem;
}

.roomList-a {
  width: 100%;
  height: 100%;
  position: absolute;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  transition: transform .2s;
}

.aContent{
	position:absolute;
	font-size:15px;
	top:80%;
	left:45%;
	right:5%;
}
/* 구별 room list style  /////////////*/

/* top3 */
.bestList{
	margin-top:3%;
	margin-left:10%;
}
</style>

<style>
.toproomImg{
	margin:50px;
	width:500px;
	height:500px;
}
</style>
<div style="min-hight: 100%;">

	<div class="searchFormDiv">
		<form id="searchForm" action="${pageContext.request.contextPath}/room/list" method="GET">
		<div style="margin-left:9%;">
			<table style="width:100%; align:center;">
				<tr>
					<td>
						<div style="margin-left:50px;">
							<table style="width:100%; align:center;">
								<tr>
									<td>지역</td>
									<td colspan=4><input type="text" name="g_area" id="area" autocomplete="off" placeholder="어디로 가실건가요? ex)동래구"/></td>
								</tr>
								<tr>
									<td>체크인</td>
									<td><input type="text" id="startDate" name="startDate" autocomplete="off" placeholder="체크인 날짜를 선택해주세요"/></td>
									<td>&nbsp;&nbsp;&nbsp;</td>
									<td>체크아웃</td>
									<td><input type="text" id="endDate" name="endDate" autocomplete="off" placeholder="체크아웃 날짜를 선택해주세요"/></td>
								</tr>
								<tr>
									<td>인원</td>
									<td colspan=1><input type="number" name="g_guests" id="guests" autocomplete="off" placeholder="몇 명이서 가시나요?"/></td>
								</tr>
							</table>
						</div>
					</td>
					<td>
						<div style="margin-left:30px; align:center;">
						<input type="button" id="searchBtn" value="검 색" style="width:200px; height:150px;"/>
						</div>
					</td>
				</tr>
			</table>
			</div>
		</form>
	</div>
	
	<script>
	$("#searchBtn").click(function(){
			var area = $("#area").val();
			var startDate = $("#startDate").val();
  	  	var endDate = $("#endDate").val();
  	  	var guests = $("#guests").val();
			
  	  	// 전부 입력하지 않은 경우
  	  	if((area==null || area=="") 
  	  			&& (startDate == null || startDate == "")
  	  			&& (endDate == null || endDate == "")
  	  			&& (guests == null || guests == "")){
  	  		$("#guests").val("0");
				$("#searchForm").submit();
  	  	}else if(area==null || area==""){
  	  		alert("지역구를 입력해주세요!");
  	  		$("#area").focus();
  	  		return;
  	  	}else if(startDate == null || startDate==""){
  	  		alert("체크인 날짜를 입력해 주세요.");
				$("#startDate").focus();
				return;
  	  	}else if(endDate == null || endDate == ""){
		  		alert("체크아웃 날짜를 입력해 주세요.");
		  		$("#endDate").focus();
		  		return;
		  	}else if(guests == null || guests == ""){
  			alert("인원 수를 입력해 주세요.");
  			$("#guests").focus();
  			return;
  		}else {
  			$("#searchForm").submit();
  		}
  	  	
		});
      
      
      // 마이너스 숫자 제한
         $(".number").on("keydown", function(e){
           if($(".number").val()<0){
              return false;
           }
            if(e.keyCode == 69 
                  || e.keyCode == 190 
                  || e.keyCode == 109 
                  || e.keyCode == 110 
                  || e.keyCode == 107 
                  || e.keyCode == 189 
                  || e.keyCode == 187){
                  return false;              
              } 
         });
   </script>

	<script>
		$("#searchBtn").click(function() {
			$("#searchForm").submit();
		});
	</script>

	<!-- datePicker script -->
	<script>
		var minDate;

		$("#startDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					minDate : 0,
					todayHighlight : true,
					changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					onSelect : function(dateText, inst) {
						minDate = new Date(dateText);
						$("#endDate").datepicker("option", "minDate", minDate);
						$(".endDate").focus();
					}
				});

		$("#endDate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					onSelect : function(dateText, inst) {
						maxDate = new Date(dateText);
						$(".endDate").focus();
						startDatepicker();
					}
				});
	</script>
	<!-- datePicker script -->

	<div class="homeList">
		<c:choose>
			<c:when test="${!empty homeList}">
				<c:forEach var="guList" items="${homeList}">
					<div class="roomList">
						<a class="roomList-a" href="${pageContext.request.contextPath}/room/list?r_gu=${guList.r_gu}">
							<img style="width:99%; height:99%;"class="roomImg" src="${pageContext.request.contextPath}/room/displayFile?fileName=${guList.g_i_fullName}" />
						</a>
						<div class="aContent">
							<h4>${guList.r_gu}(${guList.r_count}개)<br/>
							평균가격 : ${guList.r_avgPrice}원</h4>
						</div>					
					</div>						
				</c:forEach>				
			</c:when>
		</c:choose>
	</div>

<!-- ////////////////////////////// -->
	
	<div class="bestList">
	<h2>TOP 3</h2>
		<c:choose>
			<c:when test="${!empty bestList}">
				<ul>
					<c:forEach var="best" items="${bestList}">
						<li style="list-style: none;">
							<div class="roomImgDiv">
								<a href="${pageContext.request.contextPath}/room/detail?r_no=${best.r_no}">
									<img class="toproomImg" src="${pageContext.request.contextPath}/room/displayFile?fileName=${best.r_i_fullName}" />
								</a>
								<div>
									<br />
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:when>
		</c:choose>
	</div>



</div>
<%@ include file="common/footer.jsp"%>