<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Charging</h5>
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" id="chargingBtn" class="btn btn-primary">충전</button>
      </div>
    </div>
  </div>
</div>

<script>
	$("#chargingBtn").click(function(){
		$("#chargingForm").submit();
	});
</script>