<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 금삼이 모달 css -->
<style>

#transformModal {
 	display: none;
}

.modal {
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

.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	border-radius: 10px;
}

</style>
<!-- 전환 버튼 클릭시 띄울 modal -->
	<div id="transformModal" class="modal">
		<div class="modal-content">
			<h3>게스트 호스트 전환</h3>
			<div style="text-align: center; margin: 20px;">
				<div>
					<textarea readonly style="resize: none;">이용약관 아무나 써줘....</textarea>
				</div>
				<div>
					<input type="checkbox" id="checkbox" /> 이용약관에 동의해 주세요.
				</div>
				&nbsp;&nbsp;&nbsp; 
				<input type="button" id="transformSubmitBtn" class="btn btn-primary" data-no="${userInfo.u_no}" value="전환" /> 
				&nbsp;&nbsp;&nbsp; 
				<input type="button" id="transformCancelBtn" class="btn btn-danger" value="닫기" />
			</div>
		</div>
	</div>
	<script>
		// 쪽지 추가
		
		
		// 기존
		$("#transform").click(function(event) {
			event.preventDefault();
			$("#transformModal").css("display", "flex");
		});
		
		var boolInfo = false;

		//   modal 신청취소 취소하기 버튼 클릭
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
		
		$("#checkbox").on("change",function(){
			var isChecked = $(this).is(":checked");
			if(isChecked){
				boolInfo = true;
			}else{
				boolInfo = false;
			}
		});
		
		
		$("#transformCancelBtn").click(function() {
			$("#transformModal").css("display", "none");
		});
	</script>