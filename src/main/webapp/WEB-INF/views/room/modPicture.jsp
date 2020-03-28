<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사진 더 보기 모달 -->
<style>
.pictures_add {
	/* width:100%;
		height: 150px; */
	/* border:1px solid gray;
		background-image: url("${pageContext.request.contextPath}/resources/img/box.png");
		background-repeat: no-repeat;
		background-size: auto;
		margin:auto; */
	
}

.pictures_add img {
	width: 100%;
}

.mod_imgs {
	width: 100%;
}

.mod_imgs img {
	width: 100%;
}

.pictures_preview {
	display: grid;
	grid-template-columns: auto auto auto;
	grid-gap: 1%;
	margin: 1% 0;
}

.btncancel, .btnclose {
	background-color: #56baed;
	border: none;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 15px;
	height: 48px;
	width: 100px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	margin-top: 20px;
	margin-bottom: 20px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.delete {
	background-color: #56baed;
	border: none;
	color: white;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 13px;
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

.delBtn {
	background-color: #56baed;
}

.delBtn i {
	color: white;
}

.pictures_add input[type="file"] {
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
</style>
<div class="modal fade" id="modPicture" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">사진 편집</h4>
				<button type="button" class="delete" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>
			<div class="modal-body">
				<div class="pictures_add">
					<img id="addImageBtn" src="${pageContext.request.contextPath}/resources/img/box.png"
						alt="이미지 업로드" />
					<input type='file' accept='image/*' id='addImage'/>
				</div>
				<form id="modifyForm" action="modRoomImgs" method="post">
					<input type="hidden" name="u_no" value="${roomInfo.roomVO.u_no}" />
					<input type="hidden" name="r_no" value="${roomInfo.roomVO.r_no}" />
					<div class="pictures_preview"></div>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btncancel" data-dismiss="modal">Close</button>
				<button type="button" class="btnclose" id="updateImgBtn">변경</button>
			</div>
		</div>
	</div>
</div>