package net.koreate.staybusan.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.staybusan.room.vo.AmenityVO;
import net.koreate.staybusan.room.vo.BookRoomDTO;
import net.koreate.staybusan.room.vo.BuyVO;
import net.koreate.staybusan.room.vo.ModifyRoomPrimaryDTO;
import net.koreate.staybusan.room.vo.RoomClosedVO;
import net.koreate.staybusan.room.vo.RoomImgVO;
import net.koreate.staybusan.room.vo.RoomVO;
import net.koreate.staybusan.user.vo.UserVO;

public interface RoomDetailDAO {
	
	// 방 번호로 해당 방 정보 불러오기!
	@Select("SELECT * FROM rooms WHERE r_no=#{r_no}")
	RoomVO readRoomVO(int r_no) throws Exception;
	
	// 사진 리스트 불러오기 
	@Select("SELECT * FROM room_img WHERE r_no=#{r_no}")
	List<RoomImgVO> getImgList(int r_no) throws Exception;
	
	// 전체 예약 가능 기간 중 불가 기간 날짜 불러오기
	@Select("SELECT * FROM room_closed WHERE r_no=#{r_no}")
	List<RoomClosedVO> getClosedDay(int r_no) throws Exception;
	
	// 편의 시설 정보들 불러오기
	@Select("SELECT * FROM amenity WHERE r_no=#{r_no}")
	AmenityVO getAmenities(int r_no) throws Exception;
	
	// 호스트 정보 불러오기
	@Select("SELECT * FROM user WHERE u_type!=0 AND u_no=(SELECT u_no FROM rooms WHERE r_no=#{r_no})")
	UserVO getRoomOwner(int r_no)throws Exception;
	
	
	
	// 방 기본 정보 수정
	@Update("UPDATE rooms SET r_name=#{r_name}, r_guests=#{r_guests}, r_bedroom=#{r_bedroom}, r_bed=#{r_bed}, r_bath=#{r_bath}, r_desc=#{r_desc}, r_price=#{r_price} WHERE r_no=#{r_no}")
	void modifyRoomPrimary(ModifyRoomPrimaryDTO dto)throws Exception;

	@Update("UPDATE amenity SET a_wifi=#{a_wifi}, a_heating=#{a_heating}, a_TV=#{a_TV}, "
			+ " a_kitchen=#{a_kitchen}, a_hairdryer=#{a_hairdryer}, a_iron=#{a_iron}, "
			+ " a_hanger=#{a_hanger}, a_towel=#{a_towel}, a_elevator=#{a_elevator}, "
			+ " a_parking=#{a_parking}, a_washer=#{a_washer}, a_cookware=#{a_cookware}, "
			+ " a_refri=#{a_refri}, a_burner=#{a_burner}, a_dish=#{a_dish}, "
			+ " a_micro=#{a_micro}, a_aircon=#{a_aircon} WHERE r_no=#{r_no}")
	void modifyRoomAmenities(AmenityVO vo)throws Exception;
	// 모든 이미지 삭제
	@Delete("DELETE FROM room_img WHERE r_no=#{r_no}")
	void deleteAllImgs(int r_no)throws Exception;
	
	// 가장 최근의 구매 번호 가져오기
	@Select("SELECT LAST_INSERT_ID()")
	Integer getLastB_no()throws Exception;
	
	
	// 방 임시 삭제
	@Update("UPDATE rooms SET r_deleted=1 WHERE r_no=#{r_no}")
	void hideRoom(int r_no) throws Exception;
	
	

	// 찜 추가
	@Insert("INSERT INTO buy(u_no, r_no, b_status) VALUES(#{u_no}, #{r_no}, 0)")
	boolean likeRoom(@Param("u_no") int u_no, @Param("r_no") int r_no)throws Exception;
	
	// b_no로 buy 정보 가져오기 
	@Select("SELECT * FROM buy WHERE b_no=#{b_no}")
	BuyVO getBuyByNo(Integer b_no)throws Exception;

	// 찜 취소하기
	@Delete("DELETE FROM buy WHERE u_no=#{u_no} AND r_no=#{r_no} AND b_status=0")
	boolean dislikeRoom(@Param("u_no") int u_no, @Param("r_no") int r_no)throws Exception;
	
	// 찜 있는지 확인
	@Select("SELECT * FROM buy WHERE u_no=#{u_no} AND r_no=#{r_no} AND b_status=0")
	BuyVO isLike(@Param("u_no") int u_no, @Param("r_no") int r_no)throws Exception;
	
	

	
	
	
	
	
	
	
	
}
