<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/header.jsp" %>


<title>Insert title here</title>
<script> var contextPath = '${pageContext.request.contextPath}'; </script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
body {
	margin-top: 100px;
	line-height: 1.6
}

.container {
	width: 500px;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #56baed;
	color: #222;
}

.tab-content {
	display: none;
	background: #56baed;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}

.banData {
	display: none;
}

.userListPageWrap {
	width: 100%;
}

.userListPageWrap li {
	float: left;
	padding: 3px;
	border: 1px solid skyblue;
	margin: 3px;
	list-style: none;
}

.userListPageWrap li a {
	margin: 3px;
	text-decoration: none;
}

.banCommentsPageWrap {
	width: 100%;
}

.banCommentsPageWrap li {
	float: left;
	padding: 3px;
	border: 1px solid skyblue;
	margin: 3px;
	list-style: none;
}

.banCommentsPageWrap li a {
	margin: 3px;
	text-decoration: none;
}
.transformBtn, .banCommentCancel, .banCommentDelete{
	background-color: #56baed;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 15px;
	height: 40px;
	width: 80px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
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
<!-- url 접근 막기 -->
<%
	String strReferer = request.getHeader("referer");
	if (strReferer == null) {
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
	<div class="container" style="float:left; margin-top:30px; margin-left:150px;">
		<h4>호스트 전환 게스트 관리</h4>
		<div id="transformUserList">
					
		</div>			
		
		<div id="userListPageWrap" class="userListPageWrap">
		
		</div>
		<br><br>
		<h4>댓글 신고 관리</h4>
		<div id="banCommetsList">
					
		</div>			
		
		<div id="banCommentsPageWrap" class="banCommentsPageWrap">
		
		</div>
	</div>
<script>

	var userListPage = 1;
	var banPage = 1;

	$(document).ready(function(){
		
		getUserList(userListPage);
		getBanPageList(banPage);
		
		$("#banCommetsList").on("click",".banCommentDetail",function(){
			$(this).parent().parent().next().find(".banData").toggle("slow");
		});
		
		$("#banCommetsList").on("click",".banCommentCancel",function(){
			var c_no = $(this).attr("data-no");
			
			$.ajax({
				type : "POST",
				data : {
					c_no : c_no
				},
				url : contextPath+"/user/banCommentCancel",
				success : function(data){
					alert(data);
					getBanPageList(banPage);
				},
				error : function(res){
					alert(res.responseText);
				}
			});
			
		});
		

		$("#banCommetsList").on("click",".banCommentDelete",function(){
			var c_no = $(this).attr("data-no");
			
			$.ajax({
				type : "POST",
				data : {
					c_no : c_no
				},
				url : contextPath+"/user/banCommentDelete",
				success : function(data){
					alert(data);
					getBanPageList(banPage);
				},
				error : function(res){
					alert(res.responseText);
				}
			});
			
		});
		
		$("#transformUserList").on("click",".transformBtn",function(){
			var u_no = $(this).attr("data-no");
			
			$.ajax({
				type : "POST",
				data : {
					u_no : u_no
				},
				url : contextPath+"/user/transform",
				success : function(data){
					alert(data);
					getUserList(userListPage);
				},
				error : function(res){
					alert(res.responseText);
				}
			});
		});
	});
	
	
	// 전환 유저 페이지
	function getUserList(page){
		$.getJSON(contextPath+"/user/transform/"+page,function(data){
			
			console.log(data);
			
			var html = "";
			html += "<table>";
			if(data.list== null || data.list == ""){
				html += "<tr><th>전환을 신청한 게스트가 없습니다.<th><tr>";
			}else{
				html += "<tr>";
				html += "<th style='width:100px;'>이름</th>";
				html += "<th style='width:100px;'>등록일</th>";
				html += "<th style='width:100px;'></th>";
				html += "</tr>";
				$(data.list).each(function(){
					
					var date = new Date(this.u_regdate).yyyymmdd();
					
					html += "<tr>";
					html += "<td><a href='"+contextPath+"/user/show?u_no="+this.u_no+"'>"+this.u_name+"</a></td>";
					html += "<td>"+date.toString()+"</td>";
					html += "<td>";
					html += "<input type='button' class='transformBtn' data-no='"+this.u_no+"' value='전환'/>";
					html += "</td>";
					html += "</tr>";
				});
			}
			html += "</table>";
			$("#transformUserList").html(html);
			
			printPageUser(data.pageMaker);
		});
	}
	
	// 신고 페이지
	function getBanPageList(page){
		$.getJSON(contextPath+"/user/banPage/"+page,function(data){
			
			console.log(data);
			
			var html = "";
			html += "<table>";
			if(data.banComments == null || data.banComments == ""){
				html += "<tr><th>신고내역이 없습니다.<th><tr>";
			}else{
				html += "<tr><th colspan=2>신고받은 댓글 내용</th></tr>";
				$(data.banComments).each(function(){
					
					var date = new Date(this.b_c_date).yyyymmdd();
					
					html += "<tr>";
					html += "<td>"+this.c_content+"</td>";
					html += "<td><input type='button' class='banCommentDetail' value='내용확인'/></td>";
					html += "</tr>";
					
					html += "<tr>";
					
					html += "<td colspan=2>";
					
					html += "<div class='banData'>";
					
					html += "<div style='border:1px solid #56baed;'>";
					
					html += "<div>";
					
					html += "<table>";
					
					html += "<tr>";
					html += "<th>신고받은 사람</th>";
					html += "<th>신고받은 댓글</th>";
					html += "</tr>";
					
					html += "<tr>";
					html += "<td>"+this.b_bad_person_name+"</td>";
					html += "<td>"+this.c_content+"</td>";
					html += "</tr>";
					
					html += "</table>";
					
					html += "</div>";
					
					html += "<div>";
					
					html += "<table>";
					
					html += "<tr>";
					html += "<td>신고자</td>";
					html += "<td>"+this.b_reporter_name+"</td>";
					html += "</tr>";
					
					html += "<tr>";
					html += "<td>신고일</td>";
					html += "<td>"+date+"</td>";
					html += "</tr>";
					
					html += "<tr>";
					html += "<td>신고사유</td>";
					html += "<td>"+this.b_c_reason+"</td>";
					html += "</tr>";
					
					html += "</table>";
					
					html += "</div>";
					
					html += "</div>";
					
					html += "<input type='button' class='banCommentCancel' data-no='"+this.c_no+"' value='신고취소'/>";
					
					html += "<input type='button' class='banCommentDelete' data-no='"+this.c_no+"' value='댓글 삭제'/>";
					
					html += "</div>";
					html += "</td>";
					html += "</tr>";
				});
			}
			html += "</table>";
			$("#banCommetsList").html(html);
			
			printPageComment(data.pageMaker);
		});
	}
	
	function printPageComment(pm){
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
		$("#banCommentsPageWrap").html(str);
	}
	
	function printPageUser(pm){
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
		$("#userListPageWrap").html(str);
	}
	
	$("#userListPageWrap").on("click","li a",function(event){
		event.preventDefault();
		userListPage = $(this).attr("href");
		getUserList(userListPage);
	});
	
	$("#banCommentsPageWrap").on("click","li a",function(event){
		event.preventDefault();
		banPage = $(this).attr("href");
		getBanPageList(banPage);
	});
	
	Date.prototype.yyyymmdd = function()
	   {
	       var yyyy = this.getFullYear().toString();
	       var mm = (this.getMonth() + 1).toString();
	       var dd = this.getDate().toString();
	    
	       return yyyy +"-"+ (mm[1] ? mm : '0'+mm[0]) +"-"+ (dd[1] ? dd : '0'+dd[0]);
	   }
</script>
</body>
</html>