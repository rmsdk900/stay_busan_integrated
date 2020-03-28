<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign in</title>
</head>
<style>

/* BASIC */

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
  max-width: 450px;
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

input[type=button], input[type=submit], input[type=reset]  {
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
  margin: 5px;
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
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 75%;
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
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 75%;
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

h3{
    color:#60a0ff;
}

/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:30%;
}

#authWrap{
	display:none;
}

#authBtn{
	display:none;
}

</style>

<body>
<!-- 부트스트랩 로그인 -->
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<br/>
				<a href="/"><img style="width:110px;height:90px;" src="${path}/resources/img/stay.png" id="icon" alt="User Icon" /></a>
				<h1>비밀번호 찾기</h1>
			</div>

			<!-- Login Form -->
			<input type="text" class="fadeIn second" name="u_id" id="u_id" placeholder="아이디" autocomplete="off" />
			<input type="text" class="fadeIn second" name="u_name" id="u_name" placeholder="이름" autocomplete="off" />
			<input type="text" class="fadeIn third" name="u_phone" id="u_phone" placeholder="전화번호 (- 제외)" autocomplete="off" />
			<div id="authWrap">
				<h3>인증번호 입력</h3>
				<input type="text" class="fadeIn fourth" id="fp_code" name="fp_code"/>
			</div>
			<br/>
			<input type="button" class="fadeIn fourth" id="authBtn" value="인증하기"/>
			<input type="button" class="fadeIn fourth" id="findPass" value="비밀번호 찾기"/>
			<input type="button" class="fadeIn fourth" id="loginPage" value="로그인화면"/>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="/">HOME</a>
			</div>
		</div>
	</div>
<script> var contextPath = '${pageContext.request.contextPath}'; </script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   
	var u_name = "";
	var u_phone = "";
	var u_id = "";
	var fp_code = "";
   
   $("#loginPage").click(function(){
	  location.href=contextPath+"/user/login"; 
   });
   
   $("#findPass").click(function(){
	   
	   $("#fp_code").val("");
	   
	   if(($("#u_id").val()) == null || ($("#u_id").val()) == ""){
		   alert("아이디를 입력해 주세요.");
		   return;
	   }else{
		   u_id = $("#u_id").val();
	   }
	   
	   if(($("#u_name").val()) == null || ($("#u_name").val()) == ""){
		   alert("이름을 입력해 주세요.");
		   return;
	   }else{
		   u_name = $("#u_name").val();
	   }
	   
	   if(($("#u_phone").val()) == null || ($("#u_phone").val()) == ""){
		   alert("전화번호를 입력해 주세요.");
		   return;
	   }else{
		   u_phone = $("#u_phone").val();
	   }
	   
	   $.ajax({
		  type : "POST",
		  data : {
			  u_name : u_name,
			  u_phone : u_phone,
			  u_id : u_id
		  },
		  url : contextPath+"/user/findPassPost",
		  success : function(data){
			  console.log(data);
			  if(!(data.passCheck)){
				  	alert('입력하신 정보와 일치하는 회원이 없습니다.');
			  }else{
				    alert("입력하신 (" + u_id + ") 메일로 인증번호가 전송 되었습니다.");
					$("#authWrap").show("slow");
					$("#findPass").hide();
					$("#authBtn").show();
			  }
		  },
		  error : function(res){
			  alert(res.responseText);
		  }
	   });
	   
	   $("#authBtn").click(function(){
		   
		   if($("#fp_code").val() == "" || $("#fp_code").val() == null){
			   alert("인증번호를 입력하세요.");
			   return;
		   }else{
			   fp_code = $("#fp_code").val();
		   }
		   
		   $.ajax({
				  type : "POST",
				  data : {
					  u_id : u_id,
					  fp_code : fp_code
				  },
				  url : contextPath+"/user/authCheck",
				  success : function(data){
					  console.log(data);
					  if(data.passCheck){
						  $.ajax({
							  type : "POST",
							  data : {
								  u_id : u_id
							  },
							  url : contextPath+"/user/deleteCode",
							  success : function(data2){
								  alert(data2);
								  location.href=contextPath+"/user/newPass?u_id="+u_id;
							  },
							  error : function(res){
								  alert(res.resposeText);
							  }
						  })
					  }else{
						  alert("인증번호가 틀립니다.");
					  }
				  },
				  error : function(res){
					  alert(res.responseText);
				  }
		   });
	   });
   });
</script>
</body>
</html>