package net.koreate.staybusan.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.staybusan.common.dto.MoneyDTO;
import net.koreate.staybusan.user.vo.UserVO;

public interface TaskDAO {

	@Select("SELECT u_no FROM rooms group by u_no")
	List<Integer> getHostUno();

	@Select("SELECT count(r_no) FROM rooms WHERE u_no = #{hostUnoi}")
	int getCountRooms(int hostUnoi);
	
	@Select("SELECT r_no FROM rooms WHERE u_no = #{hostUnoi}")
	List<Integer> getRoomRno(int hostUnoi);
	
	@Select("SELECT r_star FROM rooms WHERE r_no = #{r_no} ")
	double getStar(int r_no);

	@Select("SELECT count(c_star) FROM comment WHERE r_no = #{r_no}")
	double getStarCount(int r_no);

	@Select("UPDATE buy SET b_status = 2 WHERE b_date_from <= now()")
	void getPastList();

	@Select("SELECT count(*) FROM comment WHERE r_no = #{r_no}")
	int getCommentCount(int r_no);

	@Select("SELECT count(*) FROM buy WHERE r_no = #{r_no}")
	int getBuyCount(int hostUnoi);

	@Update("UPDATE user SET u_type=2 WHERE u_no = #{hostUnoi}")
	void upgradeGrade(int hostUnoi);

	// 유저 프로필 불러오기
	@Select("SELECT u_profile FROM user")
	List<String> existedUserProfiles();
	
	// 예약날짜 넘은 녀석들의 b_no 불러오기
	@Select("SELECT b_no FROM buy WHERE b_date_from<=now() AND b_status=1")
	List<Integer> getBuyNos()throws Exception;
	
	// money 테이블에서 호스트 번호랑 돈 가져오기
	@Select("SELECT m_u_h_no, m_price FROM money WHERE b_no=#{i}")
	MoneyDTO getMoney(int i)throws Exception;

	// 호스트한테 돈 주기
	@Update("UPDATE user SET u_balance = u_balance + #{m_price} WHERE u_no = #{m_u_h_no}")
	void transfer(MoneyDTO money)throws Exception;
	
//	// 테스트용
//	@Select("SELECT * FROM user WHERE u_no=#{m_u_h_no}")
//	UserVO getResult(int m_u_h_no)throws Exception;


	
	
	
	

	

}
