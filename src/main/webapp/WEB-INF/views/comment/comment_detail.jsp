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


.room_comments {
	margin-left: 10%;
}
</style>

<style>
	.btnOpenReply, .btnOpenReport, 
	.btnReplySubmit, .btnReplyClose, 
	.btnModComment, .btnDelComment,
	.btnModCommentSubmit, .btnModCommentClose {
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
<style>
#reportModal {
   display: none;
}

/* //////////////////쪽지 모달 //////////////////// */
.reportModals { /* 쪽지 모달 감싸는 DIV */
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

.report-modal-content {
   position: relative;
   width: 500px;
   height: 550px;
   background-color: #fefefe;
   margin: auto;
   padding: 20px;
   border: 1px solid #888;
   border-radius: 10px;
}


</style>

<style>

.report_content {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 13px;
   width: 100%;
   height: 53%;
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

#reportSubmitBtn, #reportCancelBtn{
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
   width: 30%;
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

#reportSubmitBtn:hover, #reportCancelBtn:hover{
   background-color: #39ace7;
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
	<br/>
	<div class="room_comments_pagination">
		
	</div>
	<br/>
</div>


<!-- 댓글 신고 모달창 - 수정중 -->
	<div id="reportModal" class="reportModals">
      <div class="report-modal-content">
         <h3>신고</h3>
         <hr/>
         <div style="text-align: center; margin: 20px;">
         	<h4>신고한 이유</h4>
            <div>
               <textarea name="b_c_reason" class="report_content" style="resize: none; height:270px;"></textarea>
            </div>
            <div class="hiddenReport">
			</div>
            <input type="button" id="reportSubmitBtn" onclick="reportSubmit();" value="신고" /> 
            <input type="button" id="reportCancelBtn" onclick="closeModal();" value="닫기" />
         </div>
      </div>
   </div>




