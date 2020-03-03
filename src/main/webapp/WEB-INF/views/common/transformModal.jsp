<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 금삼이 모달 css -->
<style>
#transformModal {
   display: none;
}

.messageImg {
   width: 35px;
   height: 35px;
   border: 1px solid black;
   border-radius: 50px;
   margin-right: 5px;
}

.messageLi {
   
   style: none;
}

.messageAtag {
   margin-top: 15px;
}

/* /////////////////header 클릭 했을 때 ul, li//////////////////// */

/* //////////////////쪽지 모달 //////////////////// */
.modalGs { /* 쪽지 모달 감싸는 DIV */
   display: none;
   position: fixed;
   z-index: 1;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgba(0, 0, 0, 0.4);
}

.modal-contentGs {
   position: relative;
   width: 500px;
   height: 550px;
   background-color: #fefefe;
   margin: auto;
   padding: 20px;
   border: 1px solid #888;
   border-radius: 10px;
}

.modalGs table {
   margin: auto;
   border-spacing: 10px;
}

#messageModalTable {
   width: 100%;
   align: left;
}

.mModalTarea { /* 쪽지 모달 안에 textarea */
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 12px;
   width: 100%;
   height: 80px;
   border: 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   white-space: pre;
}

#messageModalTable2 {
   width: 100%;
   align: center;
}

#sendBtn, #messageCancelBtn { /* 쪽지 모달 답장 btn */
   background-color: #56baed;
   border: none;
   color: white;
   padding: 5px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   text-transform: uppercase;
   font-size: 15px;
   height: 50px;
   width: 100%;
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
   margin: 0 auto;
}

#m_content {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 12px;
   width: 100%;
   height: 100px;
   border: 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
}

.modalBtn {
   margin: 0 auto;
   align: center;
   width: 100%;
}
</style>

<style>
#t_content {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 13px;
   width: 100%;
   height: 53%;
   border: 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   white-space: pre;
}
#transformSubmitBtn, #transformCancelBtn{
   background-color: #56baed;
   border: none;
   color: white;
   padding: 5px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   text-transform: uppercase;
   font-size: 15px;
   height: 50px;
   width: 30%;
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

#transformSubmitBtn:hover, #transformCancelBtn:hover{
   background-color: #39ace7;
}
.messageNav{
   list-style:none;
}

.checkDiv{
   margin:10%;
}
</style>
<!-- 전환 버튼 클릭시 띄울 modal -->
   <div id="transformModal" class="modalGs">
      <div class="modal-contentGs">
         <h3>회원 서비스 전환</h3>
         <div style="text-align: center; margin: 20px;">
            <div>
               <textarea id="t_content" readonly style="resize: none; height:270px;">
㈜구오구삼(이하 ‘회사’라 합니다)은 회원 서비스 전환 시
이용자로부터 아래와 같은 개인정보를 수집하고 있습니다.
이용자는 본 개인정보 수집·이용 동의 시, '필요한 최소한의 
정보 외의 개인정보' 수집·이용에 동의하지 않을 권리가 있습니다.

개인정보 취급 및 처리에 대한 상세한 사항은 구오구삼 비즈니스 
웹사이트(http://www.staybusan.com/about/buisiness)에 공개한 
'개인정보처리방침'을 참조하십시오. 
다만, 본 동의서 내용과 상충되는 부분은 
본 동의서의 내용이 우선합니다.

1. 수집하는 개인정보 항목
①회원가입시 기입한 개인정보
ㆍ 성명, 휴대전화번호, 이메일
ㆍ 암호화된 동일인 식별정보(CI)
②각 서비스 이용을 위해 필요한 정보, 서비스 이용기록 관련 정보
ㆍ 각 서비스 이용 기록 정보 (로그데이터, 쿠키, 이용시간 등)

2. 개인정보의 수집 및 이용목적
①회원관리 및 본인확인
ㆍ 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 
부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인
ㆍ 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인
ㆍ 비회원 견적문의 시 본인 확인
②고객 문의 응대
ㆍ 불만처리 및 민원처리, 고객제안, 고지사항 전달
ㆍ 민원인의 신원확인, 민원사항 확인, 사실조사를 위한 연락·통지, 
처리결과 통보 의 목적
ㆍ 반품/환불 등 주문/배송에 관한 요청사항 처리

3. 개인정보의 보유 및 이용기간
이용자의 개인정보는 원칙적으로 개인정보의 
수집 및 이용목적이 달성되면 지체 없이 파기합니다. 
다만, 회사는 관련법령의 규정에 의하여 개인정보를 
보유할 필요가 있는 경우, 해당 법령에서 정한 바에 의하여 
개인정보를 보유할 수 있습니다.
※ 귀하께서는 개인정보 수집‧이용에 대한 
동의를 거부하실 수 있으나, 이상의 정보는 
서비스 제공에 필수적으로 필요한 정보이므로, 
동의를 거부하실 경우 회원전환,서비스 이용 등을 하실 수 없습니다.

※ 회원 서비스 전환 후 이용과정에서 필요에 따라 요청되는 정보는 
서비스 이용과정에서 별도로 안내하고 동의 받도록 하겠습니다.

※ 전환을 원하시면 전환 버튼을 누르시고 이용약관에 동의를 바랍니다.
               </textarea>
            </div>
            <div class="checkDiv">
               <input type="checkbox" id="checkbox" /> 이용약관에 동의해 주세요.
            </div>
            <input type="button" id="transformSubmitBtn" data-no="${userInfo.u_no}" value="전환" /> 
            <input type="button" id="transformCancelBtn" value="닫기" />
         </div>
      </div>
   </div>
   
   <!-- 쪽지 탭에서 내용 클릭시 띄울 modal (추가) -->
   <div id="messageModal" class="modalGs">
      <div class="modal-contentGs">
         <h3>쪽지 내용</h3>
         <div style="text-align : left; margin:20px">
            <table id="messageModalTable">
            
            </table>
            <table id="messageModalTable2">
               <tr><td colspan=4><hr/></td></tr>   
               <tr>
                  <td colspan=4>
                     <input type="text" name="m_content" id="m_content" placeholder="답장을 입력해주세요"/>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div></div>
                  </td>
               </tr>
               <tr>
                  <td colspan=4>
                     <br/>
                        <input type="button" id="sendBtn" value="답장보내기"/>
                     <br/><br/>
                        <input type="button" id="messageCancelBtn" value="닫기" />
                  </td>
               </tr>
            </table>
         </div>
      </div>
   </div>
   
   <c:set var="u_no" value="${!empty userInfo ? userInfo.u_no : 0}"/>
   <script>
   
      var u_no = ${u_no};
      console.log("유저 번호 : "+u_no);
      
      // 메세지 탭에서 내용 클릭 -> 메세지 모달에 데이터 추가
      $(".messageWrap").on("click",".messageDetail",function(event){
         event.preventDefault();
         var m_no = $(this).attr("href");
         console.log(m_no);
         
         $.ajax({
            type : "POST",
            data : {
               m_no : m_no
            },
            url : contextPath+"/user/getMessageDetail",
            success : function(data){
               console.log(data);
               var html = "";
                  html += "<tr>";
                  html += "<td>";
                  html += "보낸사람 : ";
                  html += "</td>";
                  html += "<td colspan=3>";
                  html += data.m_sender_name;
                  html += "</td>";
                  html += "</tr>";
                  html += "<tr>";
                  html += "<td >";
                  html += "방 이름 : ";
                  html += "</td>";
                  html += "<td colspan=3>";
                  html += data.r_name;
                  html += "</td>";
                  html += "</tr>";
                  html += "<tr>";
                  html += "<td colspan=4>";
                  html += "내용";
                  html += "</td>";
                  html += "</tr>";
                  html += "<tr>";
                  html += "<td colspan=4>";
                  html += "<br/>";
                  html += "<textarea style='width:100%' class='mModalTarea'>"+data.m_content+"</textarea>";
                  html += "<input type='hidden' id='m_receiver' value='"+data.m_sender+"'/>"
                  html += "<input type='hidden' id='r_no' value='"+data.r_no+"'/>"
                  html += "</td>";
                  html += "</tr>";
                  $("#messageModalTable").html(html);
            },
            error : function(res){
               console.log(res.responseText);
            }
         });
         $("#messageModal").css("display", "flex");
      });
   
      // 헤더 쪽지 버튼 클릭 시 안읽은 쪽지 내용(5개) 표시 (추가)
      $(".messageNav").click(function(event){
         
         event.preventDefault();
         
         showMessage(u_no);
         
         var display = $(".messageWrap").css("display");
         
         if(display == "none"){
            $(".messageWrap").css("display","inline");
         }else{
            $(".messageWrap").css("display","none");
         }
      });
      
      $("#transform").click(function(event) {
         event.preventDefault();
         $("#transformModal").css("display", "flex");
      });
      
      var boolInfo = false;
      
      // 쪽지 모달에서 send버튼 클릭시 (추가)
      $("#sendBtn").click(function(){
         var target = $(this).parent().parent().parent().parent().parent();
         
         var m_receiver = target.find("#m_receiver").val();
         var r_no = target.find("#r_no").val();
         var m_sender = ${u_no};
         var m_content = $("#m_content").val();
         
         $.ajax({
            type: "post",
            url: contextPath+"/messages/send",
            headers: {
               "Content-Type": "application/json",
               "X-HTTP-Method-Override" : "POST"
            },
            data: JSON.stringify({
               r_no: r_no,
               m_receiver: m_receiver,
               m_sender: m_sender,
               m_content: m_content
            }),
            dataType: "text",
            success: function(data){
               alert(data);
               $('#messageModal').css("display",'none');
               showMessage(u_no);
            }
         });
         
      });
   
      // 전환  modal 신청취소 취소하기 버튼 클릭
      $("#transformSubmitBtn").click(function() {
         var u_no = $(this).attr("data-no");
         if(boolInfo){
            $.ajax({
               type : "POST",
               data : {
                  u_no : u_no
               },
               url : contextPath+"/user/transformUser",
               success : function(data){
                  $("#transformModal").css("display", "none");
                  alert(data);
               },
               error : function(res){
                  alert(res.responseText);
               }
            });
         }else{
            alert("이용약관에 동의해주세요.");
         }
      });
      
      // 전환 모달 체크박스 체크 안체크 체크
      $("#checkbox").on("change",function(){
         var isChecked = $(this).is(":checked");
         if(isChecked){
            boolInfo = true;
         }else{
            boolInfo = false;
         }
      });
      
      // 전환 모달 취소 버튼
      $("#transformCancelBtn").click(function() {
         $("#transformModal").css("display", "none");
      });
      
      // 메세지 모달 취소 버튼
      $("#messageCancelBtn").click(function() {
         showMessage(u_no);
         $("#messageModal").css("display", "none");
      });
      
      // 메세지 탭에 리스트 뿌려주는 함수
      function showMessage(u_no){
         $.ajax({
            type : "POST",
            data : {
               u_no : u_no
            },
            url : contextPath+"/user/getMessageMain",
            success : function(data){
               console.log(data);
               var html = "";
               
               $(data).each(function(){
                  console.log((this.m_content).length);
                  var m_content = "";
                  if((this.m_content).length > 15){
                     m_content = ((this.m_content).substring(0,12))+"...";
                  }else{
                     m_content = this.m_content;
                  }
                  console.log(m_content);
                  html += "<li class='messageLi'>";
                  html += "<img class='messageImg' src='${pageContext.request.contextPath}/displayFile?fileName="+this.m_sender_profile+"'/>";
                  html += "<a class='messageDetail' href="+this.m_no+">"+m_content+"</a>";
                  html += "</li>";
               });
               html += "<div class='messageAtag'><a href='"+contextPath+"/user/messageBox'>쪽지함으로 이동</a></div>"
               $(".messageWrap").html(html);
            },
            error : function(res){
               console.log(res.responseText);
            }
         });
      }
   </script>