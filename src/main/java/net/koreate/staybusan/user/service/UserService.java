package net.koreate.staybusan.user.service;

import java.util.Map;

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
	
	void transformType(int u_no) throws Exception;

	Map<String, Object> getTransformUser(int page) throws Exception;

	Map<String, Object> getBanComments(int page) throws Exception;

	void banCommentCancel(int c_no) throws Exception;

	void banCommentDelete(int c_no) throws Exception;

	void transformAsk(int u_no) throws Exception;
}
