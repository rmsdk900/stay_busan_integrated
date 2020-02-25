package net.koreate.staybusan.user.service;

import java.util.List;
import java.util.Map;

import net.koreate.staybusan.room.vo.MessageVO;
import net.koreate.staybusan.user.vo.LoginDTO;
import net.koreate.staybusan.user.vo.UserVO;

public interface UserService {
	
	// 회원가입
		void signUp(UserVO vo) throws Exception;
		
		// 아이디 중복체크
		int uidCheck(String u_id) throws Exception;
		
		// 로그인
		UserVO signIn(LoginDTO dto) throws Exception;

		UserVO getUserById(String u_id) throws Exception;
		
		// 이하 추가.
		void transformType(int u_no) throws Exception;

		Map<String, Object> getTransformUser(int page) throws Exception;

		Map<String, Object> getBanComments(int page) throws Exception;

		void banCommentCancel(int c_no) throws Exception;

		void banCommentDelete(int c_no) throws Exception;

		void transformAsk(int u_no) throws Exception;

		List<MessageVO> getMessageMain(int u_no) throws Exception;

		MessageVO getMessageDetail(int m_no) throws Exception;

		Map<String, Object> getMessageBox(int u_no, int page) throws Exception;
}
