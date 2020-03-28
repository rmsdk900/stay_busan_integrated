<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


.roomWrap{
   margin: 6% 15% 5% 18%;
}

/* 방 기본 정보 */
input[type=number] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 12px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 5px;
  width: 40%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}


/* 주소 찾기 */
#addr{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 12px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 5px;
  width: 80%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
#addr_detail{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 12px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 5px;
  width: 90%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
.submitBtn{
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
  margin: 5px 15px 30px 75%;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.submitBtn:hover{
   background-color: #39ace7;
}

.findBtn{
  background-color: #56baed;
  border: none;
  color: white;
  padding: 10px 5px;
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

.findBtn:hover{
   background-color: #39ace7;
}

.ame1, .ame2, .ame3{
   width:100%;
   margin-right:10%;
}

.checkbox-size{
   width:16px;
   height:16px;
}

</style>
<body>
<div>
    <div class="stepwizard">
        <div class="stepwizard-row">
            <div class="stepwizard-step">         
                <div style="margin-left:40%;">1
                <h3>Room Information</h3>
                </div>
            </div>
            <div class="stepwizard-step"> 
                2
                <p class="mr-5"><small>Check In & Out</small></p>
            </div>
            <div class="stepwizard-step">
               3             
                <p class="mr-5"><small>Room Image</small></p>
            </div>
        </div>
    </div>
</div>
<div class="roomWrap">
   <form id="submitForm" action="resisterRoom2" method="post">
      <table><!-- 전체 크게 감싸는 테이블 한줄 정렬 -->
         <tr>
            <td>
               <div class="tableWrap">
                  <h2>방 기본 정보</h2>
                  <table style="margin-bottom:50px;">
                     <tr>
                        <td>
                           <img style="width:30px;height:30px; margin:10px 10px 10px 10px;" src="${path}/resources/img/icon/human.png">
                           </td>
                           <td> 인원  <input id="r_guests" type="number" name="r_guests" min="0" value="1"/>명
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <img style="width:30px;height:30px; margin:10px 10px 10px 10px;" src="${path}/resources/img/icon/bedroom.png">
                           </td>
                           <td>
                           침실  <input id="r_bedroom" type="number" name="r_bedroom" min="0" value="1"/>개
                        </td>
                     </tr>
                     <tr>   
                        <td>
                           <img style="width:30px;height:30px; margin:10px 10px 10px 10px;" src="${path}/resources/img/icon/bed.png">
                           </td>
                           <td>
                           침대  <input id="r_bed" type="number" name="r_bed" min="0" value="1"/>개
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <img style="width:30px;height:30px; margin:10px 10px 10px 10px;" src="${path}/resources/img/icon/bathroom.png">
                           </td>
                           <td>
                           욕실  <input id="r_bath" type="number" name="r_bath" min="0" value="1"/>개
                        </td>
                     </tr>
                  </table>
               </div>
            </td>
                        
            <td>
               <div class="tableWrap" style="margin-left:10%;">
                  <h2>편의 시설</h2>
                  <table style="margin-bottom:50px; width:120%;">
                     <!-- 20200326 전체선택 추가 -->
                     <tr>
                        <td></td><td></td>
                        <td><input type="checkbox" id="selectAll" class="checkbox-size"/>전체선택</td>
                     </tr>
                     <tr>
                        <td>                        
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_wifi" style="margin-bottom:20px;"/> 와이파이
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_heating" style="margin-bottom:20px;"/> 난방
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_TV" style="margin-bottom:20px;"/> TV
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_kitchen" style="margin-bottom:20px;"/> 주방
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_hairdryer" style="margin-bottom:20px;"/> 헤어드라이기
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_iron" style="margin-bottom:20px;"/> 다리미
                        </td>
                     </tr>
                     <tr>
                        <td>                     
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_hanger" style="margin-bottom:20px;"/> 옷걸이
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_towel" style="margin-bottom:20px;"/> 수건
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_elevator" style="margin-bottom:20px;"/> 엘리베이터
                        </td>
                     </tr>
                     <tr>
                        <td>   
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_parking" style="margin-bottom:20px;"/> 주차장
                        </td>
                        <td>                        
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_washer" style="margin-bottom:20px;"/> 샤워용품
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_cookware" style="margin-bottom:20px;"/> 조리기구
                        </td>
                     </tr>
                     <tr>   
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_refri" style="margin-bottom:20px;"/> 냉장고
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_burner" style="margin-bottom:20px;"/> 가열기구
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_dish" style="margin-bottom:20px;"/> 식기류
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_micro" style="margin-bottom:20px;"/> 전자레인지
                        </td>
                        <td>
                           <input class="checkbox-size" type="checkbox" name="amenity" value="a_aircon" style="margin-bottom:20px;"/> 에어컨                           
                        </td>
                        <td></td>
                     </tr>
                  </table>
               </div>
            </td>
            
            <td>
               <div class="tableWrap" style="width:100%; padding-left:50%;">
                  <h2>주소 찾기</h2>
                  <table>
                     <tr>
                        <td><input type="text" name="r_addr_main" id="addr" placeholder="기본주소" autocomplete="off" onclick="searchAddr()" required readonly/></td>
                        <td><input type="button" class="findBtn" onclick="searchAddr()" value="주소 찾기"/></td>
                     </tr>
                     <tr>
                        <td colspan="2"><input type="text" id="addr_detail" name="r_addr_detail" placeholder="상세주소" autocomplete="off"/></td>
                     </tr>
                  </table>
               </div>
            </td>
         
         </tr>
      </table>
         <div class="button">
               <button type="button" class="submitBtn" id="submitBtn">다음</button>
         </div>
   </form>
</div>
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
   
   $(document).ready(function(){
      $("#r_guests").focus();
      $("#selectAll").click(function(){
         if($("#selectAll").prop("checked")){
            $("input[name=amenity]").prop("checked", true);
         }
         else{
            $("input[name=amenity]").prop("checked", false);
         }
      })
   });
   
   $("#r_guests").keydown(function(e){
      console.log(e.keyCode);
        if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 110 || e.keyCode == 107 || e.keyCode == 189 || e.keyCode == 187){
            return false;              
        } 
    });
   
   $("#r_bedroom").keydown(function(e){
      if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 110 || e.keyCode == 107 || e.keyCode == 189 || e.keyCode == 187){
            return false;              
        } 
    });
   
   $("#r_bed").keydown(function(e){
      if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 110 || e.keyCode == 107 || e.keyCode == 189 || e.keyCode == 187){
            return false;              
        } 
    });
   
   $("#r_bath").keydown(function(e){
      if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 110 || e.keyCode == 107 || e.keyCode == 189 || e.keyCode == 187){
            return false;              
        } 
    });
   
   
   
   $("#submitBtn").click(function(){
      console.log("버튼 클릭");
      
      var r_guests = $("#r_guests").val();
      var r_bedroom = $("#r_bedroom").val();
      var r_bed = $("#r_bed").val();
      var r_bath = $("#r_bath").val();
      var addr = $("#addr").val();
      var addrLocal = addr.split(" ")[0];
      console.log(addrLocal);
      
      if(r_guests == null || r_guests == ""){
         alert("인원 수를 입력해 주세요.");
         $("#r_guests").focus();
         return;
      }
      
      if(r_bedroom == null || r_bedroom == ""){
         alert("침실 수를 입력해 주세요.");
         $("#r_bedroom").focus();
         return;
      }
      
      if(r_bed == null || r_bed == ""){
         alert("침대 수를 입력해 주세요.");
         $("#r_bed").focus();
         return;
      }
      
      if(r_bath == null || r_bath == ""){
         alert("욕실 수를 입력해 주세요.");
         $("#r_bath").focus();
         return;
      }
      
      if(addr == null || addr == ""){
         alert("주소 찾기를 클릭하여 주소를 입력해 주세요.");
         return;
      }
      
      if(addrLocal != '부산'){
         alert("부산 지역만 등록 가능합니다.")
         return;
      }
      
      $("#submitForm").submit();
   });
   
   function checkKey(code){
      
   }

   function searchAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                
                $("#addr").val(addr);
                $("#addr_detail").focus();
            }
        }).open();
    }
    
</script>
   
</body>
</html>