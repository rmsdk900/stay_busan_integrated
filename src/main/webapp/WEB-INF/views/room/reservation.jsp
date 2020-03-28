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
.room_reservation_img {
   display: inline-block;
   width: 25%;
}

.FilledImg {
   width: 100%;
   height: 100%;
}
.room_reservation_wrapper{
   margin-left:10%;
}

.btnSubmitRes, .btnCancelRes {
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  width:15%;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.btnSubmitRes:hover, .btnCancelRes:hover{
  background-color: #39ace7;
}
</style>
<c:if test="${!empty AllInfo}">
   <div class="room_reservation_wrapper" style="margin-top:7%;">
      <div>
         <h4>예약한 방 : <c:out value="${AllInfo.room.r_name}"/></h4>
         <span class="room_reservation_img">
            <img style="width:250px; height:150px;" class="FilledImg" src="${pageContext.request.contextPath}/displayFile?fileName=${AllInfo.roomImg.r_i_fullName}" alt="방 사진"/>
         </span>
      </div>
      
      <hr/>
      <div>
         <h4>예약자 명 : <c:out value="${AllInfo.booker}"/></h4>
      </div>
      <br/>
      <div>
         <h5>체크인 : 
         <fmt:formatDate value="${AllInfo.yeyag.b_date_from}" pattern="yyyy.MM.dd"/>
         &nbsp;
         <fmt:formatDate value="${AllInfo.room.r_checkin}" pattern="a hh 시 mm 분"/>
         </h5>
         
         <h5>체크아웃 :
         <fmt:formatDate value="${AllInfo.yeyag.b_date_to}" pattern="yyyy.MM.dd"/>
         &nbsp;
         <fmt:formatDate value="${AllInfo.room.r_checkout}" pattern="a hh 시 mm 분"/>
         </h5>
      </div>
      <hr/>
      
      <div>
         <h4>예약 인원 : <c:out value="${AllInfo.yeyag.b_guest}"/>명</h4>
      </div>
      <div>
         <h5>결제 금액 : 
         <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${AllInfo.yeyag.b_total_price}" />원
         </h5>
      </div>
      <!-- 결제 후 잔액 -->
      <div>
         <h5>결제 후 잔액 :
         <c:set var="result" value="${userInfo.u_balance - AllInfo.yeyag.b_total_price}" />
         <c:choose>
            <c:when test="${result >= 0}">
               <fmt:formatNumber type="currency" value="${result}" />원
            </c:when>
            <c:otherwise>
               잔액이 부족합니다.
            </c:otherwise>
         </c:choose>
         </h5>
         
      </div>
      <hr/>
      <div>
         <form id="bookingRoomSubmit" action="bookingRoomSubmit" method="post">
            <div>
               <label>
                  <input type="checkbox" id="checkOneMore"/>
                  상기 결제 내용을 다 확인하였으며, 이에 대한 책임은 게스트에게 있습니다.
               </label>
               
            </div>
            <div style="margin-top:3%;">
               <button type="button" id="btnSubmit" class="btnSubmitRes">결제</button>
               <button type="button" id="btnCancel" class="btnCancelRes">취소</button>
            </div>         
         </form>
      </div>
      
   </div>
</c:if>
<script>
   $(function(){
      // 잔액이 부족하면 버튼 비활성화
      var result = '${result}';
      if(result < 0){
         $("#btnSubmit").attr("disabled", true);
      }
   });
   // 결제 취소
   $("#btnCancel").on("click", function(){
      if(confirm("결제를 취소하시겠습니까?")){
         alert("결제를 취소하셨습니다.");
         location.href="${path}/room/detail?r_no=${AllInfo.yeyag.r_no}";
      }
   });
   //결제 보내기
   $("#btnSubmit").on("click",function(){
      var isChecked = $("#checkOneMore").is(":checked");
      // 체크 확인
      if(isChecked){
         var str = "<input type='hidden' name='r_no' value='${AllInfo.yeyag.r_no}'/>";
         str += "<input type='hidden' name='u_no' value='${AllInfo.yeyag.u_no}' />";
         str += "<input type='hidden' name='date_from_dummy' value='${AllInfo.yeyag.date_from_dummy}' />";
         str += "<input type='hidden' name='date_to_dummy' value='${AllInfo.yeyag.date_to_dummy}' />";
         str += "<input type='hidden' name='b_guest' value='${AllInfo.yeyag.b_guest}' />";
         str += "<input type='hidden' name='b_total_price' value='${AllInfo.yeyag.b_total_price}' />";
         $("#bookingRoomSubmit").append(str);
         $("#bookingRoomSubmit").submit();
      }else{
         alert("예약 사항을 꼼꼼히 확인해주세요!");
         $("#checkOneMore").focus();
      }
   });
</script>
<%@ include file="../common/footer.jsp" %>