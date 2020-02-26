package net.koreate.staybusan.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.staybusan.room.vo.RoomVO;
import net.koreate.staybusan.user.vo.ModIntroDTO;
import net.koreate.staybusan.user.vo.UserVO;

public interface UserShowDAO {

	// 유저 번호로 유저 기본 정보 불러오기
	@Select("SELECT * FROM user WHERE u_no=#{u_no}")
	UserVO getUser(int u_no)throws Exception;
	
	// 유저 번호로 방 리스트 들고 오기
	@Select("SELECT * FROM rooms WHERE u_no=#{r_no}")
	List<RoomVO> getHostingRooms(int u_no)throws Exception;

	
	// 유저의 자기소개 바꾸기
	@Update("UPDATE user SET u_introduce=#{u_introduce} WHERE u_no=#{u_no}")
	void modIntro(ModIntroDTO dto)throws Exception;
	
	// 유저의 원래 프로필 사진 들고오기
	@Select("SELECT u_profile FROM user WHERE u_no=#{u_no}")
	String getOriginProfile(int u_no)throws Exception;
	
	// 프로필 변경
	@Update("UPDATE user SET u_profile=#{newProfile} WHERE u_no=#{u_no}")
	void updateProfile(@Param("u_no")int u_no,@Param("newProfile") String newProfile);
	
	//프로필 사진 불러오기
	@Select("SELECT u_profile FROM user WHERE u_no=#{u_no}")
	List<String> getUserProfile(int u_no);

}
