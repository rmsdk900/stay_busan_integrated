<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 금삼이 모달 css -->
<style>

#transformModal {
 	display: none;
}

.modalGs {
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

.messageWrap{
	display : none;
	position : absolute;
	color : black;
	list-style:none;
   	padding-left:0px;
}

.messageWrap li{
	style : none;
}

</style>
<!-- 전환 버튼 클릭시 띄울 modal -->
	<div id="transformModal" class="modalGs">
		<div class="modal-contentGs">
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
	<!-- 쪽지 탭에서 내용 클릭시 띄울 modal (추가) -->
	<div id="messageModal" class="modalGs">
		<div class="modal-contentGs">
			<h3>쪽지 내용</h3>
			<div style="text-align : center; margin:20px">
				<table id="messageModalTable">
				
				</table>
				<table>
					<tr>
						<td>
							<input type="text" name="m_content" id="m_content"/><input type="button" id="sendBtn" value="답장보내기"/>
							<br/><input type="button" id="messageCancelBtn" class="btn btn-danger" value="닫기" />
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	
	<script>
	
		var u_no = ${userInfo.u_no};
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
						html += "<td>";
						html += data.m_sender_name;
						html += "</td>";
						html += "</tr>";
						html += "<tr>";
						html += "<td>";
						html += "해당 방 이름 : ";
						html += "</td>";
						html += "<td>";
						html += data.r_name;
						html += "</td>";
						html += "</tr>";
						html += "<tr>";
						html += "<td colspan=2>";
						html += "내용";
						html += "</td>";
						html += "</tr>";
						html += "<tr>";
						html += "<td colspan=2>";
						html += "<textarea>"+data.m_content+"</textarea>";
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
			var m_sender = ${userInfo.u_no};
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
						html += "<li>";
						html += "<img src='${pageContext.request.contextPath}/displayFile?fileName="+this.m_sender_profile+"'/>";
						html += "<a class='messageDetail' href="+this.m_no+">"+m_content+"</a>";
						html += "</li>";
					});
					html += "<a href='"+contextPath+"/user/messageBox'>쪽지함으로 이동</a>"
					$(".messageWrap").html(html);
				},
				error : function(res){
					console.log(res.responseText);
				}
			});
		}
	</script>