<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	padding:30px;
}

.submitBtn{
	
}
</style>
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
<body>
<div class="container">
    <div class="stepwizard">
        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step col-xs-3"> 
                <a href="resisterRoom1" type="button" class="btn btn-success btn-circle">1</a>
                <p class="mr-5"><small>Room Information</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="resisterRoom2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                <p class="mr-5"><small>Check In & Out</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="resisterRoom3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                <p class="mr-5"><small>Room Image</small></p>
            </div>
        </div>
    </div>
</div>
<div class="roomWrap">
	<form id="submitForm" action="resisterRoom2" method="post">
		<div class="tableWrap">
			<h2>방 기본 정보</h2>
			<table style="margin-bottom:50px;">
				<tr>
					<td>인원</td>
					<td><input id="r_guests" type="number" name="r_guests" min="0" value="0"/>명</td>
				</tr>
				<tr>
					<td>침실</td>
					<td><input id="r_bedroom" type="number" name="r_bedroom" min="0" value="0"/>개</td>
					<td>침대</td>
					<td><input id="r_bed" type="number" name="r_bed" min="0" value="0"/>개</td>
				</tr>
				<tr>
					<td>욕실 수</td>
					<td><input id="r_bath" type="number" name="r_bath" min="0" value="0"/>개</td>
				</tr>
			</table>
		</div>
		<div class="tableWrap">
			<h2>주소 찾기</h2>
			<table style="margin-bottom:50px;">
				<tr>
					<td><input type="text" name="r_addr_main" id="addr" placeholder="기본주소" required/></td>
					<td><input type="button" onclick="searchAddr()" value="주소 찾기"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" id="addr_detail" name="r_addr_detail" placeholder="상세주소"/></td>
				</tr>
			</table>
		</div>
		<div class="tableWrap">
			<h2>편의 시설</h2>
			<table style="margin-bottom:50px;">
				<tr>
					<td>
						<input type="checkbox" name="amenity" value="a_wifi"/> 와이파이
						<br/>
						<input type="checkbox" name="amenity" value="a_heating"/> 난방
						<br/>
						<input type="checkbox" name="amenity" value="a_TV"/> TV
						<br/>
						<input type="checkbox" name="amenity" value="a_kitchen"/> 주방
						<br/>
						<input type="checkbox" name="amenity" value="a_hairdryer"/> 헤어드라이기
						<br/>
						<input type="checkbox" name="amenity" value="a_iron"/> 다리미
						<br/>
					</td>
					<td>
						<input type="checkbox" name="amenity" value="a_hanger"/> 옷걸이
						<br/>
						<input type="checkbox" name="amenity" value="a_towel"/> 수건
						<br/>
						<input type="checkbox" name="amenity" value="a_elevator"/> 엘리베이터
						<br/>
						<input type="checkbox" name="amenity" value="a_parking"/> 주차장
						<br/>
						<input type="checkbox" name="amenity" value="a_washer"/> 샤워용품
						<br/>
						<input type="checkbox" name="amenity" value="a_cookware"/> 조리기구
					</td>
					<td>
						<input type="checkbox" name="amenity" value="a_refri"/> 냉장고
						<br/>
						<input type="checkbox" name="amenity" value="a_burner"/> 가열기구
						<br/>
						<input type="checkbox" name="amenity" value="a_dish"/> 식기류
						<br/>
						<input type="checkbox" name="amenity" value="a_micro"/> 전자레인지
						<br/>
						<input type="checkbox" name="amenity" value="a_aircon"/> 에어컨
					</td>
				</tr>
			</table>
			</div>
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