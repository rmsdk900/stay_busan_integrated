<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css">
</head>
<style>
 body {
    margin-top:30px;
}
.stepwizard-step p {
    margin-top: 5px;
    color:black;
}
.stepwizard-row {
align:center;
    display: table-row;
}
.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}

.stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
    opacity:1 !important;
    color:#bbb;
}
.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content:" ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-index: 0;
}
.stepwizard-step {
    display: table-cell;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}

.roomWrap{/* 전체 감싸는 div */
   margin-top:6%;
   margin-left:13%;
}

.table1{
   width:100%;
}

.table2{
   width:100%;
   margin-left:20%;
}

input[type=text],input[type=number] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 10px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 2px;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

textarea{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 10px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 2px;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

#banDateAdd, #clearBtn{
  background-color: #56baed;
  border: none;
  color: white;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.banCancel{
  background-color: #56baed;
  border: none;
  color: white;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;   
}

#preBtn{
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

#submitBtn{
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  margin-left:55%;
}

.btnWrap{
   margin-top:3%;
}
</style>
<body>
<div>
    <div class="stepwizard">
        <div class="stepwizard-row">
            <div class="stepwizard-step">         
                <div style="margin-left:40%;">1
                <p class="mr-5"><small>Room Information</small></p>
                </div>
            </div>
            <div class="stepwizard-step"> 
                <div style="margin-left:25%;">2
                <h3>Check In / Check Out</h3>
                </div>
            </div>
            <div class="stepwizard-step">
               3             
                <p class="mr-5"><small>Room Image</small></p>
            </div>
        </div>
    </div>
</div>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <!--  -->
<div class="roomWrap">
   <form action="resisterRoom3" method="post" id="submitForm">
      
      <div>
      <table>
         <tr>
            <td>
               <div class="table1">
                  <table>
                  
                     <tr>
                        <td>숙소 이름</td>
                        <td colspan=2><input type="text" name="r_name" id="r_name" autocomplete="off" style="width:93%;"/></td>
                     </tr>
                     <tr>
                        <td colspan=3>숙소 설명</td>
                     </tr>
                     <tr>
                        <td colspan=3><textarea rows="20" cols="50" name="r_desc" id="r_desc" autocomplete="off" style="width:100%;" style="resize:none;"></textarea></td>
                     </tr>
                  </table>
               </div>
            </td>
            
            <td>
               <div class="table2">
                  <table>
                     <tr>
                        <td>숙박 가능 날짜</td>
                        <td colspan=2><input type="text" id="startDate" name="date_from" autocomplete="off" readonly>-<input type="text" name="date_to" autocomplete="off" id="endDate"></td>
                     </tr>
                     <tr>
                        <td>숙박 불가 기간</td>
                        <td colspan=2>
                           <div id="banDate">
                              <div>
                                 <input type="text" class="banStartDate" name="closed_from" autocomplete="off" readonly>-<input type="text" name="closed_to" class="banEndDate" autocomplete="off" readonly>
                                 <input type="button" id="banDateAdd" value="추가"/> | <input type="button" id="clearBtn" value="초기화"/>
                              </div>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <td>체크인</td>
                        <td colspan=2>
                           <input type="text" name="r_checkin_our" id="checkin_hour" autocomplete="off"/>시
                           <input type="text" name="r_checkin_minute" id="checkin_minutes" value="00" />분
                        </td>
                     </tr>
                     <tr>
                        <td>체크아웃</td>
                        <td colspan=2>
                           <input type="text" name="r_checkout_our" id="checkout_hour"autocomplete="off" />시
                           <input type="text" name="r_checkout_minute" id="checkout_minutes" value="00" >분
                        </td>
                     </tr>
                     <tr>
                        <td>가격 1박/1인</td>
                        <td colspan=2><input type= "number" name="r_price" value="0" min="0" id="r_price" step="100"/>원</td>
                     </tr>
                  </table>
               </div>
            </td>
         </tr>
      </table>
      </div>
      
      <div class="btnWrap">
         <div>
            <input type="button" id="preBtn" value="이전">   
            <input type="button" id="submitBtn" value="다음">
         </div>
      </div>
      
      <div id="addData">
         <input type="hidden" id="r_guests" name="r_guests" value="${room.r_guests}"/>
         <input type="hidden" id="r_bedroom" name="r_bedroom" value="${room.r_bedroom}"/>
         <input type="hidden" id="r_bed" name="r_bed" value="${room.r_bed}"/>
         <input type="hidden" id="r_bath" name="r_bath" value="${room.r_bath}"/>
         <input type="hidden" id="r_addr_main" name="r_addr_main" value="${room.r_addr_main}"/>
         <input type="hidden" id="r_addr_detail" name="r_addr_detail" value="${room.r_addr_detail}"/>
         <c:if test="${!empty room.amenities}">
            <c:forEach var="amenity" items="${room.amenities}">
               <input type="hidden" name="amenity" value="${amenity}"/>
            </c:forEach>
         </c:if>
      </div>
      
   </form>
</div>
   <script>
   
      /* 숙소설명 autofocus */
      $(function(){
            $("#r_name").focus();
      });
      
      // 최소 날짜
      var minDate;
      // 최대 날짜
      var maxDate;
      
      var endMinDate;
      
      // 불가 날짜 보관 배열
      var banDates = new Array();
      
      // 불가 날짜 계산용 날짜
      var banStartDate;
      var banEndDate;
      
      $("#r_price").keydown(function(e){
         if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 110 || e.keyCode == 107 || e.keyCode == 189 || e.keyCode == 187){
               return false;              
           }
       });
      
      $("#submitBtn").click(function(){
         
         var r_name = $("#r_name").val();
         var r_desc = $("#r_desc").val();
         var checkin_hour = $("#checkin_hour").val();
         var checkin_minutes = $("#checkin_minutes").val();
         var checkout_hour = $("#checkout_hour").val();
         var checkout_minutes = $("#checkout_minutes").val();
         var startDate = $("#startDate").val();
         var endDate = $("#endDate").val();
         var r_price = $("#r_price").val();
         
         if(r_name == null || r_name == ""){
            alert("숙소명을 입력해주세요");
            $("#r_name").focus();
            return;
         }
         
         if(r_desc == null || r_desc == ""){
            alert("숙소설명을 입력해주세요");
            $("#r_desc").focus();
            return;
         }
         
         if(startDate == null || startDate == ""){
            alert("숙박가능날짜(시작)를 입력해주세요");
            $("#startDate").focus();
            return;
         }
         
         if(endDate == null || endDate == ""){
            alert("숙박가능날짜(종료)을 입력해주세요");
            $("#endDate").focus();
            return;
         }
         
         if(checkin_hour == null || checkin_hour == ""){
            alert("체크인(시)를 입력해주세요");
            $("#checkin_hour").focus();
            return;
         }
         
         if(checkin_minutes == null || checkin_minutes == ""){
            alert("체크인(분)을 입력해주세요");
            $("#checkin_minutes").focus();
            return;
         }
         
         if(checkout_hour == null || checkout_hour == ""){
            alert("체크아웃(시)을 입력해주세요");
            $("#checkout_hour").focus();
            return;
         }
         
         if(checkout_minutes == null || checkout_minutes == ""){
            alert("체크아웃(분)을 입력해주세요");
            $("#checkout_minutes").focus();
            return;
         }
         
         if(r_price == null || r_price == ""){
            alert("가격을 입력해주세요");
            $("#r_price").focus();
            return;
         }
         
         $("#submitForm").submit();
      });
      
      $("#clearBtn").click(function(){
         $(".banStartDate").val("");
         $(".banEndDate").val("");
         $(".addBanStartDate").val("");
         $(".addBanEndDate").val("");
         banDates.splice(0,banDates.length);
         console.log(banDates);
      });
      
      $("#preBtn").click(function(){
         history.go(-1);         
      });
   
      $("#startDate").datepicker({
         dateFormat : "yy-mm-dd",
         minDate : 0,
         todayHighlight : true,
         changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
         changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         onSelect : function(dateText, inst) {
            minDate = new Date(dateText);
            $(".banStartDate").datepicker("destroy");
            $(".banEndDate").datepicker("destroy");
            $("#endDate").datepicker("option","minDate",minDate);
            $(".endDate").focus();
         }
      });
   
      $("#endDate").datepicker({
         dateFormat : "yy-mm-dd",
         changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
         changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
           onSelect : function(dateText, inst){
              maxDate = new Date(dateText);
              console.log(maxDate);
              $(".endDate").focus();
              $(".banStartDate").datepicker("destroy");
              $(".banEndDate").datepicker("destroy");
              startDatepicker();
              endDatepicker();
              $(".banEndDate").datepicker("option","maxDate",maxDate);
           }
      });
   
   // 데이트픽커(함수)
   function startDatepicker(){
      $(".banStartDate").datepicker({
         dateFormat : "yy-mm-dd",
         minDate : minDate,
         maxDate : maxDate,
         todayHighlight : true,
         changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
         changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         onSelect : function(dateText, inst) {
            endMinDate = new Date(dateText);
            banStartDate = new Date(dateText);
            $(".banEndDate").datepicker("destroy");
            endDatepicker();
            $(".banEndDate").datepicker("option","maxDate",maxDate);
            $(".endDate").focus();
         }
      });
   }

   function endDatepicker(){
      $(".banEndDate").datepicker({
         dateFormat : "yy-mm-dd",
         minDate : endMinDate,
         maxDate : maxDate,
         changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
         changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
           onSelect : function(dateText, inst){
              banEndDate = new Date(dateText);
              banDateCalc(banStartDate, banEndDate);
              $(".endDate").focus();
           }
      });
   };
   
   
   // 추가 데이트픽커
   function addStartDatepicker(){
      $(".addBanStartDate").datepicker({
         dateFormat : "yy-mm-dd",
         minDate : minDate,
         maxDate : maxDate,
         todayHighlight : true,
         changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
         changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
           beforeShowDay : disableAllTheseDays,
         onSelect : function(dateText, inst) {
            endMinDate = new Date(dateText);
            banStartDate = new Date(dateText);
            addEndDatepicker();
            $(".endDate").focus();
         }
      });
   }

   function addEndDatepicker(){
      $(".addBanEndDate").datepicker({
         dateFormat : "yy-mm-dd",
         minDate : endMinDate,
         maxDate : maxDate,
         changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
         changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
           beforeShowDay : disableAllTheseDays,
           onSelect : function(dateText, inst){
              banEndDate = new Date(dateText);
              console.log(banEndDate);
              banDateCalc(banStartDate, banEndDate);
              $(".endDate").focus();
           }
      });
   };
   
   // 불가 기간 추가
   function disableAllTheseDays(date){
      var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
      for(i=0; i<banDates.length; i++){
         if($.inArray(y+ "-" + (m+1) + "-" + d, banDates) != -1){
            return [false];
         }
      }
      return [true];
   }
   
   // 추가 버튼 클릭
   $("#banDateAdd").click(function(){
      var html = "";
      html += "<div>";
      html += "<input type='text' class='addBanStartDate' name='closed_from' autocomplete='off' readonly>-<input type='text' class='addBanEndDate' name='closed_to' autocomplete='off' readonly/>&nbsp;&nbsp;<input type='button' class='banCancel' value='x'/>"
      html += "</div>";
      $("#banDate").append(html);
      addStartDatepicker();
   });
   
   // x버튼 클릭
   $("#banDate").on("click",".banCancel",function(){
      var targetDiv = $(this).parent();
      var deleteStartDate = new Date($(this).parent().find(".addBanStartDate").val());
      var deleteEndDate = new Date($(this).parent().find(".addBanEndDate").val());
      deleteBanDate(deleteStartDate,deleteEndDate);
      targetDiv.remove();
      addStartDatepicker();
   });
   
   // 불가 기간 계산
   function banDateCalc(banStartDate, banEndDate){
      
      var calcDateNum = parseInt((banEndDate-banStartDate)/1000/3600/24);
      
      console.log(calcDateNum);
      console.log(banStartDate.getDate());
      
      var yy = banStartDate.getFullYear();
      var mm = banStartDate.getMonth();
      var dd = banStartDate.getDate();
      
      console.log(yy+mm+dd);
      
      banDates.push(yy+"-"+(mm+1)+"-"+dd);
      for(var i=0; i<calcDateNum; i++){
         
         if(mm == 0 || mm == 2 || mm == 4 || mm == 6 || mm == 7 || mm == 9 || mm == 11){
            if(dd>30){
               dd = 1;
               mm = mm+1;
            }else{
               dd = dd+1;
            }
         }else if(mm == 3 || mm == 5 || mm == 8 || mm == 10){
            if(dd>29){
               dd = 1;
               mm = mm+1;
            }else{
               dd = dd+1;
            }
         }else{
            if(yy%4 == 0){
               if(dd>28){
                  dd = 1;
                  mm = mm+1;
               }else{
                  dd = dd+1;
               }
            }else{
               if(dd>27){
                  dd = 1;
                  mm = mm+1;
               }else{
                  dd = dd+1;
               }
            }
         }
         
         if(mm == 12){
            yy = yy+1;
            mm = 0;
            dd = 1;
         }
         
         console.log("yy : "+yy);
         console.log("mm : "+mm);
         console.log("dd : "+dd);
         
         var calcDate = (yy+"-"+(mm+1)+"-"+dd);
         console.log(calcDate);
         banDates.push(calcDate);
      }
      console.log(banDates);
   }
   
   // x버튼 클릭 시 bandate 정보 삭제
   function deleteBanDate(deleteStartDate, deleteEndDate){
      
      var calcDateNum = parseInt((deleteEndDate-deleteStartDate)/1000/3600/24);
      
      console.log(calcDateNum);
      
      var yy = deleteStartDate.getFullYear();
      var mm = deleteStartDate.getMonth();
      var dd = deleteStartDate.getDate();
      
      console.log(yy+"-"+(mm+1)+"-"+dd);
      
      banDates.splice(banDates.indexOf(yy+"-"+(mm+1)+"-"+dd),1);
      for(var i=0; i<calcDateNum; i++){
         
         if(mm == 0 || mm == 2 || mm == 4 || mm == 6 || mm == 7 || mm == 9 || mm == 11){
            if(dd>30){
               dd = 1;
               mm = mm+1;
            }else{
               dd = dd+1;
            }
         }else if(mm == 3 || mm == 5 || mm == 8 || mm == 10){
            if(dd>29){
               dd = 1;
               mm = mm+1;
            }else{
               dd = dd+1;
            }
         }else{
            if(yy%4 == 0){
               if(dd>28){
                  dd = 1;
                  mm = mm+1;
               }else{
                  dd = dd+1;
               }
            }else{
               if(dd>27){
                  dd = 1;
                  mm = mm+1;
               }else{
                  dd = dd+1;
               }
            }
         }
         
         if(mm == 12){
            yy = yy+1;
            mm = 0;
            dd = 1;
         }
         
         console.log("yy : "+yy);
         console.log("mm : "+mm);
         console.log("dd : "+dd);
         
         var calcDate = (yy+"-"+(mm+1)+"-"+dd);
         console.log(calcDate);
         banDates.splice(banDates.indexOf(calcDate),1);
      }
      console.log(banDates);
   }
   </script>
</body>
</html>