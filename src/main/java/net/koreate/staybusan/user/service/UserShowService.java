package net.koreate.staybusan.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import net.koreate.staybusan.user.vo.ModIntroDTO;
import net.koreate.staybusan.user.vo.UserVO;

public interface UserShowService {

	// 내 모든 정보를 가져오면 여기 넣기
	Map<String, Object> getMyInfo(int u_no)throws Exception;
	
	// 유저 자기소개 바꾸기
	UserVO modIntro(ModIntroDTO dto) throws Exception;

	// 유저의 원래 사진 이름 들고 오기
	String getOriginProfile(int u_no)throws Exception;
	// 유저 프로필 사진 바꾸기
	List<String> updateProfile(int u_no, String newProfile)throws Exception;

}
