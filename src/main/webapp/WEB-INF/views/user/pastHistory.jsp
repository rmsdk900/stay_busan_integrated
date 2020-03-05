<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/header.jsp" %>

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

.btn {
   background-color: #56baed;
   border: none;
   color: white;
   padding: 12px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   text-transform: uppercase;
   font-size: 13px;
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

table tr td{
   padding-right:20px;
   text-align:center;
}

table tr th{
   padding-right:20px;
   text-align:center;
}


</style>



<div style=" margin-left:10%; margin-bottom:10%; margin-top:2%;">
   <img style="width:500px;height:300px;" src="${pageContext.request.contextPath}/user/displayFile?fileName=${history.r_i_fullName}"/>
   
   <h2><br/>${history.r_name}</h2>
   <hr/>
   <div>
      <h5>체크인 : <f:formatDate value="${history.b_date_from}" pattern="yyyy.MM.dd"/> &nbsp;&nbsp;&nbsp;<f:formatDate value="${history.r_checkin}" pattern="a hh:mm"/><br/></h5>
      <h5>체크아웃 : <f:formatDate value="${history.b_date_to}" pattern="yyyy.MM.dd"/> &nbsp;&nbsp;&nbsp;<f:formatDate value="${history.r_checkout}" pattern="a hh:mm"/> <br/></h5>
      <br/>
      <h5>예약 인원 : ${history.b_guest} 명<br/></h5>
      <h5>결제 금액 : ￦ ${history.b_total_price} 원<br/></h5>
   </div>
   <br/>
   <!-- 다시 예약-> 없어진 방이면 버튼 없애기 -->
   <c:if test="${history.r_deleted == 0}">
      <!-- 삭제된 방이면 버튼 안보이게 -->
      <a href="${pageContext.request.contextPath}/room/detail?r_no=${history.r_no}"><input class="btn" type="button" value="다시 예약하러 가기" id="detailRoom"/></a>
   </c:if>
   <br/>
   <div class="checkComment">
   
   <hr/>
   <br/>
   <h3>후기</h3>
   <c:if test="${!empty comment}">
      <c:forEach items="${comment}" var="comment">
         <table>
            <tr>
               <th>작성자</th>
               <th>별점</th>
               <th>날짜</th>
               <th>내용</th>
               <th></th>
            </tr>
            <tr>
               <td>${comment.u_name}</td>
               <td class="c_star">
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
                  </td>
               <td>   
                  <f:formatDate value="${comment.c_regdate}" pattern="yyyy.MM.dd"/>
               </td>
               <td class="content">${comment.c_content}</td>
               <td>
                  <input type="hidden" name="c_no" id="c_no" value="${comment.c_no}"/> 
                  <input class="btn" type="button" value="수정" id="commentModify"/>
                  <input class="btn" type="button" value="삭제" id="commentDelete"/>
                  <input class="btn" type="hidden" name="b_no" id="b_no" value="${comment.b_no}"/>
               </td>
            </tr>
         </table>
         <div class="modifyCommentDiv">
         
         </div>
      </c:forEach>
      
   </c:if>   
   </div>
   <div class="writeComment">
      <c:if test="${empty comment}">
         <form id="writeComment" action="writeComment" method="post">
            <table>
               <tr>
                  <th style="text-align:center;">후기 작성</th>
               </tr>
               <tr>
                  <td class="commentWriteTd">
                     <textarea style="-webkit-border-radius: 5px 5px 5px 5px; border-radius: 5px 5px 5px 5px;" cols=70 rows=10 name="c_content"></textarea>
                     <div style="margin-top:3%;" class="starWrite">
                       <span class="starR1 on">별1_왼쪽</span>
                       <span class="starR2 on">별1_오른쪽</span>
                       <span class="starR1 on">별2_왼쪽</span>
                       <span class="starR2 on">별2_오른쪽</span>
                       <span class="starR1 on">별3_왼쪽</span>
                       <span class="starR2 on">별3_오른쪽</span>
                       <span class="starR1 on">별4_왼쪽</span>
                       <span class="starR2 on">별4_오른쪽</span>
                       <span class="starR1 on">별5_왼쪽</span>
                       <span class="starR2">별5_오른쪽</span>
                     </div>
                     <input type="hidden" name="r_no" id="r_no" value="${history.r_no}"/>
                     <input type="hidden" name="u_no" value="${history.u_no}"/>
                     <input type="hidden" name="u_name" value="${userInfo.u_name}"/><!-- ${userInfo.u_name} 으로 바꿔줘야 함 -->
                     <input type="hidden" name="b_no" value="${history.b_no}"/>
                     <input type="button" style="margin-left:41%; width:30%;"class="btn" id="commentSubmit" value="작성"/>
                  </td>
               </tr>
            </table>
         </form>
      </c:if>
   </div>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$('.starWrite span').click(function(){
     $(this).parent().children('span').removeClass('on');
     $(this).addClass('on').prevAll('span').addClass('on');
     return false;
   });
   
var starList = $('.starWrite span');
console.log(starList);

$('#commentSubmit').click(function(){
   var starLength = $('.on').length;
   console.log(starLength);
   var starScore = starLength/2;
   var str="<input type='hidden' name='c_star' value='"+starScore+"'/>";
   $('#writeComment').append(str);
   $('#writeComment').submit();
});


   var c_no = $("#c_no").val();
   var b_no = $("#b_no").val();
   var r_no = $("#r_no").val();
   $("#commentModify").click(function(){
      location.href="commentModify?b_no="+b_no;
   });
   
   $("#commentDelete").click(function(){
      var isDelete = confirm("후기를 삭제합니다.");
      if(isDelete){
         location.href="commentDelete?c_no="+c_no+"&b_no="+b_no+"&r_no="+r_no;
      }
   });
   
</script>