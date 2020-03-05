<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.room_comment_profile {
	width: 100px;
	height: 100px;
}

.FilledImg {
	width: 100%;
	height: 100%;
}
/* 모달 배경 조정 */
.reportModals {
	display: none;
	position: fixed;
	z-index: 10;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}
/* Modal Content or Box */
.report-modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 70%;
}

.room_comments {
	margin-left: 10%;
}
</style>

<style>
	.btnOpenReply, .btnOpenReport, 
	.btnReplySubmit, .btnReplyClose, 
	.btnModComment, .btnDelComment {
		background-color: #56baed;
		border: none;
		color: white;
		padding: 5px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		text-transform: uppercase;
		font-size: 14px;
		height: 30px;
		width: 100px;
		-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
		box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
		-webkit-border-radius: 5px 5px 5px 5px;
		border-radius: 5px 5px 5px 5px;
		margin: 5px;
		-webkit-transition: all 0.3s ease-in-out;
		-moz-transition: all 0.3s ease-in-out;
		-ms-transition: all 0.3s ease-in-out;
		-o-transition: all 0.3s ease-in-out;
		transition: all 0.3s ease-in-out;
	}
</style>

<div class="room_comments">
	<div>
		<div>
			<h2>후기</h2>
		</div>
		<div class="room_comments_star_avg">
			<div class="starRev">
				<span class="avgStarL1"></span>
				<span class="avgStarR1"></span>
				<span class="avgStarL2"></span>
				<span class="avgStarR2"></span>
				<span class="avgStarL3"></span>
				<span class="avgStarR3"></span>
				<span class="avgStarL4"></span>
				<span class="avgStarR4"></span>
				<span class="avgStarL5"></span>
				<span class="avgStarR5"></span>
			</div>
			<span class="star_float">0</span>
		</div>
		<div class="room_comments_total">0 후기</div>
	</div>
	<br/>
	<div class="room_comments_list" >
		
	</div>
	
	<div class="room_comments_pagination">
		
	</div>
	<br/>
</div>
<!-- 댓글 신고 모달창 -->
<div id="reportModal" class="reportModals">
		<div class="report-modal-content">
			<div class="page-header">
				<h1>신고</h1>
			</div>
			<hr/>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="row">
							<div class="col-sm-12">
								<h2>신고 내용</h2>
								<div>
									<textarea name="b_c_reason" class="report_content" cols=30 rows=5></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hiddenReport">
			</div>
			<hr/>
			<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;"
			onclick="closeModal();">
				<span class="pop_bt modalCloseBtn" style="font-size:13pt;">닫기</span>
			</div>
			<div style="cursor:pointer;background-color:red;text-align: center;padding-bottom: 10px;padding-top: 10px;"
			onclick="reportSubmit();">
				<span class="pop_bt sendReportBtn" style="font-size:13pt;">신고하기</span>
			</div>
		</div>
	
</div>

