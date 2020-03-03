<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script> var contextPath = '${pageContext.request.contextPath}'; </script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style>
.star {
   color: red;
}

table{
   max-width:800px;
   margin:0 auto;
}

table td{
   margin : 10px;
   text-align: left;
}

html {
  background-color: #56baed;
}

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #92badd;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #cccccc;
}



/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width:800px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}



/* FORM TYPOGRAPHY*/
#u_idck{
  background-color: #56baed;
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  height: 48px;
  width: 80px;
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

#joinBtn{
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
  width: 400px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
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

input[type=text] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 20px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 20px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
  color: #cccccc;
}

input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=password]:placeholder {
  color: #cccccc;
}

#u_type{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 20px;
  option-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  margin: 5px;
  width: 98%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

#u_introduce{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 20px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  margin: 5px;
  width: 86%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

#u_terms{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 10px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;  
  width: 94%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  white-space:pre;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after{
  width: 100%;
}

h1{
    color:#60a0ff;
}

/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:30%;
}
</style>
<body>
<!-- 
   회원가입 시 정보
   아이디   u_id   -- aaaaa@aaaa.com
   비번      u_pw
   이름      u_name
   소개      u_introduce
   프로필   u_profile
   전화번호   u_phone
   게/호   u_type
 -->
  
  <!-- 부트스트랩 회원가입 -->
  <div class="wrapper fadeInDown">
      <div id="formContent">
         <!-- Tabs Titles -->

         <!-- Icon -->
         <div class="fadeIn first">
            <br/>
            <img style="width:110px;height:90px;" src="${path}/resources/img/stay.png" id="icon" alt="User Icon" />
            <h1>회원가입</h1>
         </div>

         <!-- Login Form -->
         <form id="joinForm" action="joinPost" method="POST">
            <div>
               <span class="star">*</span><font>프로필 사진</font><br/>
               <img id="img" width="200px" height="200px"><br/>
               <input type="file" id="u_profile" accept=".jpg, .png, .jpeg, .gif" required autocomplete="off"/>
               <br/>
            </div>
            <table>
               <tr>
                  <td><span class="star">*</span>아이디(email)</td>
                  <td><input style="width:50%;" type="text" class="fadeIn second" name="u_id" id="u_id" placeholder="이메일을 입력해주세요" autocomplete="off"/>
                     <input type="button" id="u_idck" value="중복체크"/>
                     <div class="result"></div>
                  </td>
               </tr>
               <tr>         
                  <td><span class="star">*</span>비밀번호</td>
                  <td><input type="password" class="fadeIn second" name="u_pw" id="u_pw" placeholder="영문/숫자 조합 6~20자 입력해주세요" autocomplete="off"/>
                     <div class="result"></div>
                  </td>
               </tr>
               <tr>
                  <td><span class="star">*</span>비밀번호 확인</td>
                  <td><input type="password" class="fadeIn second" name="u_repw" id="u_repw" placeholder="비밀번호 재입력해주세요" autocomplete="off"/>
                     <div class="result"></div>
                  </td>
               </tr>
               <tr>
                  <td><span class="star">*</span>이름</td>
                  <td><input type="text" class="fadeIn second" name="u_name" id="u_name" placeholder="2~6자 입력해주세요" autocomplete="off"/>
                     <div class="result"></div>
                  </td>
               </tr>
               <tr>
                  <td><span class="star">*</span>전화번호</td>
                  <td><input type="text" class="fadeIn second" name="u_phone" id="u_phone" placeholder=" - 없이 입력해주세요" autocomplete="off"/>
                     <div class="result"></div>
                  </td>
               </tr>
               <tr>
                  <td><span class="star">*</span>게스트/호스트</td>
                  <td>
                     <select    name="u_type" id="u_type">
                     <option value="n">-----------------------------------------------</option>
                     <option value="0">게스트</option>
                     <option value="1">호스트</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>자기소개</td>
                  <td>
                     <textarea name="u_introduce" id="u_introduce" cols=35 rows=5 style="resize:none;"></textarea>
                  </td>
               </tr>
               <tr>
                  <td colspan=2>
                     <textarea id="u_terms" cols=35 rows=5 style="resize:none;" readonly>
                        
㈜구오구삼(이하 ‘회사’라 합니다)은 비즈니스 회원 가입시 
이용자로부터 아래와 같은 개인정보를 수집하고 있습니다.
이용자는 본 개인정보 수집·이용 동의 시, '필요한 최소한의 
정보 외의 개인정보' 수집·이용에 동의하지 않을 권리가 있습니다.
개인정보 취급 및 처리에 대한 상세한 사항은 구오구삼 비즈니스 
웹사이트(http://www.staybusan.com/about/buisiness)에 공개한 
'개인정보처리방침'을 참조하십시오. 
다만, 본 동의서 내용과 상충되는 부분은 
본 동의서의 내용이 우선합니다.

1. 수집하는 개인정보 항목
①회원가입을 위해 필요한 개인정보
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
동의를 거부하실 경우 회원가입, 서비스 이용 등을 하실 수 없습니다.

※ 회원가입 후 서비스 이용과정에서 필요에 따라 요청되는 정보는 
서비스 이용과정에서 별도로 안내하고 동의 받도록 하겠습니다.
                     </textarea>
                  </td>
               </tr>
            </table>
            <label>
               <input type="checkbox" name="u_info" id="u_info" value="y"/>
               개인정보 이용 동의
            </label>
            <br/><br/>
            <input type="button" class="fadeIn fourth" id="joinBtn" value="회원가입"/>
         </form>

         <!-- Remind Passowrd -->
         <div id="formFooter">
            <a class="underlineHover" href="/staybusan">HOME</a>
         </div>

      </div>
   </div>
  
  

<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<script>

     
     /* 각 정규식 */
     $(function(){
        $("#u_id").focus(); // 아이디 자동으로 포커스 맞춘다
        
        var boolUid = false;
        var boolUidCheck = false;
        var boolPassword = false;
        var boolPasswordCheck = false;
        var boolName = false;
        var boolPhone = false;
        var boolInfo = false;
        
        var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;       // 이메일 정규표현식
        var regexPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;         // 영문,숫자를 혼합하여 6~20자 이내
         var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;               // mobile -표시 없이 숫자만
        var regexName = /^[\uac00-\ud7a3]{2,6}$/;                        // 한글 영문 포함 2~6자 이내
        
        var u_idck = 0;
        
        var u_profile = "";
        
        function checkRegex(elP,valP,regexP,messageP,ajaxP){
            if(regexP.test(valP) === false){
               // showErrorMessage
               showErrorMessage(elP,messageP,false);
               return false;
            }else if(regexP.test(valP) !== false && ajaxP === null){
               // showMessage
               showErrorMessage(elP,"사용가능한 형식입니다.",true);
               return true;
            }else{
               if(ajaxP !== null){
                  // ajax 실행
                  ajaxP(elP);
               }
            }
         }
        
        function showErrorMessage(elP,messageP,isChecked){
           var html = "<span style='margin-left:5px; font-size:12px; ";
              html += isChecked ? "color:blue;" : "color:red;";
              html += " class='resultSpan' '>";
              html += messageP;
              html += " </span>";
               $(elP).html(html);
        }
        
        $("#u_id").on("input",function(){ // 실시간으로 값을 받아서 console에 띄워준당
           var tempVal = $(this).val();
            console.log(tempVal);
            
            var elP = $(this).parent().find(".result");
            var message = "올바른 이메일 형식이 아닙니다.";
                  
            boolUid = checkRegex(elP,tempVal,regexEmail,message,null);
               
         });
        
        $("#u_idck").click(function(){
          var elP = $(this).parent().find(".result");
          var u_id = $("#u_id").val();
          if(u_id==null || u_id=="" || regexEmail.test(u_id) == false){
            alert("아이디를 입력해주세요.");
            return;
          }
          $.ajax({
             url : "${path}/user/uidCheck",
            type : "post",
            headers : {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST"
            },
            data : JSON.stringify({
               u_id:u_id
            }),
            success : function(data){
               if(data > 0){
                  showErrorMessage(elP,"이미 존재하는 아이디입니다.",false);
                  boolUid = false;
                  $("u_id").focus();
               }else {
                  console.log
                  showErrorMessage(elP,"사용가능한 아이디입니다",true);
                  boolUidCheck = true;
                  boolUid = true;
                  $("u_pw").focus();
                  u_idck = 1;
               }
            }
          });
        });
        
        $("#u_pw").on("input",function(){
            var tempVal = $(this).val();
            var elP = $(this).parent().find(".result");
            var message = "영문/숫자 조합하여 6~20자 이내 작성";
            boolPassword = checkRegex(elP,tempVal,regexPass,message,null);
         });
         
         $("#u_repw").on("input",function(){
            var tempVal = $(this).val();
            var elP = $(this).parent().find(".result");
            var originVal = $("#u_pw").val();
            var message = "";
            
            if(boolPassword){
               if(tempVal == originVal){
                  boolPasswordCheck = true;
                  message = "비밀번호가 일치합니다.";
               }else{
                  boolPasswordCheck = false;
                  message = "비밀번호가 일치하지 않습니다.";
               }
            }else{
               boolPasswordCheck = false;
               message = "비밀번호를 확인해 주세요.";
            }
            showErrorMessage(elP,message,boolPasswordCheck);
         });
         
         $("#u_name").on("input",function(){
            var tempVal = $(this).val();
            var elP = $(this).parent().find(".result");
            var message = "2~6자 이내로 작성해주세요";
            boolName = checkRegex(elP,tempVal,regexName,message,null);
         });
         
         $("#u_phone").on("input",function(){
            var tempVal = $(this).val();
            var elP = $(this).parent().find(".result");
            var message = "- 제외 숫자만 입력해주세요";
            boolPhone = checkRegex(elP,tempVal,regexMobile,message,null);
         });
         
         $("#u_info").on("change",function(){
            var isChecked = $(this).is(":checked");
            if(isChecked){
               boolInfo = true;
            }else{
               boolInfo = false;
            }
         });
         
         $("#u_profile").on("change",function(){
            var file_kind = this.value.lastIndexOf('.');
            var file_name = this.value.substring(file_kind + 1, this.length);
            var file_type = file_name.toLowerCase();
            var check_file_type = [ 'jpg', 'png', 'jpeg', 'gif' ];

            if (check_file_type.indexOf(file_type) == -1) {
               alert('이미지 파일만 등록 가능합니다.');
               $(this).val("");
               $("#img").removeAttr("src");
               return;
            }
            
            showImage(this.files);
            
            var formData = new FormData();
            formData.append("file",this.files[0]);
            
            $.ajax({
               type : "POST",
               data : formData,
               dataType : "json",
               url : contextPath+"/user/fakeUploadFile",
               processData : false,
               contentType : false,
               success : function(data){
                  console.log(data);
                  
                  var fileInfo = getFileInfo(data[0]);
                  
                  console.log(fileInfo.fullName);
                  u_profile = fileInfo.fullName;
                  console.log(u_profile);
               },
               error : function(res){
                  alert(res.responseText);
               }
            });
            
         });
         
         function showImage(files){
            if(files != null && files[0] != null){
               var reader = new FileReader();
               
               reader.onload = function(e){
                  $("#img").attr("src",e.target.result);
               }
               reader.readAsDataURL(files[0]);
            }
         }
         
         $("#joinBtn").click(function(){
            
            if(!boolUid){
               alert("아이디를 확인해 주세요.");
               $("#u_id").focus();
            }else if(!boolUidCheck){
               alert("아이디 중복체크를 해주세요.");
            }else if(!boolPassword){
               alert("비밀번호를 확인해 주세요.");
               $("#u_pw").focus();
            }else if(!boolPasswordCheck){
               alert("비밀번호 체크를 확인해 주세요.");
               $("#u_repw").focus();
            }else if(!boolName){
               alert("이름을 확인해 주세요.");
               $("#u_name").focus();
            }else if(!boolPhone){
               alert("전화번호를 확인해 주세요.");
               $("#u_phone").focus();
            }else if(!boolInfo){
               alert("이용약관을 체크해주세요");
            }else{
               var html = "<input type='hidden' name='u_profile' value='"+u_profile+"'/>";
               $("#joinForm").append(html);
               $("#joinForm").submit();
            }
         });
     });
    
        
     </script>
</body>
</html>