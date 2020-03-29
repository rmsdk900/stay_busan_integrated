<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


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
.room_imgs {
   display: grid;
   grid-template-columns: auto auto auto;
   width: 100%;
}

.room_img_primary {
   width: 600px;
   height: 600px;
   overflow: hidden;
}

.room_img_etc {
   overflow: hidden;
}

.room_img_third {
   overflow: hidden;
}

.room_img_primary img {
   transform: scale(1);
   transition: .3s;
}

.room_img_primary:hover img {
   transform: scale(1.1);
}

.room_img_etc {
   width: 300px;
   height: 300px;
}

.room_img_etc img {
   transform: scale(1);
   transition: .3s;
}

.room_img_etc:hover img {
   transform: scale(1.1);
}

.room_host_img {
   width: 100px;
   height: 100px;
   margin-top:1%;
   margin-bottom:1%;
}

.FilledImg {
   width: 100%;
   height: 100%;
   
}

.room_primary_facility {
   padding-left: 0;
   
}

.room_primary_facility li {
   float:left;
   margin-right: 20px;
   margin-bottom: 10px;
}

.room_reservation_people_message {
   display: none;
}

.text_red {
   color: red;
}

.text_green {
   color: green;
}
</style>
<!-- 별점 관련 -->
<style>
/* 평균 별점관련 */
.avgStarL1, .avgStarL2, .avgStarL3, .avgStarL4, .avgStarL5 {
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

.avgStarR1, .avgStarR2, .avgStarR3, .avgStarR4, .avgStarR5 {
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

.avgStarL1.on, .avgStarL2.on, .avgStarL3.on, .avgStarL4.on, .avgStarL5.on
   {
   background-position: 0 0;
}

.avgStarR1.on, .avgStarR2.on, .avgStarR3.on, .avgStarR4.on, .avgStarR5.on
   {
   background-position: -15px 0;
}

/* 별점 처리 */
.starL1, .starL2, .starL3, .starL4, .starL5 {
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

.starR1, .starR2, .starR3, .starR4, .starR5 {
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

.starL1.on, .starL2.on, .starL3.on, .starL4.on, .starL5.on {
   background-position: 0 0;
}

.starR1.on, .starR2.on, .starR3.on, .starR4.on, .starR5.on {
   background-position: -15px 0;
}
</style>
<!-- 좋아요 버튼 -->
<style>
.room_like {
   width: 50px;
   height: 50px;
   background-image: url("/resources/img/jjim.png");
   background-position: center;
   background-size: 50px 50px;
}

.room_like:hover {
	cursor: pointer;
}

.room_like.on {
   width: 50px;
   height: 50px;
   background-image: url("/resources/img/jjim-on.png");
   background-position: center;
   background-size: 50px 50px;
}
</style>
<!-- roomInfo -->

<!-- roomDIV -->
<style>
.room {
   width: 83%;
   margin: 0 auto;
}

.room_imgs {
   border: 1px solid skyblue;
}

.msgBtn {
   background-color: #fff;
   border: none;
   color: #56baed;
   padding: 5px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   text-transform: uppercase;
   font-size: 15px;
   height: 48px;
   width: 200px;
   -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   margin-top: 15px;
   margin-left: 21%;
   -webkit-transition: all 0.3s ease-in-out;
   -moz-transition: all 0.3s ease-in-out;
   -ms-transition: all 0.3s ease-in-out;
   -o-transition: all 0.3s ease-in-out;
   transition: all 0.3s ease-in-out;
}

.msgBtn:hover {
   background-color: #39ace7;
   color: white;
}

.msgBtn2, .room_primary_modify, .room_amenity_modify_btn,
   .room_primary_modify_submit, .room_primary_modify_cancel,
   .room_amenity_modify_submit, .room_amenity_modify_cancel {
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
   width: 200px;
   -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   margin: 5px;
   -webkit-transition: all 0.3s ease-in-out;
   -moz-transition: all 0.3s ease-in-out;
   -ms-transition: all 0.3s ease-in-out;
   -o-transition: all 0.3s ease-in-out;
   transition: all 0.3s ease-in-out;
}

.msgBtn2:hover, .room_primary_modify:hover, .room_amenity_modify_btn:hover
   {
   background-color: #39ace7;
}
</style>

<style>
.room_reservation{
   background-color:#56baed;
   padding:30px;
   border-radius: 30px;
   align:center;
   -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   -webkit-border-radius: 30px;
}
</style>

<style>
.room_reservation_choose_date {
   background-color: #fff;
   border: none;
   color: #56baed;
   padding: 5px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   text-transform: uppercase;
   font-size: 15px;
   height: 48px;
   width: 70px;
   -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   margin: 5px 20px 40px 20px;
   -webkit-transition: all 0.3s ease-in-out;
   -moz-transition: all 0.3s ease-in-out;
   -ms-transition: all 0.3s ease-in-out;
   -o-transition: all 0.3s ease-in-out;
   transition: all 0.3s ease-in-out;
}

.room_reservation_submit {
   background-color: #fff;
   border: none;
   color: #56baed;
   padding: 5px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   text-transform: uppercase;
   font-size: 15px;
   height: 48px;
   width: 200px;
   -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   margin-left: 21%;
   -webkit-transition: all 0.3s ease-in-out;
   -moz-transition: all 0.3s ease-in-out;
   -ms-transition: all 0.3s ease-in-out;
   -o-transition: all 0.3s ease-in-out;
   transition: all 0.3s ease-in-out;
}

.room_reservation_submit:hover {
   background-color: #39ace7;
   color: white;
}

#startDate, #endDate {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 12px;
   width: 45%;
   height: 30px;
   border: 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
}

#b_guest {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 12px;
   width: 93%;
   height: 30px;
   border: 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
}

.room_imgs_more {
   display:flex;
   justify-content: flex-start;
   
}

#roomPicturesModalBtn {
   background-color: #56baed;
   border: none;
   color: white;
   padding: 5px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   text-transform: uppercase;
   font-size: 15px;
   height: 60px;
   width: 150px;
   -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   margin-top: 10px;
   -webkit-transition: all 0.3s ease-in-out;
   -moz-transition: all 0.3s ease-in-out;
   -ms-transition: all 0.3s ease-in-out;
   -o-transition: all 0.3s ease-in-out;
   transition: all 0.3s ease-in-out;
   -webkit-transition: all 0.3s ease-in-out;
   margin-right: 10px;
}

#modPictureBtn {
   background-color: #56baed;
   border: none;
   color: white;
   padding: 5px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   text-transform: uppercase;
   font-size: 15px;
   height: 60px;
   width: 150px;
   -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   margin-top: 10px;
   -webkit-transition: all 0.3s ease-in-out;
   -moz-transition: all 0.3s ease-in-out;
   -ms-transition: all 0.3s ease-in-out;
   -o-transition: all 0.3s ease-in-out;
   transition: all 0.3s ease-in-out;
   -webkit-transition: all 0.3s ease-in-out;
   
}

#roomPicturesModalBtn:hover, #modPictureBtn:hover {
   background-color: #39ace7;
}

.room_description_modify {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 12px;
   width: 30%;
   height: 80px;
   border: 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
}

.room_primary_title_modify {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 12px;
   width: 20%;
   height: 40px;
   border: 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
}


</style>



<c:if test="${!empty roomInfo}">
   <div class="room">
      <div class="rImgWrap">
         <div class="room_imgs">
            <div class='room_img_primary' onclick="openSlide"></div>
            <div class='room_img_second'></div>
            <div class='room_img_third'></div>
         </div>
         <!-- 모달 연결 버튼 -->
         <div class="room_imgs_more">
         	<button type="button" data-toggle="modal" data-target="#roomPicturesModal" id="roomPicturesModalBtn">사진 보기</button>
            <c:if test="${roomInfo.roomVO.u_no == userInfo.u_no}">
               <button type="button" data-toggle="modal" data-target="#modPicture" id="modPictureBtn">   사진 변경</button>
            </c:if>
              
         </div>
         
         <%@ include file="./pictureModal.jsp" %>
         <!-- 사진 변경 모달 -->
         <%@ include file="./modPicture.jsp" %>
         
      </div>
      <hr/>
      <div class="room_wrapper">
         <div class="room_primary">
            <div style="display:flex;align-items: center;">
               <h2 class="room_primary_title" style="display:inline-block;margin-right:1%;" >${roomInfo.roomVO.r_name}</h2>
               <!-- 좋아요 버튼 -->
               <div id="btn_room_like" class="room_like" style="display:inline-block;padding:auto 0;"></div>
               <input type="text" name="r_name" value="${roomInfo.roomVO.r_name}" class="room_primary_title_modify" />
            </div>
            <div>
               <div class="room_host_img">
               
               </div>
               <div>
                  <h4>호스트 @${roomInfo.hostVO.u_name}</h4>
                  <c:if test="${roomInfo.hostVO.u_type == 2 or roomInfo.hostVO.u_type == 3}" >
                     <img src="${pageContext.request.contextPath}/resources/img/vip.png" style="width:30px;height:30px;" />   
                  </c:if>
               </div>
               
            </div>
            <div>
               <h4>주소 : ${roomInfo.roomVO.r_addr_main}</h4>
            </div>
            <div>
               <ul class="room_primary_facility" style="list-style:none;">
                  <li class="room_primary_guests"><img style="width:30px;height:30px; margin:10px 10px 10px 0;" src="${path}/resources/img/icon/human.png">
                  인원 : <span>${roomInfo.roomVO.r_guests}</span></li>
                  
                  <li class="room_primary_bedroom"><img style="width:30px;height:30px; margin:10px 10px 10px 10px;" src="${path}/resources/img/icon/bedroom.png">
                  침실 : <span>${roomInfo.roomVO.r_bedroom}</span></li>
                  
                  <li class="room_primary_bed"><img style="width:30px;height:30px; margin:10px 10px 10px 10px;" src="${path}/resources/img/icon/bed.png">
                  침대 : <span>${roomInfo.roomVO.r_bed}</span></li>
                  
                  <li class="room_primary_bath"><img style="width:30px;height:30px; margin:10px 10px 10px 10px;" src="${path}/resources/img/icon/bathroom.png">
                  욕실 : <span>${roomInfo.roomVO.r_bath}</span></li>
               </ul>
               
               <ul class="room_primary_facility_modify" style="list-style:none;">
                  <li>
                     인원 : <input style="width: 15%;" class="room_primary_guests_modify" type="number" name="r_guests" min="1" step="1" value="${roomInfo.roomVO.r_guests}" />
                  </li>
                  <li>
                     침실 : <input style="width: 15%;" class="room_primary_bedroom_modify" type="number" name="r_bedroom" min="0" step="1" value="${roomInfo.roomVO.r_bedroom}" />
                  </li>
                  <li>
                     침대 : <input style="width: 15%;" class="room_primary_bed_modify" type="number" name="r_bed" min="0" step="1" value="${roomInfo.roomVO.r_bed}" /> 
                  </li>
                  <li>
                     욕실 : <input style="width: 15%;" class="room_primary_bath_modify" type="number" name="r_bath" min="0" step="1" value="${roomInfo.roomVO.r_bath}" />
                  </li>
               </ul>
            </div>
            
         </div>
         
         <hr style="clear:both;"/>
         <div >
            <div>
               <div class="room_description">
               	<h4>방 설명 :</h4><br/>
               	<h5><c:out value="${roomInfo.roomVO.r_desc}" escapeXml="true"/></h5>
               </div>
               <textarea class="room_description_modify" name="r_desc">${roomInfo.roomVO.r_desc}</textarea>
            </div>
            <div>
               <button type="button" class="msgBtn2" data-toggle="modal" data-target="#roomMessageModal" data-whatever="${roomInfo.hostVO.u_name}">
                  호스트에게 쪽지 보내기
               </button>
            </div>
         </div>
         <c:if test="${roomInfo.roomVO.u_no == userInfo.u_no}">
               <div class="room_reservation_per_price_modify">
                  1박당 1인 가격 : <input style="width: 15%;"type= "number" name="r_price" value="${roomInfo.roomVO.r_price}" 
                  class="r_price" step="100" min="0"/> 원
               </div>
               <div class="room_primary_modify_btn">
                  <button type="button" class="room_primary_modify" >
                     방 기본 정보 수정
                  </button>
                  <button type="button" class="room_primary_modify_submit">
                     수정
                  </button>
                  <button type="button" class="room_primary_modify_cancel">
                     취소
                  </button>
               </div>
            </c:if>
         <hr/>
         <div class="room_amenities">
            <h4>편의시설</h4>
            <ul style="list-style:none; float:left;">
               <li class="room_amenity wifi"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/wifi.png">
               와이파이 : <span>${roomInfo.amenityVO.a_wifi == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify">
                 <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/wifi.png"> 와이파이 : 
                  <select class="wifi_available" name="a_wifi">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_wifi == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_wifi == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity heating"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/heating.png">
               난방 : <span>${roomInfo.amenityVO.a_heating == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify">
                 <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/heating.png"> 난방 : 
                  <select class="heating_available" name="a_heating">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_heating == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_heating == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity TV"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/tv.png">
               TV : <span>${roomInfo.amenityVO.a_TV == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                 <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/tv.png"> TV : 
                  <select class="TV_available" name="a_TV">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_TV == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_TV == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity kitchen"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/kitchen.png">
               주방 : <span>${roomInfo.amenityVO.a_kitchen == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/kitchen.png"> 주방 : 
                  <select class="kitchen_available" name="a_kitchen">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_kitchen == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_kitchen == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity hairdryer"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/hairdryer.png">
               헤어 드라이어 : <span>${roomInfo.amenityVO.a_hairdryer == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/hairdryer.png"> 헤어 드라이어 : 
                  <select class="hairdryer_available" name="a_hairdryer">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_hairdryer == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_hairdryer == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity iron"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/iron.png">
               다리미 : <span>${roomInfo.amenityVO.a_iron == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/iron.png"> 다리미 : 
                  <select class="iron_available" name="a_iron">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_iron == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_iron == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
            </ul>
            <ul style="list-style:none; float:left;">
               <li class="room_amenity hanger"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/hanger.png">
               옷걸이 : <span>${roomInfo.amenityVO.a_hanger == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/hanger.png"> 옷걸이 : 
                  <select class="hanger_available" name="a_hanger">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_hanger == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_hanger == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               
               <li class="room_amenity towel"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/towel.png">
               수건 : <span>${roomInfo.amenityVO.a_towel == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify">
                  <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/towel.png"> 수건 : 
                  <select class="towel_available" name="a_towel">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_towel == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_towel == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity elevator"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/elevator.png">
               엘리베이터 : <span>${roomInfo.amenityVO.a_elevator == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/elevator.png"> 엘리베이터 : 
                  <select class="elevator_available" name="a_elevator">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_elevator == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_elevator == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity parking"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/parking.png">
               주차가능 : <span>${roomInfo.amenityVO.a_parking == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/parking.png"> 주차가능 : 
                  <select class="parking_available" name="a_parking">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_parking == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_parking == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity washer"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/washer.png">
               세탁기 : <span>${roomInfo.amenityVO.a_washer == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/washer.png"> 세탁기 : 
                  <select class="washer_available" name="a_washer">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_washer == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_washer == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity cookware"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/cookware.png">
               조리기구 : <span>${roomInfo.amenityVO.a_cookware == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/cookware.png"> 조리기구 : 
                  <select class="cookware_available" name="a_cookware">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_cookware == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_cookware == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
            </ul>
            <ul style="list-style:none; float:left;">
               <li class="room_amenity refri"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/refri.png">
               냉장고 : <span>${roomInfo.amenityVO.a_refri == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                  <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/refri.png"> 냉장고 : 
                  <select class="refri_available" name="a_refri">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_refri == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_refri == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity burner"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/burner.png">
               가스레인지 및 버너 : <span>${roomInfo.amenityVO.a_burner == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                 <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/burner.png"> 가스레인지 및 버너 : 
                  <select class="burner_available" name="a_burner">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_burner == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_burner == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity dish"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/dishes.png">
               식기 : <span>${roomInfo.amenityVO.a_dish == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
               <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/dishes.png"> 식기 : 
                  <select class="dish_available" name="a_dish">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_dish == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_dish == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity micro"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/microwave.png">
               전자레인지 : <span>${roomInfo.amenityVO.a_micro == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/microwave.png"> 전자레인지 : 
                  <select class="micro_available" name="a_micro">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_micro == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_micro == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
               <li class="room_amenity aircon"><img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/aircon.png">
               에어컨 : <span>${roomInfo.amenityVO.a_aircon == 1 ? '있음' : '없음' }</span></li>
               <li class="room_amenity_modify" >
                 <img style="width:30px;height:30px; margin:10px;" src="${path}/resources/img/icon/aircon.png"> 에어컨 : 
                  <select class="aircon_available" name="a_aircon">
                     <option value="1" <c:out value="${roomInfo.amenityVO.a_aircon == 1 ? 'selected' : '' }"/>>있음</option>
                     <option value="0" <c:out value="${roomInfo.amenityVO.a_aircon == 0 ? 'selected' : '' }"/>>없음</option>
                  </select>
               </li>
            </ul>
            <br style="clear:both;"/>
            <c:if test="${roomInfo.roomVO.u_no == userInfo.u_no}">
               <div>
                  <button type="button" class="room_amenity_modify_btn" >
                     방 편의 정보 수정
                  </button>
                  <button type="button" class="room_amenity_modify_submit" >
                     수정
                  </button>
                  <button type="button" class="room_amenity_modify_cancel" >
                     취소
                  </button>
               </div>
            </c:if>
         </div>
         
         <hr />
         
         <div class="room_host_description" >
            <div>
               <h4>
                  호스트 : ${roomInfo.hostVO.u_name}님
                  <c:if test="${roomInfo.hostVO.u_type == 2 or roomInfo.hostVO.u_type == 3}" >
                     <img src="${pageContext.request.contextPath}/resources/img/vip.png" style="width:20px;height:20px;"/>
                  </c:if>
               </h4>
            </div>
            <div>
               <h6>회원가입 : <fmt:formatDate value="${roomInfo.hostVO.u_regdate}" pattern="yyyy년 MM월"/></h6>
            </div>
            
            <div>
               <p> 호스트 자기 소개 : </p>
               <p><c:out value="${roomInfo.hostVO.u_introduce}" escapeXml="true"/></p>
            </div>      
            
         </div>
         <hr/>
         <%@ include file="../comment/comment_detail.jsp" %>
         <!-- deleted된 거 안보이게 -->
         <c:if test="${roomInfo.roomVO.r_deleted eq 0}">
            <!-- 예약 폼 -->
           <!-- 예약 폼 -->
            <div class="room_reservation" style="position: fixed; right: 0; bottom: 0; margin-right:10%; margin-bottom:5%;">
               <form id="bookingForm" action="${pageContext.request.contextPath}/book/bookingRoom" method="post">
                  <input type="hidden" name="r_no" value="${roomInfo.roomVO.r_no}" />
                  <!-- 로그인 한 사람의 번호를 임의로 넣어놓음. -->
                  <input type="hidden" name="u_no" value="${userInfo.u_no}" />
                  <div>
                     <div>
                        <span class="room_reservation_per_price">${roomInfo.roomVO.r_price}</span>
                        <span class="room_reservation_days">/ 0 박</span>
                     </div>
                     <div class="room_reservation_star">
                        <div class="starRev">
                           <span class="avgStarL1"></span>
                           <span class="avgStarR1"></span>
                           <span class="avgStarL2"></span>
                           <span class="avgStarR2"></span>
                           <span class="avgStarL3"></span>
                           <span class="avgStarR3"></span>
                           <span class="avgStarL4"></span>
                           <span class="avgStarR4"></span>
                           <span class="avgStarL5"></span>
                           <span class="avgStarR5"></span>
                        </div>
                     </div>
                     <br/>
                     <br/>
                     <div>
                        <span class="star_float"> 0</span>
                        <span>점</span>
                        <span class="room_reservation_total">(후기 0개)</span>
                     </div>
                     <hr/>
                  </div>
                  <div>
                     <div>날짜</div>
                     <div style="margin:0 auto;">
                        <input type="text" id="startDate" name="date_from_dummy" readonly>&nbsp;-&nbsp;<input type="text" id="endDate" name="date_to_dummy" readonly>
                        <div class="room_reservation_how_many"> 숙박 중 : 
                           <span class="room_reservation_how_many_people">0</span>
                            / 
                           <span class="room_reservation_how_many_total">${roomInfo.roomVO.r_guests}</span>
                            명
                        </div>
                     </div>
                  </div>
                  <div>
                     <div>인원</div>
                     <div class="room_reservation_people">
                        <input id="b_guest" type="number" name="b_guest" min="0" max="${roomInfo.roomVO.r_guests}" step="1"/> 명
                        <div class="room_reservation_people_message "></div>   
                     </div>
                  </div>
                  <div class="room_reservation_price" style="display:none;">
                     <div>합계</div>
                     <div class="room_reservation_price_real">[총 가격]</div>
                  </div>
                  <input type="hidden" name="b_total_price" id="b_total_price" />
                  
                  <div>
                     <input type="button" class="room_reservation_submit"value="예약하기" style="display:none;"/>
                  </div>
               </form>
               <div class="room_message">
                  <c:if test="${!empty userInfo}">
                     <button type="button" class="msgBtn" data-toggle="modal"
                        data-target="#roomMessageModal"
                        data-whatever="${roomInfo.hostVO.u_name}">호스트에게 쪽지 보내기
                     </button>

                     
                  </c:if>
               </div>
            </div>
            <%@ include file="./messageModal.jsp"%>
            <br/>
            
            <hr/>
         </c:if>
         
         
      </div>
      
   </div>
   
   
   <script>
      // 필요 변수들 설정
      var r_no = ${roomInfo.roomVO.r_no};   
      var owner = ${roomInfo.roomVO.u_no};
      var login_u_no = ${!empty userInfo ? userInfo.u_no : 0};
      var login_u_name = "${!empty userInfo ? userInfo.u_name : ''}";
      // Onload 되었을 때
      $(function(){
         
         // 가리기 부터
         $(".room_primary_title_modify").hide();
         $(".room_primary_facility_modify").hide();
         $(".room_primary_modify_submit").hide();
         $(".room_primary_modify_cancel").hide();
         $(".room_description_modify").hide();
         $(".room_reservation_per_price_modify").hide();
         
         $(".room_amenity_modify").hide();
         $(".room_amenity_modify_submit").hide();
         $(".room_amenity_modify_cancel").hide();
         
         $(".room_date_modify_wrapper").hide();
         
         // 좋아요 버튼 상태 받기
         $.post(contextPath+"/room/isLike", {
            u_no: owner,
            r_no: r_no
         }, function(data){
            console.log(data);
            if(data=='YES'){
               $("#btn_room_like").addClass("on");
            }
         });
         
      });
      // 수정에 필요한 것들 보이기
      $(".room_primary_modify").on("click",function(){
         
         $(".room_primary_title_modify").show('slow');
         $(".room_primary_facility_modify").show('slow');
         $(".room_primary_modify_submit").show('slow');
         $(".room_primary_modify_cancel").show('slow');
         $(".room_description_modify").show('slow');
         $(".room_reservation_per_price_modify").show('slow');
         
         $(".room_primary_modify").hide('slow');
         $(".room_primary_title").hide('slow');
         $(".room_primary_facility").hide('slow');
         $(".room_description").hide('slow');
         
      });
      // 취소버튼 눌렀을 때 다시 감추기
      $(".room_primary_modify_cancel").on("click", function(){
         $(".room_primary_title_modify").hide('slow');
         $(".room_primary_facility_modify").hide('slow');
         $(".room_primary_modify_submit").hide('slow');
         $(".room_primary_modify_cancel").hide('slow');
         $(".room_description_modify").hide('slow');
         $(".room_reservation_per_price_modify").hide('slow');
         
         $(".room_primary_modify").show('slow');
         $(".room_primary_title").show('slow');
         $(".room_primary_facility").show('slow');
         $(".room_description").show('slow');
      });
      // 방 기본 정보 수정
      $(".room_primary_modify_submit").on("click", function(){
         
         var r_name = $(".room_primary_title_modify").val();
         var r_guests = $(".room_primary_guests_modify").val();
         var r_bedroom = $(".room_primary_bedroom_modify").val();
         var r_bed = $(".room_primary_bed_modify").val();
         var r_bath = $(".room_primary_bath_modify").val();
         var r_desc = $(".room_description_modify").val();
         var r_price= $(".r_price").val();
         console.log(r_no);
         console.log(r_name);
         console.log(r_guests);
         console.log(r_bedroom);
         console.log(r_bed);
         console.log(r_bath);
         console.log(r_desc);
         console.log(r_price);
         
         $.post(contextPath+"/room/modify", {
            r_no: r_no,
            r_name: r_name,
            r_guests: r_guests,
            r_bedroom: r_bedroom,
            r_bed: r_bed,
            r_bath: r_bath,
            r_desc: r_desc,
            r_price: r_price
         }, function(data){
            console.log(data);
            
            $(".room_primary_title").html(data.r_name);
            $(".room_primary_title_modify").val(data.r_name);
            $(".room_primary_guests span").html(data.r_guests);
            $(".room_primary_guests_modify").val(data.r_guests);
            $(".room_primary_bedroom span").html(data.r_bedroom);
            $(".room_primary_bedroom_modify").val(data.r_bedroom);
            $(".room_primary_bed span").html(data.r_bed);
            $(".room_primary_bed_modify").val(data.r_bed);
            $(".room_primary_bath span").html(data.r_bath);
            $(".room_primary_bath_modify").val(data.r_bath);
            $(".room_description").html(data.r_desc);
            $(".room_description_modify").val(data.r_desc);
            $(".room_reservation_per_price").html(data.r_price);
            $(".r_price").val(data.r_price);
      
            $(".room_primary_title_modify").hide();
            $(".room_primary_facility_modify").hide();
            $(".room_primary_modify_submit").hide();
            $(".room_primary_modify_cancel").hide();
            $(".room_description_modify").hide();
            $(".room_reservation_per_price_modify").hide();
            
            $(".room_primary_modify").show();
            $(".room_primary_title").show();
            $(".room_primary_facility").show();
            $(".room_description").show();
            
         });
         
      });
      
      // 편의시설 정보 수정 창 열기
      $(".room_amenity_modify_btn").on("click",function(){
         $(".room_amenity").hide('slow');
         $(".room_amenity_modify").show('slow');
         
         $(".room_amenity_modify_btn").hide('slow');
         $(".room_amenity_modify_submit").show('slow');
         $(".room_amenity_modify_cancel").show('slow');
      });
      // 취소버튼 클릭 시
      $(".room_amenity_modify_cancel").on("click",function(){
         $(".room_amenity").show('slow');
         $(".room_amenity_modify").hide('slow');
         
         $(".room_amenity_modify_btn").show('slow');
         $(".room_amenity_modify_submit").hide('slow');
         $(".room_amenity_modify_cancel").hide('slow');
      });
      // 편의정보 수정 요청
      $(".room_amenity_modify_submit").on("click",function(){
         var a_wifi = $(".wifi_available").val();
         var a_heating = $(".heating_available").val();
         var a_TV = $(".TV_available").val();
         var a_kitchen = $(".kitchen_available").val();
         var a_hairdryer = $(".hairdryer_available").val();
         var a_iron = $(".iron_available").val();
         var a_hanger = $(".hanger_available").val();
         var a_towel = $(".towel_available").val();
         var a_elevator = $(".elevator_available").val();
         var a_parking = $(".parking_available").val();
         var a_washer = $(".washer_available").val();
         var a_cookware = $(".cookware_available").val();
         var a_refri = $(".refri_available").val();
         var a_burner = $(".burner_available").val();
         var a_dish = $(".dish_available").val();
         var a_micro = $(".micro_available").val();
         var a_aircon = $(".aircon_available").val();
         
         $.post(contextPath+"/room/amenities", {
            r_no: r_no,
            a_wifi: a_wifi,
            a_heating: a_heating,
            a_TV: a_TV,
            a_kitchen: a_kitchen,
            a_hairdryer: a_hairdryer,
            a_iron: a_iron,
            a_hanger: a_hanger,
            a_towel: a_towel,
            a_elevator: a_elevator,
            a_parking: a_parking,
            a_washer: a_washer,
            a_cookware: a_cookware,
            a_refri: a_refri,
            a_burner: a_burner,
            a_dish: a_dish,
            a_micro: a_micro,
            a_aircon: a_aircon
         }, function(data){
            console.log(data);
            
            location.reload();
         });
         
      });
      
      
      
      // 배경 이미지들 가져오기 
      $.getJSON(contextPath+"/getImgs/"+r_no, function(data){
         // 첨부파일 목록 = data
         /* console.log(data); */
         
         for(var i=0;i<data.length;i++){
            var fileInfo = getFileInfo(data[i]);
            /* console.log(fileInfo); */
            
            if(i == 0){
               var html = "";
               html += "<img src='"+fileInfo.imgSrc+"' alt='배경 사진"+(i+1)+"' class='FilledImg' onclick='openSlide("+i+")' />";
               $(".room_img_primary").html(html);   
            } else if(i==1 || i==2) {
               var html = "<div ";
               html += "class='room_img_etc' ";
               html += ">";
               html += "<img src='"+fileInfo.imgSrc+"' alt='배경 사진"+(i+1)+"' class='FilledImg' onclick='openSlide("+i+")' />";
               html += "</div>";
               $(".room_img_second").append(html);
            } else if(i==3 || i==4){
               var html = "<div ";
               html += "class='room_img_etc' ";
               html += ">";
               html += "<img src='"+fileInfo.imgSrc+"' alt='배경 사진"+(i+1)+"' class='FilledImg' onclick='openSlide("+i+")' />";
               html += "</div>";
               $(".room_img_third").append(html);
            }else {
               break;
            }
            
            
         }
         
         for(var i=0;i<data.length;i++){
            var fileInfo = getFileInfo(data[i]);
            /* console.log(fileInfo); */
            
            var olli = "";
            olli += "<li data-target='#carousel-example-generic' " +
                  "data-slide-to='"+i+"' ";
            if(i==0){
               olli += "class='active' ";
            }
            olli +=   "></li>";
            
            var html = "<div class='carousel-item ";
            if (i==0){
               html += "active"; 
            }
            html += "' >";
            html += "<img src='"+fileInfo.imgSrc+"' alt='"+(i+1)+"번째 사진' class='w-50'>";
            html += "</div>";
            $(".carousel-indicators").append(olli);
            $(".carousel-inner").append(html);
            
         }
      });
      // 호스트 이미지 들고 오기
      $.getJSON(contextPath+"/getHostImg/"+r_no, function(data){
         
    	  if(data[0] != null){
    		  var fileInfo = getFileInfo(data[0]);
    	         /* console.log(fileInfo); */
    	         
    	         var html = "";
    	         html += "<a href='"+contextPath+"/user/hosting?u_no="+owner+"'>";
    	         html += "<img src='"+fileInfo.imgSrc+"' alt='호스트 사진' class='FilledImg' />";
    	         html += "</a>";
    	         $(".room_host_img").append(html);
    	  }else{
    		  var html = "";
    		  var profileSrc = contextPath+"/resources/img/person.png";
 	         html += "<a href='"+contextPath+"/user/hosting?u_no="+owner+"'>";
 	         html += "<img src='"+profileSrc+"' alt='호스트 사진' class='FilledImg' />";
 	         html += "</a>";
 	         $(".room_host_img").append(html);
    	  }
      });
      // 사진 클릭했을 때 그 때부터 슬라이드 시작
      function openSlide(i){
         console.log(i);
         $('#roomPicturesModal').modal('show');
         $('.carousel').carousel(i);
      }
      
      // 인원 입력 시 처리될 함수
      $("#b_guest").on("input", function(){
         var cnt = $(this).val();
         if (cnt != null && cnt != ''){
            cnt = parseInt(cnt);
            var booked = parseInt($(".room_reservation_how_many_people").html());
            var total = parseInt($(".room_reservation_how_many_total").html());
            console.log("입력 인원 : "+cnt);
            console.log("예약 및 숙박 인원 : "+booked);
            /* console.log("총 숙박 가능 인원 : "+total); */
            /* console.log("입력 인원 형식 : "+typeof cnt); */
            console.log("넣으려는 인원 : "+(cnt+booked));
            
            
            if(total < (cnt+booked)){
               var message = "<span>최대 숙박 가능한 인원을 초과했습니다.</span>";
               
               $(".room_reservation_people_message").addClass("text_red");
               if($(".room_reservation_people_message").hasClass("text_green")){
                  $(".room_reservation_people_message").removeClass("text_green");
               }
               $(".room_reservation_people_message").html(message);   
               $(".room_reservation_people_message").show("slow");   
               
               $(".room_reservation_choose_date").show("slow");
               $(".room_reservation_price").hide("slow");
               $(".room_reservation_submit").hide("slow");
               $(".room_reservation_submit").attr("disabled", true);
            }else if(cnt == 0){
               var message = "<span>0명은 입력할 수 없습니다.</span>";
               $(".room_reservation_people_message").addClass("text_red");
               if($(".room_reservation_people_message").hasClass("text_green")){
                  $(".room_reservation_people_message").removeClass("text_green");
               }
               $(".room_reservation_people_message").html(message);   
               $(".room_reservation_people_message").show("slow");      
               
               $(".room_reservation_choose_date").show("slow");
               $(".room_reservation_price").hide("slow");
               $(".room_reservation_submit").hide("slow");
               $(".room_reservation_submit").attr("disabled", true);
            }else if(cnt < 0){
               var message = "<span>0명 이하는 입력할 수 없습니다.</span>";
               $(".room_reservation_people_message").addClass("text_red");
               if($(".room_reservation_people_message").hasClass("text_green")){
                  $(".room_reservation_people_message").removeClass("text_green");
               }
               $(".room_reservation_people_message").html(message);   
               $(".room_reservation_people_message").show("slow");      
               
               $(".room_reservation_choose_date").show("slow");
               $(".room_reservation_price").hide("slow");
               $(".room_reservation_submit").hide("slow");
               $(".room_reservation_submit").attr("disabled", true);
            }else {
               var message = "<span>예약 가능합니다.</span>";
               $(".room_reservation_people_message").addClass("text_green");
               if($(".room_reservation_people_message").hasClass("text_red")){
                  $(".room_reservation_people_message").removeClass("text_red");
               }
               $(".room_reservation_people_message").html(message);   
               $(".room_reservation_people_message").show("slow");
               
               // 총 금액 계산하기
               calcTotalPrice(cnt);
               // 버튼 바꾸기 
               $(".room_reservation_choose_date").hide();
               $(".room_reservation_price").show("slow");
               $(".room_reservation_submit").show("slow");
               $(".room_reservation_submit").attr("disabled", false);
               
            }
         }else {
            $(".room_reservation_people_message").hide("slow");
            
            $(".room_reservation_choose_date").show("slow");
            $(".room_reservation_price").hide("slow");
            $(".room_reservation_submit").hide("slow");
            $(".room_reservation_submit").attr("disabled", true);
         }
         
      });
      // 총 가격 계산
      function calcTotalPrice(cnt){
         var per_price = $(".room_reservation_per_price").html();
         var nights = $(".room_reservation_days span").html();
         var total_price = per_price*nights*cnt;
         console.log("이 방 최종 가격 : "+total_price);
         $(".room_reservation_price_real").html("￦"+total_price);
         $("#b_total_price").val(total_price);
      }
      // 결제 보내기. 
      $(".room_reservation_submit").on("click",function(){
         var b_guest = $("#b_guest").val();
         var date_from = $("#startDate").val();
         var date_to = $("#endDate").val();
         var total_price = $("#b_total_price").val();
         
         if(date_from == null || date_from == ''){
            alert("숙박 시작 날짜를 입력해주세요!");
            $("#startDate").focus();
            return;
         }
         if(date_to == null || date_to == ''){
            alert("숙박 종료  날짜를 입력해주세요!");
            $("#endDate").focus();
            return;
         }
         if(b_guest == null || b_guest == ''){
            alert("숙박 인원을 입력해주세요!");
            $("#b_guest").focus();
            return;
         }
         if(total_price == null || total_price == ''){
            return;
         }
         
         $("#bookingForm").submit();
         
      });
      // 방 기본 정보 수정 number 제한
      $(".room_primary_facility_modify").on("keydown", "input[type=number]", function(e){
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
      
      // 돈 입력 양식 제한
      $(".room_reservation_per_price_modify").keydown(function(e){
         if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 110 || e.keyCode == 107 || e.keyCode == 189 || e.keyCode == 187){
               return false;              
           }
       });
      
      // 예약 인원 숫자 제한
      $("#b_guest").on("keydown", function(e){
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
      
      // 좋아요 버튼 클릭
      $("#btn_room_like").on("click",function(){
    	  if(login_u_no == "0"){
    		  alert("로그인 후 이용해주세요!");
    		  return;
    	  }
         // 이미 클릭!
         if($(this).hasClass("on")){
            
            $.post(contextPath+"/room/dislike",{
               u_no: login_u_no,
               r_no: r_no,
            },function(data){
               console.log(data);
               
               $("#btn_room_like").removeClass("on");
            });
         }else {
            
            $.post(contextPath+"/room/like", {
               u_no: login_u_no,
               r_no: r_no,
            }, function(data){
               console.log(data);
               $("#btn_room_like").addClass("on");
            });
         }
      });
      
      // 편의시설 있음 없음 css 표시
      $(".room_amenity").each(function(){
        if($(this).find("span").html()=='없음'){
           $(this).css("opacity", "0.45");
        }else {
           $(this).css("font-weight","570");
        }
      });
      
   </script>
   <script src="${pageContext.request.contextPath}/resources/js/comment.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/pictureModal.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/messageModal.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/detailDate.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/modPicture.js"></script>
</c:if>
<%@ include file="../common/footer.jsp" %>