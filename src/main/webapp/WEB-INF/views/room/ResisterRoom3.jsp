<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> var contextPath = '${pageContext.request.contextPath}'; </script>
<style>
.fileDrop {
   display: inline-block;
}

.fileDrop input[type="file"] {
   position: relative;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   diplay: none;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

.addImageWrap {
   display: inline-block;
}

.addImageWrap input[type="file"] {
   position: relative;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   diplay: none;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

.addImage {
   width: 700px;
}

.imgSmall {
   margin: 5px;
}

.smallImgWrap {
   display: inline-block;
}

.fileBig {
   margin-bottom: 50px;
}

body {
    margin-top:30px;
}
.stepwizard-step p {
    margin-top: 0px;
    color:#666;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}
.stepwizard-step button[disabled] {
    /*opacity: 1 !important;
    filter: alpha(opacity=100) !important;*/
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
    text-align: center;
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

.roomWrap{

	margin-left: 16%;
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
  
.delete{
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
.deleteImg{
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
</style>
</head>
<body>
<div>
    <div class="stepwizard">
        <div class="stepwizard-row">
            <div class="stepwizard-step">         
                <div style="margin-left:20%;">1
                <p class="mr-5"><small>Room Information</small></p>
                </div>
            </div>
            <div class="stepwizard-step"> 
                <div>2
                <p class="mr-5"><small>Check In & Out</small></p>
                </div>
            </div>
            <div class="stepwizard-step">
            	<div style="margin-right:10%;">3             
                <h3>Room Image</h3>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="roomWrap">
   <form method="post" id="submitForm">
   <h2>숙소 이미지</h2>
      <div class="fileBig" style="border: 1px solid black; width: 500px; height: 300px">
         <div class="fileDrop" style="width: 100%; height: 100%">
            <img id='addImageBtn' width=100% height=100% src='${path}/resources/images/addImage.PNG'/>
            <input type='file' accept='image/*' id='addImage'/>
         </div>
      </div>
      <div class="addImage">
         <div class="fileSmall"></div>
         <div class="addImageWrap"></div>
      </div>
      
      <div id="addData">
         <input type="hidden" name="r_guests" value="${room.r_guests}"/>
         <input type="hidden" name="r_bedroom" value="${room.r_bedroom}"/>
         <input type="hidden" name="r_bed" value="${room.r_bed}"/>
         <input type="hidden" name="r_bath" value="${room.r_bath}"/>
         <input type="hidden" name="r_addr_main" value="${room.r_addr_main}"/>
         <input type="hidden" name="r_addr_detail" value="${room.r_addr_detail}"/>
         <input type="hidden" name="r_name" value="${room.r_name}"/>
         <input type="hidden" name="r_desc" value="${room.r_desc}"/>
         <input type="hidden" name="date_from" value="${room.date_from}"/>
         <input type="hidden" name="date_to" value="${room.date_to}"/>
         <input type="hidden" name="r_price" value="${room.r_price}"/>
         <input type="hidden" name="r_checkin_our" value="${room.r_checkin_our}"/>
         <input type="hidden" name="r_checkin_minute" value="${room.r_checkin_minute}"/>
         <input type="hidden" name="r_checkout_our" value="${room.r_checkout_our}"/>
         <input type="hidden" name="r_checkout_minute" value="${room.r_checkout_minute}"/>
         <input type="hidden" name="u_no" value="${userInfo.u_no}"/>
         <c:if test="${!empty room.amenities}">
            <c:forEach var="amenity" items="${room.amenities}">
               <input type="hidden" name="amenity" value="${amenity}"/>
            </c:forEach>
         </c:if>
         <c:if test="${!empty room.closed_from}">
            <c:forEach var="closed_from" items="${room.closed_from}">
               <input type="hidden" name="closed_from" value="${closed_from}"/>
            </c:forEach>
         </c:if>
         <c:if test="${!empty room.closed_to}">
            <c:forEach var="closed_to" items="${room.closed_to}">
               <input type="hidden" name="closed_to" value="${closed_to}"/>
            </c:forEach>
         </c:if>
      </div>
      
      <div>
         <input type="button" id="preBtn" value="이전" /> 
         <input type="button" id="submitBtn" value="등록" />
      </div>
   </form>
  </div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<script>
   
   var u_no = ${userInfo.u_no};
   
   // 파일 미리보기 뿌리기용 파일 배열
   var allFiles = [];
   
   // 다음 페이지로 넘길 파일이름 배열
   var fileNames = [];

   // 추가하기 이미지 코드
   var html3 = "";
   html3 += "<div style='width:200px; height:100px border:1px solid black;'>";
   html3 += "<img id='addImageBtn' width=100% src='" + contextPath
         + "/resources/images/addImage.PNG'/>";
   html3 += "<input type='file' accept='image/*' id='addImage'/>";
   html3 += "</div>";

   // 이전 버튼 클릭
   $("#preBtn").click(function(){
      history.go(-1);   
   });
   
   // 메인이미지 구역 드래그 앤 드랍
   $(".fileDrop").on("dragenter dragover", function(event) {
      event.preventDefault();
   });

   $(".fileDrop").on("drop", function(event) {
      event.preventDefault();

      
      // 이미지 미리보기 용
      var file = event.originalEvent.dataTransfer.files;
      console.log(file);
      
      if (file[1] != null) {
         alert('하나의 파일만 등록 가능합니다.');
         return;
      }

      var type = file[0].type.substr(file[0].type.lastIndexOf("/") + 1);

      if (type != "jpg" && type != "jpeg" && type != "png" && type !="gif") {
         alert('이미지파일만 가능합니다.');
         return;
      }

      $(".addImageWrap").html(html3);

      allFiles.push(file[0]);
      showImage(allFiles);
      
      
      // 이미지 업로드 용
      var formData = new FormData();
      formData.append("file",file[0]);
      
      // u_no 임의 값 1
      formData.append("u_no",u_no);
      
      // 이미지 업로드(fake)
      $.ajax({
         type : "POST",
         data : formData,
         dataType : "json",
         url : contextPath+"/Rooms/fakeUploadFile",
         processData : false,
         contentType : false,
         success : function(data){
            console.log("data : "+data);
            
            var fileInfo = getFileInfo(data[0]);
            
            console.log(fileInfo.fullName);
            
            fileNames.push(fileInfo.fullName);
            
            console.log(fileNames);      
         },
         error : function(res){
            alert(res.responseText);
         }
      });
   });


   // 추가하기 이미지 드래그 앤 드랍
   $(".addImageWrap").on("dragenter dragover", function(event) {
      event.preventDefault();
   });

   $(".addImageWrap").on("drop",function(event) {
      event.preventDefault();

      var file = event.originalEvent.dataTransfer.files;
      console.log(file);
      
      var maxSize = 20971520;

      if (file[1] != null) {
         alert('하나의 파일만 등록 가능합니다.');
         return;
      }
      
      var type = file[0].type.substr(file[0].type.lastIndexOf("/") + 1);

      if (type != "jpg" && type != "jpeg" && type != "png" && type !="gif") {
         alert('이미지파일만 가능합니다.');
         return;
      }
      
      if (file[0].size > maxSize){
         alert("업로드 할 수 없는 파일이 포함되어 있습니다. size : "+file[i].size);
         return;
      }

      $(".addImageWrap").html(html3);

      allFiles.push(file[0]);
      showImage(allFiles);
      
      // 이미지 업로드 용
      var formData = new FormData();
      formData.append("file",file[0]);
      
      // u_no 임의 값 1
      formData.append("u_no",1);
      
      $.ajax({
         type : "POST",
         data : formData,
         dataType : "json",
         url : contextPath+"/Rooms/fakeUploadFile",
         processData : false,
         contentType : false,
         success : function(data){
            console.log("data : "+data);
            var fileInfo = getFileInfo(data[0]);
            
            console.log(fileInfo.fullName);
            
            fileNames.push(fileInfo.fullName);
            
            console.log(fileNames);
         },
         error : function(res){
            alert(res.responseText);
         }
      });
   });

   
   // 추가하기 클릭 시 input file 호출
   $(".addImageWrap").on("click", "#addImageBtn", function() {
      $("#addImage").click();
   });
   
   $(".fileBig").on("click","#addImageBtn",function(){
      $("#addImage").click();
   });
   
   // input file 값 입력 시
   $(".addImageWrap").on("change","#addImage",function() {
      
      // 파일 확장자 확인
      var file_kind = this.value.lastIndexOf('.');
      var file_name = this.value.substring(file_kind + 1, this.length);
      var file_type = file_name.toLowerCase();
      var check_file_type = [ 'jpg', 'png', 'jpeg', 'gif' ];

      if (check_file_type.indexOf(file_type) == -1) {
         alert('이미지 파일만 등록 가능합니다.');
         $(this).val("");
         return;
      }

      // 이미지 미리보기 뿌리기
      allFiles.push(this.files[0]);
      showImage(allFiles);
      
      // 이미지 업로드 용
      var formData = new FormData();
      formData.append("file",this.files[0]);
      formData.append("u_no",${userInfo.u_no});
      
      $.ajax({
         type : "POST",
         data : formData,
         dataType : "json",
         url : contextPath+"/Rooms/fakeUploadFile",
         processData : false,
         contentType : false,
         success : function(data){
            console.log("data : "+data);
            
            var fileInfo = getFileInfo(data[0]);
            
            console.log(fileInfo.fullName);
            
            fileNames.push(fileInfo.fullName);         
         },
         error : function(res){
            alert(res.responseText);
         }
      });
   });
   
    // input file 값 입력 시
   $(".fileBig").on("change","#addImage",function() {
      
      // 파일 확장자 확인
      var file_kind = this.value.lastIndexOf('.');
      var file_name = this.value.substring(file_kind + 1, this.length);
      var file_type = file_name.toLowerCase();
      var check_file_type = [ 'jpg', 'png', 'jpeg', 'gif' ];

      if (check_file_type.indexOf(file_type) == -1) {
         alert('이미지 파일만 등록 가능합니다.');
         $(this).val("");
         return;
      }

      // 이미지 미리보기 뿌리기
      allFiles.push(this.files[0]);
      showImage(allFiles);
      
      // 이미지 업로드 용
      var formData = new FormData();
      formData.append("file",this.files[0]);
      formData.append("u_no",${userInfo.u_no});
      
      $.ajax({
         type : "POST",
         data : formData,
         dataType : "json",
         url : contextPath+"/Rooms/fakeUploadFile",
         processData : false,
         contentType : false,
         success : function(data){
            console.log("data : "+data);
            
            var fileInfo = getFileInfo(data[0]);
            
            console.log(fileInfo.fullName);
            
            fileNames.push(fileInfo.fullName);         
         },
         error : function(res){
            alert(res.responseText);
         }
      });
   });
   
   // 메인이미지 삭제버튼 클릭 시
   $(".fileBig").on("click", ".delete", function() {
      allFiles.splice(0, 1);
      fileNames.splice(0, 1);
      $(this).parent().remove();
      showImage(allFiles);
   });

   // 작은 이미지 삭제버튼 클릭 시
   $(".fileSmall").on("click", ".deleteImg", function() {
      var index = $(this).attr("data-file");
      console.log("인덱스 : " + index);
      allFiles.splice(index, 1);
      fileNames.splice(index, 1);
      $(this).parent().remove();
      showImage(allFiles);
   });
   
   // 등록 버튼 클릭
   $("#submitBtn").click(function(){
      var str = "";
      
      console.log(fileNames);
      
      if(fileNames == null || fileNames.length < 1){
         alert('한 장 이상의 사진을 등록해주세요!');
         return;
      }
      
      $(fileNames).each(function(index){
         str +="<input type='hidden' name='files["+index+"]' value='"+fileNames[index]+"'/>";
      });
      $("#addData").append(str);
      
      $("#submitForm").attr("action",contextPath+"/Rooms/register");
      $("#submitForm").submit();
   });
   
   // 이미지 뿌리기
   function showImage(allFiles) {
      console.log(allFiles);
      console.log(fileNames);
      var html1 = "";
      var html2 = "";
      
      if(allFiles[0] == null){
         $(".addImageWrap").html("");
         
         var html = "";
            html += "<img id='addImageBtn' width=100% height=100% src='"+contextPath+"/resources/images/addImage.PNG'/>";
            html += "<input type='file' accept='image/*' id='addImage'/>";
         $(".fileDrop").html(html);
      }
      
      if (allFiles != null && allFiles[0] != null) {
         var reader = new FileReader();

         reader.onload = function(e) {
            html1 += "<div id= 'imgSmallWrap' style='width:100%; height:100%'>";
            html1 += "<img id='imgMain' width='100%' height='100%' src='"+ e.target.result + "'/>";
            html1 += "<input type='button' class='delete' data-file='0' value='x'/>";
            html1 += "</div>";
            $(".fileDrop").html(html1);
         }
         reader.readAsDataURL(allFiles[0]);
         
         $(".addImageWrap").html(html3);
      }
      
      if(allFiles[1] == null){
         $(".fileSmall").html("");
      }
      
      for (var i = 1; i < allFiles.length; i++) {
         var reader = new FileReader();
         
         var j = 0;
         
         reader.onload = function(e) {
            j = ++j;
            html2 += "<div class='smallImgWrap' style='width:210px'>";
            html2 += "<img id='imgSmall' width='200px' src='"+e.target.result+"'/>";
            html2 += "<input type='button' class='deleteImg' data-file='"+j+"' value='x'/>";
            html2 += "</div>";
            $(".fileSmall").html(html2);
         }
         reader.readAsDataURL(allFiles[i]);
      }
   }
   
</script>
</body>
</html>