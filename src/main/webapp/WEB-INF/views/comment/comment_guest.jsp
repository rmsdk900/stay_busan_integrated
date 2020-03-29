<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
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

.commentList{
   margin-left:10%;
}
</style>
<div class="commentList" style="clear:both;padding-top:3%;">
<hr/>
<br/><br/>
<h3>후기</h3>
<br/>
<table style="width:830px;" >
   <tr>
      <th>숙소</th>
      <th>작성자</th>
      <th>댓글</th>
      <th>별점</th>
      <th>날짜</th>
   </tr>
   <c:choose>
      <c:when test="${!empty comment}">
         <c:forEach var = "comment" items="${comment}">
            <tr>
               <td style="width:150px; "><c:out value="${comment.r_name}" escapeXml="true"/></td>
               <td style="width:100px; "><c:out value="${comment.u_name}" escapeXml="true"/></td>
               <td style="width:250px; "><c:out value="${comment.c_content}" escapeXml="true"/></td>
               <td style="width:150px;">
                  <div class="starRev" style="width:200px;">
                        <span class="starL1 
                        <c:out value="${comment.c_star > 0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR1
                        <c:out value="${comment.c_star > 0.5 ? 'on' : ''}"/>
                        "></span>
                        <span class="starL2
                        <c:out value="${comment.c_star > 1.0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR2
                        <c:out value="${comment.c_star > 1.5 ? 'on' : ''}"/>
                        "></span>
                        <span class="starL3
                        <c:out value="${comment.c_star > 2.0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR3
                        <c:out value="${comment.c_star > 2.5 ? 'on' : ''}"/>
                        "></span>
                        <span class="starL4
                        <c:out value="${comment.c_star > 3.0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR4
                        <c:out value="${comment.c_star > 3.5 ? 'on' : ''}"/>
                        "></span>
                        <span class="starL5
                        <c:out value="${comment.c_star > 4.0 ? 'on' : ''}"/>
                        "></span>
                        <span class="starR5
                        <c:out value="${comment.c_star > 4.5 ? 'on' : ''}"/>
                        "></span>
                     </div>
               </td>
               <td style="width:80px; "><fmt:formatDate value="${comment.c_regdate}" pattern="yyyy.MM.dd"/></td>
               <!-- <td>
                  <input type="button" id="modify" value="수정"/>
                  <input type="button" id="delete" value="삭제"/>
               </td> -->
            </tr>
         </c:forEach>
      </c:when>
      <c:otherwise>
         <tr>
            <td colspan="5"> 작성한 후기가 없습니다. </td>
         </tr>
      </c:otherwise>
   </c:choose>
   
</table>
</div>