<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.carousel-item {
		text-align: center;
	}
	.picture-modal {
		background-color: #dbdbdb;
	}
	
.btnClosePic {
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
	width: 200px;
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
.btnClosePic:hover {
	background-color: #39ace7;
} 
	
</style>
<!-- 사진 더 보기 모달 -->
<div class="modal fade" id="roomPicturesModal" 
tabindex="-1" role="dialog" 
aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">사진 더 보기</h4>
				<button type="button" class="close" 
				data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
				
			</div>
			<div class="modal-body picture-modal">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <!-- <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
				  </ol>
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner">
				    <!-- <div class="carousel-item active">
				      <img src="..." alt="...">
				      <div class="carousel-caption">
				        ...
				      </div>
				    </div>
				    <div class="item">
				      <img src="..." alt="...">
				      <div class="carousel-caption">
				        ...
				      </div>
				    </div>
				    ... -->
				  </div>
				
				  <!-- Controls -->
				  <a class="carousel-control-prev" href="#carousel-example-generic" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carousel-example-generic" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>				
								
			</div>
			<div class="modal-footer">
				<button type="button" class="btnClosePic" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>