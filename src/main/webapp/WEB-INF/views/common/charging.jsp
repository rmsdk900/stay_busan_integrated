<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.btncancel, .btncharging {
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
	width: 70px;
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
}

.btncancel:hover, .btncharging:hover{
	background-color: #39ace7;
}

input[type=number] {
  background-color: #ccc;
  border: none;
  color: #0d0d0d;
  padding: 15px 20px;
  text-align: left;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
  width: 100%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
</style>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">충전</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="chargingForm" action="${pageContext.request.contextPath}/common/charging" method="POST">
      		금액 : 
      		<input type="number" step="10000" min="10000" name="charging" placeholder="금액을 입력하세요.">
      		<input type="hidden" value="${userInfo.u_no}" name="u_no"/>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btncancel" data-dismiss="modal">취소</button>
        <button type="button" id="chargingBtn" class="btncharging">충전</button>
      </div>
    </div>
  </div>
</div>

<script>
	$("#chargingBtn").click(function(){
		$("#chargingForm").submit();
	});
</script>