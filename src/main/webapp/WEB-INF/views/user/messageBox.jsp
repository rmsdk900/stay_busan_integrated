<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<style>
#deleteMsg{
	background-color: #56baed;
	border: none;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 15px;
	height: 40px;
	width: 4%;
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
	margin-left:55%;
}

.mWrap {
	margin-left: 9.5%;
}

.mTable {
	width: 60%;
}

.mTable tr {
	border-bottom: 1px solid #0d0d0d;
}

.pagingWrap {
	width: 100%;
}

.pagingWrap li {
	float: left;
	padding: 3px;
	border: 1px solid skyblue;
	margin: 3px;
	list-style: none;
}

.pagingWrap li a {
	margin: 3px;
	text-decoration: none;
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

.modal table {
	margin: auto;
	border-spacing: 10px;
}

.modal-content {
	position: relative;
	width: 400px;
	height: 550px;
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	border-radius: 10px;
}

.readMessage {
	color: gray;
}

.unReadMessage {
	color: red;
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

#boxMessageModalTable {
	width : 100%;
	align : left;
}

.modalTableDiv {
	align: left;
	border: 1px solid red;
	height: 100%;
}

.mboxImg {
	width: 60px;
	height: 60px;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 1px solid #56baed;
	border-radius: 50px;
}

#boxM_content {
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

#boxSendBtn, #boxMessageCancelBtn { /* 쪽지 모달 답장 btn */
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
</style>
<div class="mWrap">
	<div id="messageWrap">
	
	</div>


	<div id="pagingWrap" class="pagingWrap" style="margin-top:50px;">
	
	</div>
</div>

	<div id="boxMessageModal" class="modal">
		<div class="modal-content">
			<h3>쪽지 내용</h3>
			<div style="text-align : left; margin:20px">
				<table id="boxMessageModalTable">
				
				</table>
				<table id="messageModalTable2">
					<tr><td colspan=4><hr/></td></tr>	
					<tr>
						<td colspan=4>
							<input type="text" name="m_content" id="boxM_content" placeholder="답장을 입력해주세요"/>
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
								<input type="button" id="boxSendBtn" value="답장보내기"/>
							<br/><br/>
								<input type="button" id="boxMessageCancelBtn" value="닫기" />
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

<script>
	
	$(function(){
		var page =1;
		var u_no = ${userInfo.u_no};
		
		getMessageList(page);
		
		$("#messageWrap").on("click","#deleteMsg",function(){
			if($("input:checkbox[name='m_no']:checked").length == 0){
				alert("삭제할 메일을 체크해 주세요.");
				return;
			}
			
			var result = confirm("선택하신 메세지를 삭제하시겠습니까?");
				
			if(result){
				$("input:checkbox[name='m_no']:checked").each(function(){
					var m_no = parseInt($(this).val());
					
					$.ajax({
						type: "delete",
						url: contextPath+"/messages/delete",
						headers: {
							"Content-Type": "application/json",
							"X-HTTP-Method-Override" : "DELETE"
						},
						data: JSON.stringify({
							m_no : m_no
						}),
						dataType: "text",
						success: function(data){
							getMessageList(page);
						}
					});
				})
			}else{
				return;
			}
			
			
		});
		
		function getMessageList(page){
			$.getJSON(contextPath+"/user/messageBox/"+page+"/"+u_no,function(data){
				
				console.log(data);
				
				var html = "";
					html += "<input type='button' id='deleteMsg' value='삭제'/>"
					html += "<table class='mTable'>";
				if(data.list== null || data.list == ""){
					html += "<tr><th colspan=4>쪽지가 없습니다.<th><tr>";
				}else{
					html += "<tr>";
					html += "<th></th>";
					html += "<th>프로필</th>";
					html += "<th>보낸사람</th>";
					html += "<th>쪽지내용</th>";
					html += "<th>보낸날짜</th>";
					html += "</tr>";
					$(data.list).each(function(){
						html += "<tr>";
						html += "<td>";
						html += "<input type='checkbox' name='m_no' value='"+this.m_no+"'/>";
						html += "</td>";
						html += "<td><img class='mboxImg' src='${pageContext.request.contextPath}/displayFile?fileName="+this.m_sender_profile+"'/></td>";
						if(this.m_read == 1){
							html += "<td><div class='readMessage'>"+this.m_sender_name+"</div></td>";
							html += "<td><div class='readMessage'><a class='messageDetail' href="+this.m_no+">"+this.m_content+"</a></div></td>";	
						}else{
							html += "<td><div class='unReadMessage'>"+this.m_sender_name+"</div></td>";
							html += "<td><div class='unReadMessage'><a class='messageDetail' href="+this.m_no+">"+this.m_content+"</a></div></td>";
						}
						html += "<td>";
		                html += getDate(this.m_regdate);
		                html += "</td>";
						html += "</tr>";
					});
				}
					html += "</table>";
				$("#messageWrap").html(html);
				
				printPage(data.pageMaker);
			});
		}
		
		function printPage(pm){
			var str = "";
			
			if(pm.prev){
				str += "<li><a href='"+(pm.startPage - 1)+"'> << </a></li>";
			}
			
			for(var i=pm.startPage; i <= pm.endPage; i++){
				var strClass = pm.cri.page == i ? ' class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
			
			if(pm.next){
				str += "<li><a href='"+(pm.endPage + 1)+"'> >> </a></li>";
			}
			$("#pagingWrap").html(str);
		}
		
		$("#pagingWrap").on("click","li a",function(event){
			event.preventDefault();
			page = $(this).attr("href");
			getMessageList(page);
		});
		
		$("#boxMessageCancelBtn").click(function() {
			getMessageList(page);
			$("#boxMessageModal").css("display", "none");
		});
		
		$("#boxSendBtn").click(function(){
			var target = $(this).parent().parent().parent().parent().parent();
			
			var m_receiver = target.find("#m_receiver").val();
			var r_no = target.find("#r_no").val();
			var m_sender = u_no;
			var m_content = $("#boxM_content").val();
			
			if(m_content == null || m_content == ""){
				alert("답장 내용을 입력해 주세요.");
				return;
			}
			
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
					$('#boxMessageModal').css("display",'none');
					getMessageList(page);
				}
			});
		});
		
		$("#messageWrap").on("click",".messageDetail",function(event){
			event.preventDefault();
			var m_no = $(this).attr("href");
			console.log(m_no);
			
			$("#boxM_content").val("");
			
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
						html += "<td>";
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
						html += "<textarea style='width:100%' class='mModalTarea'>"+data.m_content+"</textarea>";
						html += "<input type='hidden' id='m_receiver' value='"+data.m_sender+"'/>"
						html += "<input type='hidden' id='r_no' value='"+data.r_no+"'/>"
						html += "</td>";
						html += "</tr>";
						$("#boxMessageModalTable").html(html);
				},
				error : function(res){
					console.log(res.responseText);
				}
			});
			$("#boxMessageModal").css("display", "flex");
		});
		
		// 날짜 표현 메소드
		   function getDate(date){
		      var dateObj = new Date(date);
		      var year = dateObj.getFullYear();
		      var month = dateObj.getMonth()+1;
		      var date = dateObj.getDate();
		      var hour = dateObj.getHours() > 9 ? dateObj.getHours() : "0"+dateObj.getHours();
		      var minutes = dateObj.getMinutes() > 9 ? dateObj.getMinutes() : "0"+dateObj.getMinutes();
		      return year+"-"+month+"-"+date+" "+hour+":"+minutes;
		   }
	});
</script>

</body>
</html>