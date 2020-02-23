<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.carousel-inner {
		display:flex;
		justify-content: center;
		align-items: center;
	}
</style>
<!-- 사진 더 보기 모달 -->
<div class="modal fade" id="roomPicturesModal" 
tabindex="-1" role="dialog" 
aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" 
				data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">사진 더 보기</h4>
			</div>
			<div class="modal-body">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <!-- <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
				  </ol>
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <!-- <div class="item active">
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
				  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>				
								
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>