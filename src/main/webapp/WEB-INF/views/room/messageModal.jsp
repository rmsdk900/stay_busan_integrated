<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#recipient-name {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 13px;
   margin: 5px;
   width: 40%;
   border: 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
}

#message-text {
   background-color: #f6f6f6;
   border: none;
   color: #0d0d0d;
   padding: 10px;
   text-align: left;
   text-decoration: none;
   display: inline-block;
   font-size: 12px;
   width: 100%;
   height: 250px; border : 2px solid #f6f6f6;
   -webkit-transition: all 0.5s ease-in-out;
   -moz-transition: all 0.5s ease-in-out;
   -ms-transition: all 0.5s ease-in-out;
   -o-transition: all 0.5s ease-in-out;
   transition: all 0.5s ease-in-out;
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   white-space: pre;
   border: 2px solid #f6f6f6;
}

#btnSendMsg, #btnClose {
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
   width: 350px;
   -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
   -webkit-border-radius: 5px 5px 5px 5px;
   border-radius: 5px 5px 5px 5px;
   margin: 5px 20px 40px 20px;
   -webkit-transition: all 0.3s ease-in-out;
   -moz-transition: all 0.3s ease-in-out;
   -ms-transition: all 0.3s ease-in-out;
   -o-transition: all 0.3s ease-in-out;
   transition: all 0.3s ease-in-out;
}

#btnSendMsg:hover, #btnClose{
   background-color: #39ace7;
}
</style>

<div class="modal fade" id="roomMessageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title" id="exampleModalLabel">호스트</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="" method="post">
          <div class="form-group">
            <label for="recipient-name" class="control-label">받는 사람 :</label>
            <input type="text" id="recipient-name" readonly>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">보내는 내용 :</label>
            <textarea id="message-text" name="m_content" placeholder="내용을 입력해주세요" style="resize:none;"></textarea>
          </div>
          <input type="hidden" name="r_no" id="message_r_no" value="${roomInfo.roomVO.r_no}" />
          <input type="hidden" name="m_receiver" id="m_receiver" value="${roomInfo.hostVO.u_no}"/>
          <!-- 여긴 일단 임시로 들어온 사람이 호스트 번호랑 같게 강제로 잡아두자 -->
          <input type="hidden" name="m_sender" id="m_sender" value="${userInfo.u_no}" />
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="btnSendMsg">메세지 보내기</button>
        <button type="button" id="btnClose" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>