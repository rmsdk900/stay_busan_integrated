package net.koreate.staybusan.room.service;

import java.util.List;

import net.koreate.staybusan.room.vo.BookRoomDTO;
import net.koreate.staybusan.room.vo.BuyVO;
import net.koreate.staybusan.room.vo.RoomImgVO;

public interface RoomReservationService {

	// 클라이언트가 적은 인원이 들어가도 가능한지.
	List<String> howMany(BuyVO vo)throws Exception;
	
	// 현재 숙박하고 있는 숫자 뽑아내자
	Integer checkPeople(BuyVO vo) throws Exception;
	
	// 방 예약하기 
	boolean bookingRoom(BuyVO vo)throws Exception;
	
	
	// 예약 페이지의 예약자 이름
	String whoIsBooker(int u_no)throws Exception;
	// 예약 페이지의 방 정보
	BookRoomDTO bookingRoomInfo(int r_no)throws Exception;
	// 예약 페이지의 방 사진
	RoomImgVO bookingRoomImg(int r_no)throws Exception;
	
	
}
