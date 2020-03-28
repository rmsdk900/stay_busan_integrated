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

<style>
.show_wrapper {
   padding: 2%;
}

.show_wrapper_in {
   margin-left: 10%;
}

.mod_my_img_open, .mod_my_img_submit, .mod_my_img_cancel {
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

.show_my_introduce_mod_open, .show_my_introduce_mod_submit,
   .show_my_introduce_mod_cancel {
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

.introducearea, .mod_introducearea {
   -webkit-border-radius: 10px 10px 10px 10px;
   border-radius: 10px 10px 10px 10px;
   background: #fff;
   padding: 5px;
   width: 90%;
   min-height: 200px;
   max-width: 550px;
   position: relative;
   margin-top:20px;
}

#transform{
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
   width: 250px;
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
.mod_my_img_open:hover, .mod_my_img_submit:hover, .mod_my_img_cancel:hover,
.show_my_introduce_mod_open:hover, .show_my_introduce_mod_submit:hover,
   .show_my_introduce_mod_cancel:hover,#transform:hover{
     background-color: #39ace7;
}
   

</style>

<script>
   var u_no = '${myAllInfo.userVO.u_no}';
   var login_u_no = ${!empty userInfo ? userInfo.u_no : 0};
   var login_u_name = "${!empty userInfo ? userInfo.u_name : ''}";
</script>
<!-- 소개 페이지 전체 -->
<div class="show_wrapper">
   <!-- 프로필 사진 + 제목 + 회원가입일 + 소개  -->
   <div class="show_wrapper_in">
      <!-- 프로필 사진 + 제목 + 회원가입일 -->
      <div>
         <!-- 프로필 사진 -->
         <div class="show_my_img" >
         </div>
         <!-- 프로필 사진 변경 -->
         <div class="mod_my_img">
            <input type='file' name="updateMyProfile" id="updateMyProfile" />
            <div>
               <button class="mod_my_img_submit">편집 완료</button>
               <button class="mod_my_img_cancel">취소</button>
            </div>
         </div>
         <c:if test="${myAllInfo.userVO.u_no == userInfo.u_no}">
            <div>
               <input type="button" class="mod_my_img_open" value="편집" />
            </div>
         </c:if>
         <!-- 프로필 제목 + 회원가입일-->
         <div>
            <!-- 프로필 제목 -->
            <div class="show_my_title">
               <h3>안녕하세요. 저는 
                  <c:if test="${userInfo.u_type eq 0 || userInfo.u_type eq 9}">
                     GUEST 
                  </c:if>
                  <c:if test="${userInfo.u_type eq 1}">
                     HOST
                  </c:if>
                 ${myAllInfo.userVO.u_name}입니다.</h3>
                 <c:if test="${userInfo.u_type eq 0 || userInfo.u_type eq 9}">
                     <input type="button" id="transform" value="호스트계정으로 전환 신청"/> 
                  </c:if>
            </div>
            <!-- 회원 가입일 -->
            <div>
               <h5><span>회원 가입: </span>
               <span>
                  <fmt:formatDate value="${myAllInfo.userVO.u_regdate}" pattern="yyyy-MM"/>
               </span>
               </h5>
            </div>
         </div>
      </div>
      <!-- 소개 -->
      <div>
         <div class="show_my_introduce">
            <textarea class="introducearea" style="resize:none;"readonly>${myAllInfo.userVO.u_introduce}</textarea>
            
         </div>
         <div class="show_my_introduce_mod">
            <textarea class="mod_introducearea" style="resize:none;" >${myAllInfo.userVO.u_introduce}</textarea>
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
      <hr/>
   </div>
   
   <%@ include file="./showGuestRooms.jsp" %>
   <%@ include file="../comment/comment_guest.jsp" %>
      
</div>
<!-- 예약 결과 표시 -->
<script>
   var msg = "${msg}";
   console.log(msg);
   if(msg != null){
      if(msg == "P"){
         alert("예약에 성공하셨습니다!");
      }else if(msg == "F"){
         alert("예약에 실패하셨습니다.");
      }
   }
   
   $("#transform").click(function(event) {
       var u_type = ${userInfo.u_type};
       if(u_type == 0){
      	 $("#transformModal").css("display", "flex"); 
       }else{
      	 alert('호스트 전환 신청을 이미 한 계정입니다. 관리자에게 문의하세요.');
       }
       
    });
</script>


<script src="${pageContext.request.contextPath}/resources/js/show.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>


<%@ include file="../common/footer.jsp" %>