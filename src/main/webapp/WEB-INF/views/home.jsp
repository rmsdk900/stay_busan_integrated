<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="common/header.jsp"%>

<style>

/* 검색 테이블 */
.searchFormDiv {
	max-width: 1500px;
	margin: 0 auto;
	margin-bottom: 50px;
	padding-top: 30px;
	padding-bottom: 30px;
}

input[type=text], input[type=number] {
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

input[type=text]:focus, input[type=number]:focus {
	background-color: #fff;
	border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder, input[type=number] {
	color: #cccccc;
}

input[type=text]:hover, input[type=number]:hover {
	background-color: #EAEAEA;
}

input[type=button] {
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
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	margin: 5px 3px 7px 17px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover
	{
	background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active
	{
	-moz-transform: scale(0.95);
	-webkit-transform: scale(0.95);
	-o-transform: scale(0.95);
	-ms-transform: scale(0.95);
	transform: scale(0.95);
}

/* 검색 테이블 */

/* 구별 room list style /////////*/
.roomList{
	width:500px;
	height:300px;
	color:white;
}
.roomList:hover{
	background-color:black;
	-webkit-transition: .2s ease-in;
	transition: .2s ease-in;
}

.roomList-a {
	width: 100%;
	height: 100%;
	position: absolute;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

.roomList img:hover{
	background-color:black;
	opacity: 0.7;
}

.aContent {
	position: absolute;
	top: 80%;
	left: 45%;
	right: 5%;
}

/* 구별 room list style  /////////////*/

/* top3 */
.bestList {
	margin-top: 3%;
	margin-left: 9.5%;
	height: 10%;
	overflow: hidden;
}

.roomImgDiv {
	display: block;
	float: left;
	width: 26.4%;
	height: 14%;
	margin-right: 5%;
}

.roomImgDiv:last-child {
	display: block;
	float: left;
	width: 26.4%;
	height: 14%;
}

.toproomImg {
	width: 100%;
	height: 100%;
}

.bestList ul {
	padding-left: 0;
	height: 245px;
	overflow: hidden;
}
</style>

<style>
.blog .carousel-indicators {
	left: 0;
	top: auto;
    bottom: -40px;

}

/* The colour of the indicators */
.blog .carousel-indicators li {
    background: #a3a3a3;
    border-radius: 50%;
    width: 8px;
    height: 8px;
}

.blog .carousel-indicators .active {
background: #707070;
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
                           <td colspan=1><input type="number" name="g_guests" id="guests" autocomplete="off" min="1" placeholder="몇 명이서 가시나요?"/></td>
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
         $("#guests").on("keydown", function(e){
           if($("#guests").val()<0){
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
                  
               }
            });
   </script>
   <!-- datePicker script -->


  <div class="container">
	<div class="row blog">
	    <div class="col-md-12" style="width:1300px;">
	        <div id="blogCarousel" class="carousel slide" data-ride="carousel">
	        
	            <ol class="carousel-indicators">
					<li data-target='#blogCarousel' data-slide-to='0' class='active'></li>
					<li data-target='#blogCarousel' data-slide-to='1'></li>
					<li data-target='#blogCarousel' data-slide-to='2'></li>
					<li data-target='#blogCarousel' data-slide-to='3'></li>
	            </ol>
	
	            <!-- Carousel items -->
	            <div class="carousel-inner">
	                <div class="carousel-item active">
		                 <div class="row" style="height:700px;">
			                <c:forEach var="guList" items="${homeList}" begin="0" end="3">
		                        <div class="roomList" style="position:relative; margin:0 auto; margin-bottom:50px;" >
		                            <a href="${pageContext.request.contextPath}/room/list?r_gu=${guList.r_gu}">
			                     		<img style="width:100%; height:100%;" alt="Image" src="${pageContext.request.contextPath}/room/displayFile?fileName=${guList.g_i_fullName}" />
			                  		</a>
			                  		<div class="aContent">
				                     <h5>${guList.r_gu}(${guList.r_count}개)<br/>
				                     평균가격 : ${guList.r_avgPrice}원</h5>
		                  			</div>
		                        </div>
			                </c:forEach>
			             </div>
	                </div>
	                
	                <div class="carousel-item">
		                 <div class="row" style="height:700px;">
			                <c:forEach var="guList" items="${homeList}" begin="4" end="7">
		                        <div class="roomList" style="color:white;position:relative; margin:0 auto; margin-bottom:50px;" >
		                            <a href="${pageContext.request.contextPath}/room/list?r_gu=${guList.r_gu}">
			                     		<img style="width:500px; height:300px;" alt="Image" src="${pageContext.request.contextPath}/room/displayFile?fileName=${guList.g_i_fullName}" />
			                  		</a>
			                  		<div class="aContent">
				                     <h5>${guList.r_gu}(${guList.r_count}개)<br/>
				                     평균가격 : ${guList.r_avgPrice}원</h5>
		                  			</div>
		                        </div>
			                </c:forEach>
			             </div>
	                </div>
	                
	                <div class="carousel-item">
		                 <div class="row" style="height:700px;">
			                <c:forEach var="guList" items="${homeList}" begin="8" end="11">
		                        <div class="roomList" style="color:white;position:relative; margin:0 auto; margin-bottom:50px;" >
		                            <a href="${pageContext.request.contextPath}/room/list?r_gu=${guList.r_gu}">
			                     		<img style="width:500px; height:300px;" alt="Image" src="${pageContext.request.contextPath}/room/displayFile?fileName=${guList.g_i_fullName}" />
			                  		</a>
			                  		<div class="aContent">
				                     <h5>${guList.r_gu}(${guList.r_count}개)<br/>
				                     평균가격 : ${guList.r_avgPrice}원</h5>
		                  			</div>
		                        </div>
			                </c:forEach>
			             </div>
	                </div>
	                
	                <div class="carousel-item">
		                 <div class="row" style="height:700px;">
			                <c:forEach var="guList" items="${homeList}" begin="12" end="15">
		                        <div class="roomList" style="color:white;position:relative; margin:0 auto; margin-bottom:50px;" >
		                            <a href="${pageContext.request.contextPath}/room/list?r_gu=${guList.r_gu}">
			                     		<img style="width:500px; height:300px;" alt="Image" src="${pageContext.request.contextPath}/room/displayFile?fileName=${guList.g_i_fullName}" />
			                  		</a>
			                  		<div class="aContent">
				                     <h5>${guList.r_gu}(${guList.r_count}개)<br/>
				                     평균가격 : ${guList.r_avgPrice}원</h5>
		                  			</div>
		                        </div>
			                </c:forEach>
			             </div>
	                </div>
	                
	            </div>
	        </div>
	    </div>
	</div>
</div> 
<script>
	/* 
	$(function(){
		
		$.ajax({
			type: "post",
			url: contextPath+"/common/guList",
			dataType: "text",
			success: function(data){
				console.log(data);
				
				var html = "";
				
				if(data != 0 && data < 5){
					html += "<li data-target='#blogCarousel' data-slide-to='0' class='active'></li>";
				}else if(data > 4 && data < 9){
					html += "<li data-target='#blogCarousel' data-slide-to='0' class='active'></li>";
					html += "<li data-target='#blogCarousel' data-slide-to='1'></li>";
				}else if(data > 8 && data < 13){
					html += "<li data-target='#blogCarousel' data-slide-to='0' class='active'></li>";
					html += "<li data-target='#blogCarousel' data-slide-to='1'></li>";
					html += "<li data-target='#blogCarousel' data-slide-to='2'></li>";
				}else{
					html += "<li data-target='#blogCarousel' data-slide-to='0' class='active'></li>";
					html += "<li data-target='#blogCarousel' data-slide-to='1'></li>";
					html += "<li data-target='#blogCarousel' data-slide-to='2'></li>";
					html += "<li data-target='#blogCarousel' data-slide-to='3'></li>";
				}
				$(".carousel-indicators").html(html);
			}
		});
	}); */
</script>   
   

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
                     </div>
                  </li>
               </c:forEach>
            </ul>
         </c:when>
         <c:otherwise>
         	<h3>아직 등록된 방이 없습니다.</h3>
         </c:otherwise>
      </c:choose>
   </div>



</div>
<%@ include file="common/footer.jsp"%>