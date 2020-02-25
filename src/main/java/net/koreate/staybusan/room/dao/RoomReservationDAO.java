package net.koreate.staybusan.room.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.staybusan.room.vo.BookRoomDTO;
import net.koreate.staybusan.room.vo.BuyVO;
import net.koreate.staybusan.room.vo.RoomImgVO;
import net.koreate.staybusan.room.vo.RoomVO;

public interface RoomReservationDAO {

	@Select("SELECT * FROM rooms WHERE r_no=#{r_no} AND r_guests <1 " + 
			"(SELECT sum(b_guest)+#{b_guest} as sum_guests FROM buy WHERE r_no=#{r_no} AND b_status=1 AND b_date_from<=#{date} AND b_date_to>=#{date})")
	RoomVO canBook(@Param("r_no") int r_no,@Param("b_guest") int b_guest,@Param("date") String date)throws Exception;

	@Select("SELECT sum(b_guest) FROM buy WHERE r_no=#{r_no} AND b_status=1 AND b_date_from<=#{date} AND b_date_to>=#{date} ")
	Integer checkPeople(@Param("r_no") int r_no,@Param("date") String date)throws Exception;
	
	// 예약하기
	@Insert("INSERT INTO buy (r_no, u_no, b_date_from, b_date_to, b_guest, b_total_price, b_status) "
			+ " VALUES(#{r_no}, #{u_no}, #{b_date_from}, #{b_date_to}, #{b_guest}, #{b_total_price}, 1)")
	boolean bookingRoom(BuyVO vo)throws Exception;
	
	// 예치하기
	@Insert("INSERT INTO money (b_no, m_u_g_no, m_u_h_no, m_price) VALUES(#{b_no}, #{u_no}, #{host}, #{b_total_price})")
	void deposit(@Param("b_no") Integer b_no,@Param("u_no") int u_no,@Param("host") Integer host, @Param("b_total_price") int b_total_price)throws Exception;
	
	
	// 2020 02 22
	
	// 게스트한테서 돈이 빠져나가야 함. 
	@Update("UPDATE user SET u_balance=u_balance-#{b_total_price} WHERE u_no=#{u_no}")
	void pay(@Param("u_no") int u_no,@Param("b_total_price") int b_total_price)throws Exception;
	
	// 예약 건수 추가 
	@Update("UPDATE rooms SET r_bookedcnt=r_bookedcnt+1 WHERE r_no=#{r_no}")
	void updateBookedCnt(int r_no)throws Exception;
	
	// 예약자 이름 불러오기
	@Select("SELECT u_name FROM user WHERE u_no=#{u_no}")
	String whoIsBooker(int u_no)throws Exception;
	//예약된 곳의 방 정보 가져오기
	@Select("SELECT r_no, r_name, r_checkin, r_checkout FROM rooms WHERE r_no=#{r_no}")
	BookRoomDTO bookingRoomInfo(int r_no)throws Exception;
	//예약된 곳의 방 이미지 사진 하나 가져오기
	@Select("SELECT * FROM room_img WHERE r_no=#{r_no} ORDER BY r_i_no ASC LIMIT 1")
	RoomImgVO bookingRoomImg(int r_no) throws Exception;
}
