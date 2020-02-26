<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 400px;
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
	white-space: pre;
}

.modalBtn {
	margin: 0 auto;
	align: center;
	width: 100%;
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